
import os
import io
import json
import codecs
import base64
import json.scanner
import requests
from random import randint
from datetime import datetime
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives import padding
from cryptography.hazmat.primitives import serialization
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.asymmetric import rsa
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
import cryptography.hazmat.primitives.asymmetric.padding as assim_padding
import cryptography.exceptions
from cryptography.hazmat.primitives.kdf.pbkdf2 import PBKDF2HMAC
from cryptography.hazmat.primitives.hmac import HMAC

from flask import jsonify



#####################################################################################
##################################### VARIABLES #####################################
#####################################################################################

global KEY_SIZE
global str2Alg
global str2AlgSize
global str2AlgSizeIV

KEY_SIZE = 20

avaiable_algorithms = {
    "AES" : algorithms.AES,
    "AES128" : algorithms.AES128,
    "AES256" : algorithms.AES256,
#    "Blowfish" : algorithms.Blowfish,
#    "CAST5" : algorithms.CAST5,
    "Camellia" : algorithms.Camellia,
#    "SEED" : algorithms.SEED,
    "SM4" : algorithms.SM4,
#    "TripleDES" : algorithms.TripleDES,
    }

algorithm_key_size:dict[str,int]= {
    "AES" : 32,
    "AES128" : 16,
    "AES256" : 32,
    "ARC4" : 16,
    "Blowfish" : 32,
    "CAST5" : 16,
    "ChaCha20" : 64,
    "Camellia" : 32,
    "IDEA" : 16,
    "SEED" : 16,
    "SM4" : 16,
    "TripleDES" : 24,
    }

algorithm_iv_size: dict[str, int] = {
    "AES": 16,
    "AES128": 16,
    "AES256": 16,
    "ARC4": 0,  # ARC4 does not use an IV
    "Blowfish": 8,
    "CAST5": 8,
    "ChaCha20": 12,  # ChaCha20 typically uses a 12-byte IV
    "Camellia": 16,
    "IDEA": 8,
    "SEED": 16,
    "SM4": 16,  # SM4 typically uses a 16-byte IV
    "TripleDES": 8,  # TripleDES typically uses an 8-byte IV
}

rep_opt_private_key = rsa.generate_private_key(
    public_exponent=65537,
    key_size=2048
)

public_key = rep_opt_private_key.public_key()



#####################################################################################
##################################### FUNCTIONS #####################################
#####################################################################################
def generate_new_token(token:bytes, salt:bytes):
    return mic_calc(token+salt)

def bait_generartor(max_size = 100*8):
    for i in range(1000000):
        size = randint(40*8, max_size)
        bait = randint(0, 2**size-1)
        bait = bait.to_bytes((size//8)+(1), byteorder="little")

def generate_credentials():
    private_key = rsa.generate_private_key(
        public_exponent=65537,
        key_size=2048,
        backend=default_backend(),
    )
    return private_key, private_key.public_key()
  
def serialize_private_key(private_key):
    pem = private_key.private_bytes(
        encoding=serialization.Encoding.PEM,
        format=serialization.PrivateFormat.TraditionalOpenSSL,
        encryption_algorithm=serialization.NoEncryption()
    )
    return pem

def serialize_public_key(public_key):
    public_pem = public_key.public_bytes(
        encoding=serialization.Encoding.PEM,
        format=serialization.PublicFormat.SubjectPublicKeyInfo
    )
    return public_pem

def hybrid_encryption(public_key, data, alg_name):
    encrypted_message, symmetric_key = symmetric_encryption(data, alg_name)
    encrypted_key,size = encrypt_key(public_key, symmetric_key)
    return size + encrypted_key + encrypted_message

def hybrid_decryption(private_key, data, alg_name):
    key_lenght = int.from_bytes(data[0:KEY_SIZE],byteorder="big")
    data = data[KEY_SIZE:]
    encrypted_key = data[0:key_lenght]
    data = data[key_lenght:]
    symmetric_key = decrypt_key(private_key, encrypted_key)
    message = symmetric_decryption(symmetric_key, data, alg_name)
    return message

def mic_calc(data:bytes) -> bytes:
    digest = hashes.Hash(hashes.SHA256())
    digest.update(data)
    return digest.finalize()

def derive(data:bytes, salt:bytes = b"salt1000"):
    kdf = PBKDF2HMAC(
        algorithm = hashes.SHA256(),
        length=32,
        salt=mic_calc(salt)[0:16],
        iterations=1_000_000,
    )
    return kdf.derive(data)

def mic_stamp(public_key, data:bytes) -> bytes:
    digest = hashes.Hash(hashes.SHA256(), backend=default_backend())
    digest.update(data)
    mic = digest.finalize()
    mac,size = encrypt_key(public_key, mic)
    return size + mac + data

def mic_stamp_check(private_key, data:bytes):
    mac_lenght = int.from_bytes(data[0:KEY_SIZE],byteorder="big")
    data = data[KEY_SIZE:]
    mac = data[0:mac_lenght]
    data = data[mac_lenght:]
    mic = decrypt_key(private_key, mac)
    digest = hashes.Hash(hashes.SHA256(), backend=default_backend())
    digest.update(data)
    mic = digest.finalize()
    return data, mic == mic

def mac_sign_symmetric(token,data):
    h = HMAC(key=token, algorithm=hashes.SHA256())
    h.update(data)
    return h.finalize()

def mac_check_symmetric(token, data, signature):
    h = HMAC(key=token, algorithm=hashes.SHA256())
    h.update(data)
    try:
        h.verify(signature)
        return True
    except:
        return False

def mac_sign_assymmetric(private, data:bytes) -> bytes:
    sign = private.sign(data, assim_padding.PSS(mgf=assim_padding.MGF1(hashes.SHA256()), salt_length=assim_padding.PSS.MAX_LENGTH), hashes.SHA256())
    return sign

def mac_check_assymmetric(public, data:bytes, sign:bytes) -> bool:
    try:
        public.verify(sign, data, assim_padding.PSS(mgf=assim_padding.MGF1(hashes.SHA256()), salt_length=assim_padding.PSS.MAX_LENGTH), hashes.SHA256())
        return True
    except cryptography.exceptions.InvalidSignature:
        return False

def make_chalenge(public_key):
    answer = mic_calc(os.urandom(256))
    challenge = encrypt_key(public_key,answer)[0]
    return challenge, answer

def solve_challenge(private_key, challenge):
    return decrypt_key(private_key, challenge)

def encrypt_key(public_key, data):
    encrypted_message = public_key.encrypt(
        data,
        assim_padding.OAEP(
            mgf=assim_padding.MGF1(algorithm=hashes.SHA256()),
            algorithm=hashes.SHA256(),
            label=None
        )
    )
    size = (len(encrypted_message)).to_bytes(KEY_SIZE   , byteorder='big')
    return encrypted_message, size

def decrypt_key(private_key, symmetric_key):
    decrypted = private_key.decrypt(
        symmetric_key,    
        padding= assim_padding.OAEP(
            mgf = assim_padding.MGF1(algorithm=hashes.SHA256()),
            algorithm = hashes.SHA256(),
            label=None
        )
    )
    return decrypted

def symmetric_encryption(data,alg_name="AES", key=None):
    alg = avaiable_algorithms[alg_name]
    iv:bytes = os.urandom(algorithm_iv_size[alg_name])
    
    if key == None: key:bytes = mic_calc(os.urandom(512))[0:algorithm_key_size[alg_name]]
    
    cipher = Cipher(alg(key), modes.CBC(iv))
    padder = padding.PKCS7(alg.block_size).padder()
    padded_data = padder.update(data) + padder.finalize()
    encryptor = cipher.encryptor()
    secret = encryptor.update(padded_data) + encryptor.finalize() 
    
    return iv + secret, key

def symmetric_encryption_simple(data,alg_name, token):
    return symmetric_encryption(data, alg_name, token)[0]

def symmetric_decryption(key:str, data,alg_name):

    alg = avaiable_algorithms[alg_name]
    iv:bytes = data[0:algorithm_iv_size[alg_name]]
    data = data[algorithm_iv_size[alg_name]:]
    
    cipher = Cipher(alg(key), modes.CBC(iv))
    decryptor = cipher.decryptor()
    secret = decryptor.update(data) + decryptor.finalize() 
    unpadder = padding.PKCS7(alg.block_size).unpadder()
    unpadded_data = unpadder.update(secret) + unpadder.finalize()
    return unpadded_data

def store(data:bytes, path:str):
    file = open(path, 'wb')
    data = hybrid_encryption(public_key, data, "AES")
    file.write(data)
    file.close()
    
def load(path:str):
    if os.path.isfile(path):
        file = open(path, 'rb')
        data = file.read()
        data  = hybrid_decryption(rep_opt_private_key, data, "AES")
        return data
    else: return None

class Req:
    def __init__(self, data, files, json_file, new_token = None, error = None):
        self.form = data
        self.files = files
        self.json = json_file
        self.error = error
        self.new_token = new_token

    def __str__(self): return f"Data: {self.form}\nFiles: {self.files}\nJson: {self.json}"

    @property
    def form(self): return self._data

    @form.setter
    def form(self, value): self._data = value

    @property
    def files(self): return self._files

    @files.setter
    def files(self, value): self._files = value

    @property
    def json(self): return self._json_file

    @json.setter
    def json(self, value): self._json_file = value

    @property
    def error(self): return self._error

    @error.setter
    def error(self, value): self._error = value

def encrypt_request_assymmetric(rep_public_key, action, endpoint, data={}, files={}, json_file={}, challenge={}, private_key=None):
    response = None
    file_lisr = []

    if rep_public_key != None:
        data["previous_interaction"] = datetime.now().isoformat()
        data = {"data" : hybrid_encryption(rep_public_key, json.dumps(data).encode(), "AES")} if not data == {} else {}
        
        for key in challenge:
            if key == "challenge" and challenge[key] == "" : 
                data[key] = ""
                continue
            if key == "challenge" and challenge[key] != "" : 
                data[key] = decode_bytes2string(challenge[key])
                continue
            if key == "mac" :
                data[key] = decode_bytes2string(challenge[key])
                continue

            data[key] = challenge[key]
        #if challenge != {} : data["challenge"] = json.dumps(challenge)        
        if private_key != None and data["data"] != {} : data["data_MAC"] = decode_bytes2string(mac_sign_assymmetric(private_key, data["data"]))
        data["data"] = decode_bytes2string(data["data"])
        
        for key in files:
            secret = hybrid_encryption(rep_public_key, files[key].read(), "AES")
            inner_file = io.BufferedReader(io.BytesIO(secret))
            file_lisr.append(inner_file)
            files[key] = inner_file
            
            if private_key != None : data[f"File_{key}_MAC"] = decode_bytes2string(mac_sign_assymmetric(private_key, secret))


        json_file = {"json" : decode_bytes2string(hybrid_encryption(rep_public_key, json.dumps(json_file).encode(), "AES"))} if not json_file == {} else {}
    else:
        data = {"data" : json.dumps(data)} if not data == {} else {}
        json_file = {"json" : json.dumps(json_file)} if not json_file == {} else {}
    
    # print(data)

    if action == 'POST': response = requests.post(endpoint, data=data, files=files)
    elif action == 'GET': response = requests.get(endpoint, data=data, files=files)

    for file in file_lisr: file.close()
    return response

def decrypt_request_assymmetric(rep_private_key, request, public_key=None) -> Req:
    data = encode_string2bytes(request.form["data"])
    files = {}
    json_file = {}

    if public_key != None and data != {} and not mac_check_assymmetric(public_key, data, encode_string2bytes(request.form["data_MAC"])): return Req(None, None, None, "Integrity Error")
    

    for file_name in request.files:
        file_encrypted = request.files[file_name].read()
        if public_key!=None and not mac_check_assymmetric(public_key, file_encrypted, encode_string2bytes(request.form[f"File_{file_name}_MAC"])): return Req(None, None, None, "Integrity Error")
        secret = hybrid_decryption(rep_private_key, file_encrypted, "AES")
        request.files[file_name].close()
        files[file_name] = secret

    data = json.loads(hybrid_decryption(rep_private_key, data, "AES")) if data != {} else {}
    json_file = json.loads(hybrid_decryption(rep_private_key, encode_string2bytes(json_file), "AES")) if json_file != {} else {}
    return Req(data, files, json_file)  

def encrypt_request_symmetric(session_id_hash, token, action, endpoint, data={}, files={}, json_file={}):
    response = None
    file_lisr = []
    
    if token != None:
        # Marks inside the blackbox
        data["previous_interaction"] = datetime.now().isoformat()
        
        new_token = generate_new_token(token, mic_calc(json.dumps(data).encode()))
        data = {"data" : symmetric_encryption_simple(json.dumps(data).encode(), "AES",token)} if not data == {} else {}
        
        # Marks outside the blackbox
        if data["data"] != {} : data["data_MAC"] = decode_bytes2string(mac_sign_symmetric(token, data["data"])) 
        if session_id_hash != None : data["session_id"] = session_id_hash

        data["data"] = decode_bytes2string(data["data"])
        
        print(data)
        
        
        for file_name in files:
            secret = symmetric_encryption_simple(files[file_name].read(), "AES",token)
            inner_file = io.BufferedReader(io.BytesIO(secret))
            file_lisr.append(inner_file)
            files[file_name] = inner_file
            
            data[f"File_{file_name}_MAC"] = decode_bytes2string(mac_sign_symmetric(token, secret))
        
        json_file = {"json" : decode_bytes2string(symmetric_encryption_simple(json.dumps(json_file).encode(), "AES",token))} if not json_file == {} else {}
    else:
        data = {"data" : json.dumps(data)} if not data == {} else {}
        json_file = {"json" : json.dumps(json_file)} if not json_file == {} else {}
    
    if action == 'POST': response = requests.post(endpoint, data=data, files=files)
    elif action == 'GET': response = requests.get(endpoint, data=data, files=files)

    for file in file_lisr: file.close()

    response_data = response.json()
    response_data["new_token"] = decode_bytes2string(new_token)
    response._content = json.dumps(response_data).encode()
    return response

def decrypt_request_symmetric(token, request) -> Req:
    data = encode_string2bytes(request.form["data"])
    files = {}
    json_file = {}
    
    # MAC testing phase
    for file_name in request.files:
        if not f"File_{file_name}_MAC" in request.form : return Req(None, None, None, "MAC not found")
    
    if data == {} or not "data_MAC" in request.form : return Req(None, None, None, "MAC not found")
    if not mac_check_symmetric(token, data, encode_string2bytes(request.form["data_MAC"])): return Req(None, None, None, "Integrity Error")

    for file_name in request.files:
        file_encrypted = request.files[file_name].read()
        files[file_name] = file_encrypted
        if not mac_check_symmetric(token, file_encrypted, encode_string2bytes(request.form[f"File_{file_name}_MAC"])): return Req(None, None, None, "Integrity Error")
        
    # Decryption phase
    for file_name in files:
        file_encrypted = files[file_name]
        secret = symmetric_decryption( token, file_encrypted,"AES")
        request.files[file_name].close()
        files[file_name] = secret

    data = json.loads(symmetric_decryption(token, data, "AES")) if data != {} else {}
    
    new_token = generate_new_token(token, mic_calc(json.dumps(data).encode()))
    
    json_file = json.loads(symmetric_decryption(encode_string2bytes(json_file), "AES",token)) if json_file != {} else {}
    return Req(data, files, json_file, new_token=new_token)  

def decode_bytes2string(data:bytes):
    return codecs.decode(base64.b64encode(data), 'utf-8')

def encode_string2bytes(data):
    return base64.b64decode(codecs.encode(data, 'utf-8'))

def encrypt_response_assymmetric(public_key, data:dict = {}, private_key = None):
    if public_key == None: return jsonify(data)
    encrypted_data = hybrid_encryption(public_key, json.dumps(data).encode(), "AES")
    mac = decode_bytes2string(mac_sign_assymmetric(private_key, encrypted_data))
    encrypted_data = decode_bytes2string(encrypted_data)
    return jsonify({
        "data" : encrypted_data,
        "MAC" : mac,
    })

def decrypt_response_assymmetric(private_key, data:dict = {}, public_key = None):
    if private_key == None: return data
    data["data"] = encode_string2bytes(data["data"])
    data["MAC"] = encode_string2bytes(data["MAC"])
    if "error" in data : return data

    if "data" in data:
        if "MAC" in data:
            if not mac_check_assymmetric(public_key,data["data"],data["MAC"]): return {"error":"integrity error"}
        return json.loads(hybrid_decryption(private_key, data["data"], "AES"))
    return {"error":"empty"}

def encrypt_response_symmetric(token, data:dict = {}):
    if token == None: return jsonify(data)
    encrypted_data = symmetric_encryption_simple(json.dumps(data).encode(), "AES", token)
    mac = decode_bytes2string(mac_sign_symmetric(token, encrypted_data))
    encrypted_data = decode_bytes2string(encrypted_data)
    return jsonify({
        "data" : encrypted_data,
        "MAC" : mac,
    })

def decrypt_response_symmetric(token, data:dict = {}):
    if token == None: return data
    data["data"] = encode_string2bytes(data["data"])
    data["MAC"] = encode_string2bytes(data["MAC"])
    if "data" in data:
        if "MAC" in data:
            if not mac_check_symmetric(token,data["data"],data["MAC"]): return {"error":"integrity error"}
        return json.loads(symmetric_decryption(token, data["data"], "AES"))
    return {"error":"empty"}