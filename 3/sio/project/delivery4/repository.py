import os
import io
import json
import hashlib
import repUtils
from repUtils import Req
from datetime import datetime, timedelta
from flask import Flask, request, jsonify, send_file
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.serialization import load_pem_public_key, load_pem_private_key



#####################################################################################
##################################### BASE CODE #####################################
#####################################################################################

app = Flask(__name__)

global repository, rep_public_key, rep_private_key
global org_private_keys
KEY_SIZE = 20
SESSION_TIMEOUT = timedelta(minutes = 30)
repository = {}
org_private_keys = {}
PRIVATE_DIR = "./repo/private/"
FILES_DIR = "./repo/files/"

os.makedirs(FILES_DIR, exist_ok=True)
os.makedirs("metadatas", exist_ok=True)
os.makedirs(PRIVATE_DIR, exist_ok=True)

def key_loader():
    global rep_public_key, rep_private_key
    if not os.path.isfile(f"{PRIVATE_DIR}rep_public_key.pem") and not os.path.isfile(f"{PRIVATE_DIR}rep_private_key.pem"):
        rep_private_key, rep_public_key = repUtils.generate_credentials()
        with open(f"{PRIVATE_DIR}rep_private_key.pem", "wb") as file: file.write(repUtils.serialize_private_key(rep_private_key))
        with open(f"{PRIVATE_DIR}rep_public_key.pem", "wb") as file: file.write(repUtils.serialize_public_key(rep_public_key))
        return
    
    with open(f"{PRIVATE_DIR}rep_private_key.pem", "rb") as file: rep_private_key = load_pem_private_key(file.read(),None)
    with open(f"{PRIVATE_DIR}rep_public_key.pem", "rb") as file: rep_public_key = load_pem_public_key(file.read(), backend=default_backend())

def save_state():
    global repository
    open_sessions_to_save = {}
    
    for session_id_hash, token in open_sessions.items():
        open_sessions_to_save[session_id_hash] = repUtils.decode_bytes2string(token)

    runtime_stats = {"challenges" : challenges,
        "organizations_hashcodes" : organizations_hashcodes,
        "users_hashcodes" : users_hashcodes,
        "open_sessions" : open_sessions_to_save
    }
    os.makedirs("private", exist_ok=True)
    with open(f"{PRIVATE_DIR}repository.cifr", 'wb') as file: file.write(repUtils.hybrid_encryption(rep_public_key, json.dumps(repository).encode(), "AES"))
    with open(f"{PRIVATE_DIR}runtime_stats.cifr", 'wb') as file: file.write(repUtils.hybrid_encryption(rep_public_key, json.dumps(runtime_stats).encode(), "AES"))

def load_state():
    global repository
    global challenges, organizations_hashcodes, users_hashcodes, open_sessions
    
    with open(f"{PRIVATE_DIR}repository.cifr", 'rb') as file: repository = json.loads(repUtils.hybrid_decryption(rep_private_key, file.read(), "AES"))
    with open(f"{PRIVATE_DIR}runtime_stats.cifr", 'rb') as file: runtime_stats = json.loads(repUtils.hybrid_decryption(rep_private_key, file.read(), "AES"))
    challenges = runtime_stats["challenges"]
    organizations_hashcodes = runtime_stats["organizations_hashcodes"]
    users_hashcodes = runtime_stats["users_hashcodes"]
    
    open_sessions = {}
    for session_id_hash, token in runtime_stats["open_sessions"].items():
        open_sessions[session_id_hash] = repUtils.encode_string2bytes(token)
    


def save_key(organization_name, private_key):
    global org_private_keys
    org_private_keys[organization_name] = private_key
    os.makedirs("private", exist_ok=True)
    with open(f"{PRIVATE_DIR}private.cifr", 'wb') as file: file.write(repUtils.hybrid_encryption(rep_public_key, json.dumps(org_private_keys).encode(), "AES"))

def load_org_private_keys():
    global org_private_keys
    with open(f"{PRIVATE_DIR}private.cifr", 'rb') as file: org_private_keys = json.loads(repUtils.hybrid_decryption(rep_private_key, file.read(), "AES"))

key_loader()
global challenges, organizations_hashcodes, users_hashcodes, open_sessions
challenges:dict[str,tuple[int, int]]= {}
organizations_hashcodes:dict[str,int]= {}
users_hashcodes:dict[str,int]= {}
open_sessions: dict[str, int]= {}
if os.path.isfile(f"{PRIVATE_DIR}repository.cifr"): load_state()
if os.path.isfile(f"{PRIVATE_DIR}private.cifr"): load_org_private_keys()

#####################################################################################
################################ AUXILIARY FUNCTIONS ################################
#####################################################################################
def send_challenge(public_key, challenge):
    return repUtils.encrypt_response_assymmetric(public_key,data={"challenge": repUtils.decode_bytes2string(challenge)}, private_key=rep_private_key)

def post_request_symetric_encryption_treatment(request):
    session_id_hash = request.form["session_id"]
    token = open_sessions[session_id_hash] 
    request_data : Req = repUtils.decrypt_request_symmetric(token, request)
    
    token = request_data.new_token
    open_sessions[session_hash] = token
    save_state()
    token = request_data.new_token

    
def pre_response_symetrice_encryption_treatment(data, session_id_hash):
    token = open_sessions[session_id_hash] 
    repUtils.encrypt_response_symmetric(token,data)

# get_valid_session_information <session_file>
def get_valid_session_information(session_file, previous_interaction):
    organization, session_id = next(iter(json.loads(session_file).items()))
    if organization not in repository: return {"error": "Invalid organization"}, None, None
    if datetime.fromisoformat(previous_interaction) == datetime.fromisoformat(repository[organization]['sessions'][session_id]['last_active']): return {"abort": "Duplicate request detected"}, None, None
    else: repository[organization]['sessions'][session_id]['last_active'] = previous_interaction
    if session_id not in repository[organization]['sessions']: return {"error": "Invalid session ID"}, None, None
    username = repository[organization]['sessions'][session_id]['username']
    if not repository[organization]['subjects'][username]['status']: return {"error": "User suspended"}, None, None
    if datetime.now() > datetime.fromisoformat(repository[organization]['sessions'][session_id]['last_active']) + SESSION_TIMEOUT: 
        del repository[organization]['sessions'][session_id]
        return {"error": "Session timeout"}, None, None
    return organization, session_id, username

# validate_subject_permission <organization> <session_id> <username> <permission>
def validate_subject_permission(organization, session_id, username, permission):
    for role in repository[organization]['sessions'][session_id]['roles']:
        role = repository[organization]['roles'][role]
        if role['status'] and username in role['subjects'] and permission in (role['permissions'] + role['acl']): return True
    return False

# validate_document_permission <organization> <session_id> <document_name> <permission>
def validate_document_permission(organization, session_id, document_name, permission):
    with open(f"metadatas/{document_name}", 'r') as metadata_file:
        metadata = json.load(metadata_file)
        for role in metadata['acl']:
            if role in repository[organization]['sessions'][session_id]['roles'] and permission in metadata['acl'][role]: return True
    return False

# compute_hash <content>
def compute_hash(content):
    return hashlib.sha256().update(content).hexdigest()

def add_org_private_key(org_name, private_key):
    global org_private_keys
    org_private_keys[org_name] = repUtils.serialize_private_key(private_key).decode()
    os.makedirs("private", exist_ok=True)
    with open(f"{PRIVATE_DIR}private.cifr", 'wb') as file:
        data = repUtils.hybrid_encryption(rep_public_key, json.dumps(org_private_keys).encode(), "AES")
        file.write(data)

def load_org_private_keys():
    global org_private_keys
    if os.path.isfile(f"{PRIVATE_DIR}private.cifr"):
        with open(f"{PRIVATE_DIR}private.cifr", 'rb') as file:
            data = file.read()
            data = repUtils.hybrid_decryption(rep_private_key, data, "AES")
            org_private_keys = json.loads(data)



#####################################################################################
############################### ANONYMOUS API COMMANDS ##############################
#####################################################################################

# get_rep_key
@app.route('/repository/get_rep_key', methods=['GET'])
def get_rep_key():
    return repUtils.encrypt_response_assymmetric(None,{"public_key": repUtils.serialize_public_key(rep_public_key).decode()})

# rep_create_org <organization> <username> <name> <email> <public_key_file>
@app.route('/repository/create_org', methods=['POST'])
def rep_create_org():
    req = repUtils.decrypt_request_assymmetric(rep_private_key, request)
    public_key = json.loads(req.files["public_key_file"])['pubkey']
    organization = req.form['organization']
    identifier = req.form["identifier"]
    name = req.form["name"]
    email = req.form["email"]
    
    if organization in repository: return repUtils.encrypt_response_assymmetric(None,{"error": "Organization already exists"}), 400
    org_private_key, org_public_key = repUtils.generate_credentials()
        
    organizations_hashcodes[repUtils.derive(organization.encode()).hex()] = organization
    users_hashcodes[repUtils.derive(identifier.encode()).hex()] = identifier

    repository[organization] = {
        "documents": [],
        "subjects": {
            identifier: {
                "name": name,
                "email": email,
                "pubkey": public_key,
                "status": True
            }
        },
        "roles": {
            "Managers": {
                "subjects": [identifier],
                "acl": ["DOC_NEW", "SUBJECT_NEW", "SUBJECT_DOWN", "SUBJECT_UP", "ROLE_ACL"],
                "permissions": ["ROLE_NEW", "ROLE_DOWN", "ROLE_UP", "ROLE_MOD"],
                "status": True
            }
        },
        "sessions": {},
        "public_key": repUtils.serialize_public_key(org_public_key).decode()
    }

    save_state()
    save_key(organization, repUtils.serialize_private_key(org_private_key).decode())
    return repUtils.encrypt_response_assymmetric(None,{"organization_public_key": repUtils.serialize_public_key(org_public_key).decode()})

# rep_list_orgs
@app.route('/repository/list_orgs', methods=['GET'])
def rep_list_orgs():
    return repUtils.encrypt_response_assymmetric(None,{"organizations": list(repository.keys())})

# rep_create_session <organization> <username> <password> <credentials file> <session file>
@app.route('/repository/organization/sessions/create_session', methods=['POST'])
def rep_create_session():

    # Challenge phase
    if not "identifier" in request.form: return repUtils.encrypt_response_assymmetric(None,{"error": "identifier needed", "warning": "challenge phase"})
    if not "organization" in request.form: return repUtils.encrypt_response_assymmetric(None,{"error": "organization needed", "warning": "challenge phase"})
    if not "challenge" in request.form: return repUtils.encrypt_response_assymmetric(None,{"error": "challenge needed", "warning": "challenge phase"})
    if not "mac" in request.form: return repUtils.encrypt_response_assymmetric(None,{"error": "MAC needed", "warning": "challenge phase"})
    
    challenge = request.form["challenge"] if request.form["challenge"] == "" else repUtils.encode_string2bytes(request.form["challenge"])
    org_hashcode = request.form["organization"]
    identifier_hashcode = request.form["identifier"]
    chMAC = repUtils.encode_string2bytes(request.form["mac"])
    
    print(json.dumps(request.form, indent=4))
    

    # assure the user exists
    if not identifier_hashcode in users_hashcodes.keys(): return repUtils.encrypt_response_assymmetric(None,{"error": "challenge failed"})
    
    # assure the organization exists
    if not org_hashcode in organizations_hashcodes.keys(): return repUtils.encrypt_response_assymmetric(None,{"error": "challenge failed"})
    
    # assure user belongs to organization
    if not users_hashcodes[identifier_hashcode] in repository[organizations_hashcodes[org_hashcode]]["subjects"] : return repUtils.encrypt_response_assymmetric(None,{"error": "challenge failed"})
    
    # loading client's public key
    public_key = repository[organizations_hashcodes[org_hashcode]]["subjects"][users_hashcodes[identifier_hashcode]]["pubkey"]
    public_key = load_pem_public_key(public_key.encode())
    # assure the challenge is valid
    #if not challenge == "" and not challenge in challenges.values(): return repUtils.encrypt_response_assymmetric(public_key,{"error": "challenge failed"}, private_key=rep_private_key)

    aux_mac = (org_hashcode + identifier_hashcode).encode()#repUtils.encode_string2bytes(org_hashcode+identifier_hashcode) #repUtils.encode_string2bytes(org_hashcode + identifier_hashcode)
    if challenge == "":
        if not repUtils.mac_check_assymmetric(public_key, aux_mac, chMAC) : return repUtils.encrypt_response_assymmetric(public_key,{"error": "integrity error"})
        
    elif not repUtils.mac_check_assymmetric(public_key, aux_mac + challenge,chMAC) : return repUtils.encrypt_response_assymmetric(public_key,{"error": "integrity error"})

    if not identifier_hashcode in challenges:
        challenge, answer = repUtils.make_chalenge(public_key)
        challenges[identifier_hashcode] = challenge,answer
        
        res =  send_challenge(public_key,challenge)
        return res

    if "challenge" in request.form:
        if challenge == "": 
            return send_challenge(public_key,challenges[identifier_hashcode][0])
        
        if not challenges[identifier_hashcode][1] == challenge:
            return send_challenge(public_key, challenges[identifier_hashcode][0])
        else: 
            challenges.pop(identifier_hashcode)
    else:
        return send_challenge(public_key,challenges[identifier_hashcode][0])
    
        
    
    # Decryption phase
    request_data : Req = repUtils.decrypt_request_assymmetric(rep_private_key, request, public_key=public_key)
    public_key = json.loads(request_data.files["credentials_file"])['pubkey']
    organization = request_data.form['organization']
    identifier = request_data.form['identifier']
    session_id = hashlib.sha256(public_key.replace("\n", "").strip().encode('utf-8')).hexdigest()

    if organization not in repository: return repUtils.encrypt_response_assymmetric(None,{"error": "Invalid organization"}), 400
    if identifier not in repository[organization]['subjects']: return repUtils.encrypt_response_assymmetric(None,{"error": "Invalid username"}), 400
    if not repository[organization]['subjects'][identifier]['status']: return repUtils.encrypt_response_assymmetric(None,{"error": "User suspended"}), 400
    if session_id in repository[organization]['sessions']: return repUtils.encrypt_response_assymmetric(None,{"error": "Session already active"}), 400


    token = repUtils.derive(repUtils.mic_calc(os.urandom(256)), salt=repUtils.mic_calc(os.urandom(256)))
    
    session_id_hash = repUtils.derive(session_id.encode()).hex()
    open_sessions[session_id_hash] = token

    repository[organization]["sessions"][session_id] = {
        "username": identifier,
        "keys": [public_key],
        "roles" : [],
        "start_time": datetime.now().isoformat(),
        "last_active": datetime.now().isoformat(),
        "session_id_hash" : session_id_hash
    }
    print({repository[organization]["sessions"][session_id]["username"]: token})
    print(json.dumps(repository[organization]["sessions"][session_id], indent=4))
    save_state()

    public_key = load_pem_public_key(public_key.encode())
    return repUtils.encrypt_response_assymmetric(public_key,{organization: session_id, "token" : repUtils.decode_bytes2string(token), "session_id_hash": session_id_hash}, private_key=rep_private_key)

# rep_get_file <file handle> [file]
@app.route('/repository/files/get_file', methods=['GET'])
def rep_get_file():
    file_handle = request.form['file_handle']
    if not os.path.exists(f"{FILES_DIR}{file_handle}"): return repUtils.encrypt_response_assymmetric(None,{"error": "Invalid document"}), 400
    with open(f"{FILES_DIR}{file_handle}", 'rb') as file:
        content = file.read()
        mac = repUtils.mac_sign_assymmetric(rep_private_key, content)
        s = len(mac).to_bytes(20, byteorder='big')
        
        buff = io.BufferedReader(io.BytesIO(s + mac + content))
        return send_file(buff, as_attachment=True, download_name="save")



#####################################################################################
############################# AUTHENTICATED API COMMANDS ############################
#####################################################################################

# rep_assume_role <session file> <role>
@app.route('/repository/organization/roles/assume_role', methods=['POST'])
def rep_assume_role():
    if not "session_id" in request.form: return repUtils.encrypt_response_symmetric(None,{"error": "session file needed"}), 400
    session_hash = request.form["session_id"]
    token = open_sessions[session_hash]
    request_data : Req = repUtils.decrypt_request_symmetric(token, request)
    
    token = request_data.new_token
    open_sessions[session_hash] = token
    save_state()
    

    organization, session_id, username = get_valid_session_information(request_data.files["session_file"], request_data.form["previous_interaction"])
    if not username: return repUtils.encrypt_response_symmetric(token ,organization), 400 # In this case, 'organization' is an error message
    role = request_data.form["role"]

    if role not in repository[organization]["roles"]: return repUtils.encrypt_response_symmetric(token ,{"error": "Invalid role"}), 400
    if role in repository[organization]['sessions'][session_id]['roles']: return repUtils.encrypt_response_symmetric(token ,{"error": "Role already assigned"}), 400
    if username not in repository[organization]['roles'][role]['subjects']: return repUtils.encrypt_response_symmetric(token ,{"error": "Invalid permission"}), 400

    repository[organization]['sessions'][session_id]['roles'].append(role)
    save_state()
    return repUtils.encrypt_response_symmetric(token,{"success": True})

# rep_drop_role <session file> <role>
@app.route('/repository/organization/roles/drop_role', methods=['POST'])
def rep_drop_role():
    if not "session_id" in request.form: return repUtils.encrypt_response_symmetric(None,{"error": "session file needed"}), 400
    session_hash = request.form["session_id"]
    token = open_sessions[session_hash]
    request_data : Req = repUtils.decrypt_request_symmetric(token, request)
    
    token = request_data.new_token
    open_sessions[session_hash] = token
    save_state()


    organization, session_id, username = get_valid_session_information(request_data.files["session_file"], request_data.form["previous_interaction"])
    if not username: return repUtils.encrypt_response_symmetric(token ,organization), 400 # In this case, 'organization' is an error message
    role = request_data.form["role"]

    if role not in repository[organization]['sessions'][session_id]['roles']: return repUtils.encrypt_response_symmetric(token ,{"error": "Invalid role"}), 400

    repository[organization]['sessions'][session_id]['roles'].remove(role)
    save_state()
    return repUtils.encrypt_response_symmetric(token ,{"success": True})

# rep_list_roles <session file> <role>
@app.route('/repository/organization/list_roles', methods=['GET'])
def rep_list_roles():
    if not "session_id" in request.form: return repUtils.encrypt_response_symmetric(None,{"error": "session file needed"}), 400
    session_hash = request.form["session_id"]
    token = open_sessions[session_hash]
    request_data : Req = repUtils.decrypt_request_symmetric(token, request)
    
    token = request_data.new_token
    open_sessions[session_hash] = token
    save_state()


    organization, session_id, username = get_valid_session_information(request_data.files["session_file"], request_data.form["previous_interaction"])
    if not username: return repUtils.encrypt_response_symmetric(token ,organization), 400 # In this case, 'organization' is an error message

    return repUtils.encrypt_response_symmetric(token ,{"roles": repository[organization]['sessions'][session_id]['roles']})

# rep_list_subjects <session file> [username]
@app.route('/repository/organization/list_subjects', methods=['GET'])
def rep_list_subjects():
    if not "session_id" in request.form: return repUtils.encrypt_response_symmetric(None,{"error": "session file needed"}), 400
    session_hash = request.form["session_id"]
    token = open_sessions[session_hash]
    request_data : Req = repUtils.decrypt_request_symmetric(token, request)
    
    token = request_data.new_token
    open_sessions[session_hash] = token
    save_state()


    organization, session_id, username = get_valid_session_information(request_data.files["session_file"], request_data.form["previous_interaction"])
    if not username: return repUtils.encrypt_response_symmetric(token ,organization), 400 # In this case, 'organization' is an error message
    identifier = request_data.form.get("identifier")

    if identifier and identifier in repository[organization]["subjects"]: return repUtils.encrypt_response_symmetric(token ,{identifier: repository[organization]["subjects"][identifier]["status"]})
    return repUtils.encrypt_response_symmetric(token ,{subject: repository[organization]["subjects"][subject]["status"] for subject in repository[organization]["subjects"]})

# rep_list_role_subjects <session file> <role>
@app.route('/repository/organization/roles/list_role_subjects', methods=['GET'])
def rep_list_role_subjects():
    if not "session_id" in request.form: return repUtils.encrypt_response_symmetric(None,{"error": "session file needed"}), 400
    session_hash = request.form["session_id"]
    token = open_sessions[session_hash]
    request_data : Req = repUtils.decrypt_request_symmetric(token, request)
    
    token = request_data.new_token
    open_sessions[session_hash] = token
    save_state()


    organization, session_id, username = get_valid_session_information(request_data.files["session_file"], request_data.form["previous_interaction"])
    if not username: return repUtils.encrypt_response_symmetric(token ,organization), 400 # In this case, 'organization' is an error message
    role = request_data.form["role"]

    if role not in repository[organization]["roles"]: return repUtils.encrypt_response_symmetric(token ,{"error": "Invalid role"}), 400

    return repUtils.encrypt_response_symmetric(token ,{"roles": repository[organization]['roles'][role]['subjects']})

# rep_list_subject_roles <session file> <username>
@app.route('/repository/organization/subjects/list_subject_roles', methods=['GET'])
def rep_list_subject_roles():
    if not "session_id" in request.form: return repUtils.encrypt_response_symmetric(None,{"error": "session file needed"}), 400
    session_hash = request.form["session_id"]
    token = open_sessions[session_hash]
    request_data : Req = repUtils.decrypt_request_symmetric(token, request)
    
    token = request_data.new_token
    open_sessions[session_hash] = token
    save_state()


    organization, session_id, username = get_valid_session_information(request_data.files["session_file"], request_data.form["previous_interaction"])
    if not username: return repUtils.encrypt_response_symmetric(token ,organization), 400 # In this case, 'organization' is an error message
    identifier = request_data.form["identifier"]

    if identifier not in repository[organization]["subjects"]: return repUtils.encrypt_response_symmetric(token ,{"error": "Invalid subject"}), 400

    return repUtils.encrypt_response_symmetric(token ,{"roles": [role for role in repository[organization]['roles'] if identifier in repository[organization]['roles'][role]['subjects']]})

# rep_list_role_permissions <session file> <role>
@app.route('/repository/organization/roles/list_role_permissions', methods=['GET'])
def rep_list_role_permissions():
    if not "session_id" in request.form: return repUtils.encrypt_response_symmetric(None,{"error": "session file needed"}), 400
    session_hash = request.form["session_id"]
    token = open_sessions[session_hash]
    request_data : Req = repUtils.decrypt_request_symmetric(token, request)
    
    token = request_data.new_token
    open_sessions[session_hash] = token
    save_state()


    organization, session_id, username = get_valid_session_information(request_data.files["session_file"], request_data.form["previous_interaction"])
    if not username: return repUtils.encrypt_response_symmetric(token ,organization), 400 # In this case, 'organization' is an error message
    role = request_data.form["role"]
    
    if role not in repository[organization]['roles']: return repUtils.encrypt_response_symmetric(token ,{"error": "Invalid role"}), 400

    return repUtils.encrypt_response_symmetric(token ,{"permissions": repository[organization]['roles'][role]['permissions'] + repository[organization]['roles'][role]['acl']})

# rep_list_permission_roles <session file> <permission>
@app.route('/repository/organization/roles/list_permission_roles', methods=['GET'])
def rep_list_permission_roles():
    if not "session_id" in request.form: return repUtils.encrypt_response_symmetric(None,{"error": "session file needed"}), 400
    session_hash = request.form["session_id"]
    token = open_sessions[session_hash]
    request_data : Req = repUtils.decrypt_request_symmetric(token, request)
    
    token = request_data.new_token
    open_sessions[session_hash] = token
    save_state()


    organization, session_id, username = get_valid_session_information(request_data.files["session_file"], request_data.form["previous_interaction"])
    if not username: return repUtils.encrypt_response_symmetric(token ,organization), 400 # In this case, 'organization' is an error message
    permission = request_data.form["permission"]
    
    if permission not in ["DOC_NEW", "SUBJECT_NEW", "SUBJECT_DOWN", "SUBJECT_UP", "ROLE_ACL", "ROLE_NEW", "ROLE_DOWN", "ROLE_UP", "ROLE_MOD"]: return repUtils.encrypt_response_symmetric(token ,{"error": "Invalid permission"}), 400

    return repUtils.encrypt_response_symmetric(token ,{"roles": [role for role in repository[organization]['roles'] if permission in (repository[organization]['roles'][role]['permissions'] + repository[organization]['roles'][role]['acl'])]})

# rep_list_docs <session file> [-s username] [-d nt/ot/et date]
@app.route('/repository/organization/documents/list_docs', methods=['GET'])
def rep_list_docs():
    if not "session_id" in request.form: return repUtils.encrypt_response_symmetric(None,{"error": "session file needed"}), 400
    session_hash = request.form["session_id"]
    token = open_sessions[session_hash]
    request_data : Req = repUtils.decrypt_request_symmetric(token, request)
    
    token = request_data.new_token
    open_sessions[session_hash] = token
    save_state()


    organization, session_id, username = get_valid_session_information(request_data.files["session_file"], request_data.form["previous_interaction"])
    if not username: return repUtils.encrypt_response_symmetric(token ,organization), 400 # In this case, 'organization' is an error message
    identifier = request_data.form.get("identifier", None)
    date = request_data.form.get("date", None)

    if identifier and not date: return repUtils.encrypt_response_symmetric(token ,{ "documents": [document for document in os.listdir('metadatas') if document in repository[organization]['documents'] and json.load(open(f"metadatas/{document}"))['creator'] == identifier]})
    if not identifier and date: return repUtils.encrypt_response_symmetric(token ,{ "documents": [document for document in os.listdir('metadatas') if document in repository[organization]['documents'] and json.load(open(f"metadatas/{document}"))['create_data'] == date]})
    if identifier and date: return repUtils.encrypt_response_symmetric(token ,{ "documents": [document for document in os.listdir('metadatas') if document in repository[organization]['documents'] and json.load(open(f"metadatas/{document}"))['creator'] == identifier and json.load(open(f"metadatas/{document}"))['create_data'] == date]})
    return repUtils.encrypt_response_symmetric(token ,{ "documents": [document for document in os.listdir('metadatas') if document in repository[organization]['documents']]})



#####################################################################################
############################## AUTHORIZED API COMMANDS ##############################
#####################################################################################

# rep_add_subject <session file> <username> <name> <email> <credentials file>
@app.route('/repository/organization/subjects/add_subject', methods=['POST'])
def rep_add_subject():
    if not "session_id" in request.form: return repUtils.encrypt_response_symmetric(None,{"error": "session file needed"}), 400
    session_hash = request.form["session_id"]
    token = open_sessions[session_hash]
    request_data : Req = repUtils.decrypt_request_symmetric(token, request)
    
    token = request_data.new_token
    open_sessions[session_hash] = token
    save_state()


    organization, session_id, username = get_valid_session_information(request_data.files["session_file"], request_data.form["previous_interaction"])
    if not username: return repUtils.encrypt_response_symmetric(token ,organization), 400 # In this case, 'organization' is an error message
    identifier = request_data.form["identifier"]
    name = request_data.form["name"]
    email = request_data.form["email"]
    public_key = json.loads(request_data.files["credentials_file"])['pubkey']
        
    if not validate_subject_permission(organization, session_id, username, 'SUBJECT_NEW'): return repUtils.encrypt_response_symmetric(token ,{"error": "Permission denied"}), 400
    if identifier in repository[organization]['subjects']: return repUtils.encrypt_response_symmetric(token ,{"error": "User already exists"}), 400

    repository[organization]['subjects'][identifier] = {
        "name": name,
        "email": email,
        "pubkey": public_key,
        "roles": [],
        "status": True
    }
    users_hashcodes[repUtils.derive(identifier.encode()).hex()] = identifier
    save_state()
    return repUtils.encrypt_response_symmetric(token ,{"success": True})

# rep_suspend_subject <session file> <username>
@app.route('/repository/organization/subjects/suspend_subject', methods=['POST'])
def rep_suspend_subject():
    if not "session_id" in request.form: return repUtils.encrypt_response_symmetric(None,{"error": "session file needed"}), 400
    session_hash = request.form["session_id"]
    token = open_sessions[session_hash]
    request_data : Req = repUtils.decrypt_request_symmetric(token, request)
    
    token = request_data.new_token
    open_sessions[session_hash] = token
    save_state()


    organization, session_id, username = get_valid_session_information(request_data.files["session_file"], request_data.form["previous_interaction"])
    if not username: return repUtils.encrypt_response_symmetric(token ,organization), 400 # In this case, 'organization' is an error message
    identifier = request_data.form['identifier']

    if not validate_subject_permission(organization, session_id, username, 'SUBJECT_DOWN'): return repUtils.encrypt_response_symmetric(token ,{"error": "Permission denied"}), 400
    if identifier not in repository[organization]['subjects']: return repUtils.encrypt_response_symmetric(token ,{"error": "Invalid username"}), 400
    if not repository[organization]['subjects'][identifier]['status']: return repUtils.encrypt_response_symmetric(token ,{"error": "Subject already suspended"}), 400

    repository[organization]['subjects'][identifier]['status'] = False
    save_state()
    return repUtils.encrypt_response_symmetric(token ,{"success": True})

# rep_activate_subject <session file> <username>
@app.route('/repository/organization/subjects/activate_subject', methods=['POST'])
def rep_activate_subject():
    if not "session_id" in request.form: return repUtils.encrypt_response_symmetric(None,{"error": "session file needed"}), 400
    session_hash = request.form["session_id"]
    token = open_sessions[session_hash]
    request_data : Req = repUtils.decrypt_request_symmetric(token, request)
    
    token = request_data.new_token
    open_sessions[session_hash] = token
    save_state()


    organization, session_id, username = get_valid_session_information(request_data.files["session_file"], request_data.form["previous_interaction"])
    if not username: return repUtils.encrypt_response_symmetric(token ,organization), 400 # In this case, 'organization' is an error message
    identifier = request_data.form['identifier']

    if not validate_subject_permission(organization, session_id, username, 'SUBJECT_UP'): return repUtils.encrypt_response_symmetric(token ,{"error": "Permission denied"}), 400
    if identifier not in repository[organization]['subjects']: return repUtils.encrypt_response_symmetric(token ,{"error": "Invalid username"}), 400
    if repository[organization]['subjects'][identifier]['status']: return repUtils.encrypt_response_symmetric(token ,{"error": "Subject already active"}), 400

    repository[organization]['subjects'][identifier]['status'] = True
    save_state()
    return repUtils.encrypt_response_symmetric(token ,{"success": True})

# rep_add_role <session file> <role>
@app.route('/repository/organization/roles/add_role', methods=['POST'])
def rep_add_role():
    if not "session_id" in request.form: return repUtils.encrypt_response_symmetric(None,{"error": "session file needed"}), 400
    session_hash = request.form["session_id"]
    token = open_sessions[session_hash]
    request_data : Req = repUtils.decrypt_request_symmetric(token, request)
    
    token = request_data.new_token
    open_sessions[session_hash] = token
    save_state()


    organization, session_id, username = get_valid_session_information(request_data.files["session_file"], request_data.form["previous_interaction"])
    if not username: return repUtils.encrypt_response_symmetric(token ,organization), 400 # In this case, 'organization' is an error message
    role = request_data.form["role"]

    if not validate_subject_permission(organization, session_id, username, 'ROLE_NEW'): return repUtils.encrypt_response_symmetric(token ,{"error": "Permission denied"}), 400
    if role in repository[organization]["roles"]: return repUtils.encrypt_response_symmetric(token ,{"error": "Role already exists"}), 400

    repository[organization]['roles'][role] = {
        "subjects": [],
        "acl": [],
        "permissions": [],
        "status": True
    }
    save_state()
    return repUtils.encrypt_response_symmetric(token ,{"success": True})

# rep_suspend_role <session file> <role>
@app.route('/repository/organization/roles/suspend_role', methods=['POST'])
def rep_suspend_role():
    if not "session_id" in request.form: return repUtils.encrypt_response_symmetric(None,{"error": "session file needed"}), 400
    session_hash = request.form["session_id"]
    token = open_sessions[session_hash]
    request_data : Req = repUtils.decrypt_request_symmetric(token, request)
    
    token = request_data.new_token
    open_sessions[session_hash] = token
    save_state()


    organization, session_id, username = get_valid_session_information(request_data.files["session_file"], request_data.form["previous_interaction"])
    if not username: return repUtils.encrypt_response_symmetric(token ,organization), 400 # In this case, 'organization' is an error message
    role = request_data.form["role"]

    if not validate_subject_permission(organization, session_id, username, 'ROLE_DOWN'): return repUtils.encrypt_response_symmetric(token ,{"error": "Permission denied"}), 400
    if role not in repository[organization]["roles"]: return repUtils.encrypt_response_symmetric(token ,{"error": "Invalid role"}), 400
    if not repository[organization]["roles"][role]['status']: return repUtils.encrypt_response_symmetric(token ,{"error": "Role already suspended"}), 400

    repository[organization]['roles'][role]['status'] = False
    save_state()
    return repUtils.encrypt_response_symmetric(token ,{"success": True})

# rep_reactivate_role <session file> <role>
@app.route('/repository/organization/roles/reactivate_role', methods=['POST'])
def rep_reactivate_role():
    if not "session_id" in request.form: return repUtils.encrypt_response_symmetric(None,{"error": "session file needed"}), 400
    session_hash = request.form["session_id"]
    token = open_sessions[session_hash]
    request_data : Req = repUtils.decrypt_request_symmetric(token, request)
    
    token = request_data.new_token
    open_sessions[session_hash] = token
    save_state()


    organization, session_id, username = get_valid_session_information(request_data.files["session_file"], request_data.form["previous_interaction"])
    if not username: return repUtils.encrypt_response_symmetric(token ,organization), 400 # In this case, 'organization' is an error message
    role = request_data.form["role"]

    if not validate_subject_permission(organization, session_id, username, 'ROLE_UP'): return repUtils.encrypt_response_symmetric(token ,{"error": "Permission denied"}), 400
    if role not in repository[organization]["roles"]: return repUtils.encrypt_response_symmetric(token ,{"error": "Invalid role"}), 400
    if repository[organization]["roles"][role]['status']: return repUtils.encrypt_response_symmetric(token ,{"error": "Role already active"}), 400

    repository[organization]['roles'][role]['status'] = True
    save_state()
    return repUtils.encrypt_response_symmetric(token ,{"success": True})

# rep_add_permission <session file> <role> <username>/<permission>
@app.route('/repository/organization/roles/add_permission', methods=['POST'])
def rep_add_permission():
    if not "session_id" in request.form: return repUtils.encrypt_response_symmetric(None,{"error": "session file needed"}), 400
    session_hash = request.form["session_id"]
    token = open_sessions[session_hash]
    request_data : Req = repUtils.decrypt_request_symmetric(token, request)
    
    token = request_data.new_token
    open_sessions[session_hash] = token
    save_state()


    organization, session_id, username = get_valid_session_information(request_data.files["session_file"], request_data.form["previous_interaction"])
    if not username: return repUtils.encrypt_response_symmetric(token ,organization), 400 # In this case, 'organization' is an error message
    role = request_data.form["role"]
    identifier = request_data.form["identifier"]

    if not validate_subject_permission(organization, session_id, username, 'ROLE_MOD'): return repUtils.encrypt_response_symmetric(token ,{"error": "Permission denied"}), 400
    if role not in repository[organization]["roles"]: return repUtils.encrypt_response_symmetric(token ,{"error": "Invalid role"}), 400
    
    if identifier.isalnum(): 
        if identifier not in repository[organization]['subjects']: return repUtils.encrypt_response_symmetric(token ,{"error": "Invalid username"}), 400
        if identifier in repository[organization]["roles"][role]['subjects']: return repUtils.encrypt_response_symmetric(token ,{"error": "Role already assigned"}), 400
        repository[organization]["roles"][role]['subjects'].append(identifier)
        save_state()
        return repUtils.encrypt_response_symmetric(token ,{"success": True})
    
    if identifier in repository[organization]["roles"][role]['permissions']: return repUtils.encrypt_response_symmetric(token ,{"error": "Permission already exists"}), 400
    if identifier in ["ROLE_NEW", "ROLE_DOWN", "ROLE_UP", "ROLE_MOD"]: repository[organization]["roles"][role]['permissions'].append(identifier)
    elif identifier in ["DOC_NEW", "SUBJECT_NEW", "SUBJECT_DOWN", "SUBJECT_UP", "ROLE_ACL"]: repository[organization]["roles"][role]['acl'].append(identifier)
    else: return repUtils.encrypt_response_symmetric(token ,{"error": "Invalid permission"}), 400
    save_state()
    return repUtils.encrypt_response_symmetric(token ,{"success": True})

# rep_remove_permission <session file> <role> <username>/<permission>
@app.route('/repository/organization/roles/remove_permission', methods=['POST'])
def rep_remove_permission():
    if not "session_id" in request.form: return repUtils.encrypt_response_symmetric(None,{"error": "session file needed"}), 400
    session_hash = request.form["session_id"]
    token = open_sessions[session_hash]
    request_data : Req = repUtils.decrypt_request_symmetric(token, request)
    
    token = request_data.new_token
    open_sessions[session_hash] = token
    save_state()


    organization, session_id, username = get_valid_session_information(request_data.files["session_file"], request_data.form["previous_interaction"])
    if not username: return repUtils.encrypt_response_symmetric(token ,organization), 400 # In this case, 'organization' is an error message
    role = request_data.form["role"]
    identifier = request_data.form["identifier"]
    force_flag = int(request_data.form["force_flag"])

    if role not in repository[organization]["roles"]: return repUtils.encrypt_response_symmetric(token ,{"error": "Invalid role"}), 400
    if not validate_subject_permission(organization, session_id, username, 'ROLE_MOD'): return repUtils.encrypt_response_symmetric(token ,{"error": "Permission denied"}), 400

    if identifier.isalnum():
        if role == "Managers" and len(repository[organization]["roles"][role]['subjects']) == 2: return repUtils.encrypt_response_symmetric(token ,{"error": "Role must have at least 2 members"}), 400
        if identifier not in repository[organization]["roles"][role]['subjects']: return repUtils.encrypt_response_symmetric(token ,{"error": "Invalid username"}), 400
        repository[organization]["roles"][role]['subjects'].remove(identifier)
        if not force_flag and not validate_subject_permission(organization, session_id, username, 'ROLE_MOD'):
            repository[organization]["roles"][role]['subjects'].append(identifier)
            return repUtils.encrypt_response_symmetric(token ,{"abort": "Use f/force to remove user admin privileges"}), 400
        save_state()
        return repUtils.encrypt_response_symmetric(token ,{"success": True})
    
    if identifier == "ROLE_MOD" and role == "Managers": return repUtils.encrypt_response_symmetric(token ,{"error": "Permission cannot be removed from role"}), 400
    if identifier in repository[organization]["roles"][role]['permissions']: repository[organization]["roles"][role]['permissions'].remove(identifier)
    elif identifier in repository[organization]["roles"][role]['acl']: repository[organization]["roles"][role]['acl'].remove(identifier)
    else: return repUtils.encrypt_response_symmetric(token ,{"error": "Invalid permission"}), 400
    if not force_flag and not validate_subject_permission(organization, session_id, username, 'ROLE_MOD'):
            repository[organization]["roles"][role]['permissions'].append(identifier)
            return repUtils.encrypt_response_symmetric(token ,{"abort": "Use f/force to remove user admin privileges"}), 400
    save_state()
    return repUtils.encrypt_response_symmetric(token ,{"success": True})

# rep_add_doc <session file> <document name> <file>
@app.route('/repository/organization/documents/add_doc', methods=['POST'])
def rep_add_doc():
    if not "session_id" in request.form: return repUtils.encrypt_response_symmetric(None,{"error": "session file needed"}), 400
    session_hash = request.form["session_id"]
    token = open_sessions[session_hash]
    request_data : Req = repUtils.decrypt_request_symmetric(token, request)
    
    token = request_data.new_token
    open_sessions[session_hash] = token
    save_state()


    organization, session_id, username = get_valid_session_information(request_data.files["session_file"], request_data.form["previous_interaction"])
    if not username: return repUtils.encrypt_response_symmetric(token ,organization), 400 # In this case, 'organization' is an error message
    document_name = request_data.form["document_name"]
    file_content = request_data.files['file']
    metadata = request_data.form['metadata']
        
    if not validate_subject_permission(organization, session_id, username, 'DOC_NEW'): return repUtils.encrypt_response_symmetric(token ,{"error": "Permission denied"}), 400
    # if metadata['file_handle'] != compute_hash(file_content.encode()): return repUtils.encrypt_response(repository[organization][username]["pubkey"] if username else None,{"error": "File handle mismatch"}), 400
    if document_name in repository[organization]['documents'] or os.path.exists(f"{FILES_DIR}{metadata['file_handle']}"): return repUtils.encrypt_response_symmetric(token ,{"error": "File already exists"}), 400
    os.makedirs(f"{FILES_DIR}", exist_ok=True)
    os.makedirs(f"metadatas/", exist_ok=True)
    with open(f"{FILES_DIR}{metadata['file_handle']}", 'wb') as file: file.write(file_content)
    with open(f"metadatas/{document_name}", 'w') as metadata_file: 
        json.dump({
            "document_handle": None,
            "create_date": datetime.now().isoformat(),
            "creator": username,
            "file_handle": metadata['file_handle'],
            "acl": {"Managers": ["DOC_ACL", "DOC_READ", "DOC_DELETE"]},
            "deleter": None,
            "key": repUtils.decode_bytes2string(repUtils.hybrid_encryption(load_pem_public_key(repository[organization]['public_key'].encode(), backend=default_backend()), repUtils.encode_string2bytes(metadata['key']), "AES")),
            "algorithm": metadata["algorithm"],
        }, metadata_file)
    
    repository[organization]['documents'].append(document_name)
    save_state()
    return repUtils.encrypt_response_symmetric(token ,{"success": True})

# rep_get_doc_metadata <session file> <document name>
@app.route('/repository/organization/documents/get_doc_metadata', methods=['GET'])
def rep_get_doc_metadata():
    if not "session_id" in request.form: return repUtils.encrypt_response_symmetric(None,{"error": "session file needed"}), 400
    session_hash = request.form["session_id"]
    token = open_sessions[session_hash]
    request_data : Req = repUtils.decrypt_request_symmetric(token, request)
    
    token = request_data.new_token
    open_sessions[session_hash] = token
    save_state()


    organization, session_id, username = get_valid_session_information(request_data.files["session_file"], request_data.form["previous_interaction"])
    if not username: return repUtils.encrypt_response_symmetric(token ,organization), 400 # In this case, 'organization' is an error message
    document_name = request_data.form["document_name"]
        
    if not validate_document_permission(organization, session_id, document_name, 'DOC_READ'): return repUtils.encrypt_response_symmetric(token ,{"error": "Permission denied"}), 400
    if document_name not in repository[organization]['documents']: return repUtils.encrypt_response_symmetric(token ,{"error": "Invalid document"}), 400

    with open(f"metadatas/{document_name}", 'r') as metadata_file:
        metadata_file = metadata_file.read()
        
        content = repUtils.hybrid_encryption(repository[organization][username]["pubkey"], metadata_file.encode(), "AES")
        mac = repUtils.mac_sign_assymmetric(rep_private_key, content)
        s = len(mac).to_bytes(20, byteorder='big')
        
        buff = io.BufferedReader(io.BytesIO(s + mac + content))
        return send_file(buff, as_attachment=True, download_name="save")

# rep_get_doc_file <session file> <document name> [file]
@app.route('/repository/organization/documents/get_doc_file', methods=['GET'])
def rep_get_doc_file():
    if not "session_id" in request.form: return repUtils.encrypt_response_symmetric(None,{"error": "session file needed"}), 400
    session_hash = request.form["session_id"]
    token = open_sessions[session_hash]
    request_data : Req = repUtils.decrypt_request_symmetric(token, request)
    
    token = request_data.new_token
    open_sessions[session_hash] = token
    save_state()


    organization, session_id, username = get_valid_session_information(request_data.files["session_file"], request_data.form["previous_interaction"])
    if not username: return repUtils.encrypt_response_symmetric(token ,organization), 400 # In this case, 'organization' is an error message
    document_name = request_data.form["document_name"]
    info = request_data.form["info"]
    
    if not validate_document_permission(organization, session_id, document_name, 'DOC_READ'): return repUtils.encrypt_response_symmetric(token ,{"error": "Permission denied"}), 400
    if document_name not in repository[organization]['documents']: return repUtils.encrypt_response_symmetric(token ,{"error": "Invalid document"}), 400

    if info == "meta":  
        with open(f"metadatas/{document_name}", 'r') as metadata_file: 
            metadata_file = json.loads(metadata_file)
            return repUtils.encrypt_response_symmetric(token ,{"res": metadata_file})

    if info == "file":
        with open(f"{FILES_DIR}{metadata_file['file_handle']}", 'r') as file: 
            content = file.read()
            mac = repUtils.mac_sign_assymmetric(rep_private_key, content)
            s = len(mac).to_bytes(20, byteorder='big')
            
            buff = io.BufferedReader(io.BytesIO(s + mac + content))
            return send_file(buff, as_attachment=True, download_name="save")
            

# rep_delete_doc <session file> <document name>
@app.route('/repository/organization/documents/delete_doc', methods=['POST'])
def rep_delete_doc():
    if not "session_id" in request.form: return repUtils.encrypt_response_symmetric(None,{"error": "session file needed"}), 400
    session_hash = request.form["session_id"]
    token = open_sessions[session_hash]
    request_data : Req = repUtils.decrypt_request_symmetric(token, request)
    
    token = request_data.new_token
    open_sessions[session_hash] = token
    save_state()


    organization, session_id, username = get_valid_session_information(request_data.files["session_file"], request_data.form["previous_interaction"])
    if not username: return repUtils.encrypt_response_symmetric(token ,organization), 400 # In this case, 'organization' is an error message
    document_name = request_data.form["document_name"]
    
    if not validate_document_permission(organization, session_id, document_name, 'DOC_DELETE'): return repUtils.encrypt_response_symmetric(token ,{"error": "Permission denied"}), 400
    if document_name not in repository[organization]['documents']: return repUtils.encrypt_response_symmetric(token ,{"error": "Invalid document"}), 400
    
    if os.path.isdir('metadatas') : os.makedirs("metadatas", exist_ok=True)
    
    with open(f"metadatas/{document_name}", 'r') as metadata_file:
        metadata = json.load(metadata_file)
        file_handle = metadata["file_handle"]
        metadata["file_handle"] = None
    with open(f"metadatas/{document_name}", 'w') as metadata_file:
        json.dump(metadata, metadata_file)
    repository[organization]['documents'].remove(document_name)
    save_state()
    return repUtils.encrypt_response_symmetric(token ,{"file_handle": file_handle})

# rep_acl_doc <session file> <document name> [+/-] <role> <permission>
@app.route('/repository/organization/documents/acl_doc', methods=['POST'])
def rep_acl_doc():
    if not "session_id" in request.form: return repUtils.encrypt_response_symmetric(None,{"error": "session file needed"}), 400
    session_hash = request.form["session_id"]
    token = open_sessions[session_hash]
    request_data : Req = repUtils.decrypt_request_symmetric(token, request)
    
    token = request_data.new_token
    open_sessions[session_hash] = token
    save_state()


    organization, session_id, username = get_valid_session_information(request_data.files["session_file"], request_data.form["previous_interaction"])
    if not username: return repUtils.encrypt_response_symmetric(token ,organization), 400 # In this case, 'organization' is an error message
    document_name = request_data.form["document_name"]
    operation = int(request_data.form["operation"])
    role = request_data.form["role"]
    permission = request_data.form["permission"]
    
    if not validate_document_permission(organization, session_id, document_name, 'DOC_ACL'): return repUtils.encrypt_response_symmetric(token ,{"error": "Permission denied"}), 400
    if document_name not in repository[organization]['documents']: return repUtils.encrypt_response_symmetric(token ,{"error": "Invalid document"}), 400
    
    with open(f"metadatas/{document_name}", 'r') as metadata_file:
        metadata = json.load(metadata_file)
        if role not in metadata['acl']: return repUtils.encrypt_response_symmetric(token ,{"error": "Invalid role"}), 400
        if operation: 
            if permission in metadata['acl'][role]: return repUtils.encrypt_response_symmetric(token ,{"error": "Permission already exists"}), 400
            metadata['acl'][role].append(permission)
        else:
            if permission == "DOC_ACL" and role == "Managers": return repUtils.encrypt_response_symmetric(token ,{"error": "Permission cannot be removed from role"}), 400
            if permission not in metadata['acl'][role]: return repUtils.encrypt_response_symmetric(token ,{"error": "Invalid permission"}), 400
            metadata['acl'][role].remove(permission)
    
    if os.path.exists("metadatas/"): os.makedirs("metadatas/", exist_ok=True)
    with open(f"metadatas/{document_name}", 'w') as metadata_file:
        json.dump(metadata, metadata_file)
    save_state()
    return repUtils.encrypt_response_symmetric(token ,{"success": True})



#####################################################################################
################################# RUNNING THE SERVER ################################
#####################################################################################

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=4000)