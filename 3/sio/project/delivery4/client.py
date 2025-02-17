import os
import io
import sys
import json
import hashlib
import logging
import argparse
import repUtils
import requests
from cryptography.hazmat.primitives import serialization
from cryptography.hazmat.backends import default_backend

from cryptography.hazmat.primitives.serialization import load_pem_public_key, load_pem_private_key

#####################################################################################
################################### BASE CODE #######################################
#####################################################################################

rep_public_key = None
public_key_file_path = "./private/rep_public_key.pem"
orgs = {}
KEY_SIZE = 20

logging.basicConfig(format='%(levelname)s\t- %(message)s')
logger = logging.getLogger()
logger.setLevel(logging.INFO)

def load_rep_key():
  with open(public_key_file_path, 'r') as f:
    key_sent = f.read()
    return serialization.load_pem_public_key(key_sent.encode(), default_backend())

def load_state():
  state = {}
  state_dir = os.path.join(os.path.expanduser('~'), '.sio')
  state_file = os.path.join(state_dir, 'state.json')
  if os.path.exists(state_file):
    with open(state_file, 'r') as f: state = json.loads(f.read())
  return state if state else {}

def parse_env(state):
  if 'REP_ADDRESS' in os.environ: state['REP_ADDRESS'] = os.getenv('REP_ADDRESS')
  if 'REP_PUB_KEY' in os.environ:
    rep_pub_key = os.getenv('REP_PUB_KEY')
    if os.path.exists(rep_pub_key): 
      with open(rep_pub_key, 'r') as f: state['REP_PUB_KEY'] = f.read()
  return state

def parse_args(state):
  parser = argparse.ArgumentParser()
  parser.add_argument("-k", '--key', nargs=1, help="Path to the key file")
  parser.add_argument("-r", '--repo', nargs=1, help="Address:Port of the repository")
  parser.add_argument("-v", '--verbose', help="Increase verbosity", action="store_true")
  parser.add_argument("-c", "--command", help="Command to execute")
  parser.add_argument('arg0', nargs='?', default=None)
  parser.add_argument('arg1', nargs='?', default=None)
  parser.add_argument('arg2', nargs='?', default=None)
  parser.add_argument('arg3', nargs='?', default=None)
  parser.add_argument('arg4', nargs='?', default=None)
  parser.add_argument('arg5', nargs='?', default=None)

  args = parser.parse_args()
  if args.verbose:
    logger.setLevel(logging.DEBUG)
    logger.info('Setting log level to DEBUG')

  if args.key:
    if not os.path.exists(args.key[0]) or not os.path.isfile(args.key[0]):
      logger.error(f'Key file not found or invalid: {args.key[0]}')
      sys.exit(-1)
    with open(args.key[0], 'r') as f:
      state['REP_PUB_KEY'] = f.read()
      logger.info('Overriding REP_PUB_KEY from command line')

  if args.repo:
    state['REP_ADDRESS'] = args.repo[0]
    logger.info('Overriding REP_ADDRESS from command line')

  if args.arg0: state['command'] = args.arg0
  return state, vars(args)

def save(state):
  state_dir = os.path.join(os.path.expanduser('~'), '.sio')
  state_file = os.path.join(state_dir, 'state.json')
  if not os.path.exists(state_dir):
    logger.debug('Creating state folder')
    os.mkdir(state_dir)
  with open(state_file, 'w') as f: f.write(json.dumps(state, indent=4))

state = load_state()
state = parse_env(state)
state, args = parse_args(state)
logger.debug(f"Arguments received: {args}")

if 'command' not in state:
  logger.error("Must define a command to execute")
  sys.exit(-1)



#####################################################################################
################################ AUXILIARY FUNCTIONS ################################
#####################################################################################

def generate_credentials(password, credentials_file):
  private_key, public_key = repUtils.generate_credentials()
  private_pem = repUtils.serialize_private_key(private_key)
  public_pem = repUtils.serialize_public_key(public_key)

  os.makedirs(os.path.dirname(credentials_file), exist_ok=True)
  with open(credentials_file, 'w', encoding='utf-8') as f:
    json.dump({
      "pubkey": public_pem.decode('utf-8'),
      "prikey": private_pem.decode('utf-8')
    }, f, ensure_ascii=False, indent=4)

  with open("filename", 'wt', encoding='utf-8') as f:
    f.write(credentials_file)

  return 0

def load_private(credentials_file_path = None):
  
  # with open("filename", 'r', encoding='utf-8') as f:
  #   credentials_file = f.read()

  #os.makedirs(os.path.dirname(credentials_file), exist_ok=True)

  with open(credentials_file_path, 'r', encoding='utf-8') as f:
    a = json.load(f)
    return load_pem_private_key(a["prikey"].encode('utf-8'), password=None)

  return 0

def save_token(token):
  print(token)
  with open("current_token", 'wb') as opened_session: opened_session.write(token)

def load_token():
  try :
    with open("current_token", "rb") as opened_session: return opened_session.read()
  except:
    return None

def save_session(session):
  with open("current_session", 'wb') as opened_session: opened_session.write(session)
  
def load_session():
  try :
    with open("current_session") as opened_session: return opened_session.read()
  except:
    return None

#####################################################################################
################################ CIPHERING FUNCTIONS ################################
#####################################################################################

# compute_hash <content>
def compute_hash(content):
    sha256_hash = hashlib.sha256()
    sha256_hash.update(content)
    return sha256_hash.hexdigest()

def encrypt(public_key, data, file_name, user):
  pass

def decrypt(private_key, file_name, user):
  pass

def encrypt_request(action, endpoint, data={}, files={}, json={}):
  data = {"data" : repUtils.hybrid_encryption(rep_public_key, data, "AES")}
  files = {"file" : repUtils.hybrid_encryption(rep_public_key, files, "AES")}
  json = {"json" : repUtils.hybrid_encryption(rep_public_key, files, "AES")}
  
  if action == 'GET':
    response = requests.get(endpoint, data=data, files=files, json=json)

  if action == 'POST':
    response = requests.post(endpoint, data=data, files=files, json=json)



#####################################################################################
################################# LOCAL COMMANDS ####################################
#####################################################################################


# rep_subject_credentials <password> <credentials file>
if state['command'] == 'rep_subject_credentials':
  password = args['arg1']
  credentials_file = args['arg2']

  generate_credentials(password, credentials_file)
  print(f"Credentials saved to {args['arg2']}")

# rep_decrypt_file <encrypted file> <encryption metadata>
elif state['command'] == 'rep_decrypt_file':
  file_path = args['arg1']
  meta_data_path = args['arg2']

  with open(file_path, 'rb') as file:
    with open(meta_data_path, 'r') as meta_data_file:
      meta_data = json.load(meta_data_file)
      private_key = repUtils.decode_bytes2string(meta_data["key"])
      algorithm = meta_data["algorithm"]
      content = repUtils.symmetric_decryption(private_key,file.read(), algorithm)
      print(content)



#####################################################################################
############################### ANONYMOUS API COMMANDS ##############################
#####################################################################################

# rep_get_rep_key
elif state['command'] == 'rep_get_rep_key':
  response = repUtils.encrypt_request_assymmetric(None, "GET",
    f"http://{os.environ['REP_ADDRESS']}/repository/get_rep_key",
    data={
      "info": "meta_data"
    }
  )
  key_sent =repUtils.decrypt_response_assymmetric(None,response.json())["public_key"]
  rep_public_key = serialization.load_pem_public_key(key_sent.encode(), default_backend())

  os.makedirs(os.path.dirname(public_key_file_path), exist_ok=True)
  with open(public_key_file_path, 'w') as f: 
    f.write(key_sent)
  print(f"Credentials saved to {public_key_file_path}")

  response = repUtils.encrypt_request_assymmetric(None, "GET",
    f"http://{os.environ['REP_ADDRESS']}/repository/get_rep_key",
    data={
      "info": "file"
    }
  )
  key_sent =repUtils.decrypt_response_assymmetric(None,response.json())["public_key"]
  rep_public_key = serialization.load_pem_public_key(key_sent.encode(), default_backend())
  with open(public_key_file_path, 'w') as f: 
    f.write(key_sent)
  print(f"Credentials saved to {public_key_file_path}")

# rep_create_org <organization> <username> <name> <email> <public_key_file>
elif state['command'] == 'rep_create_org':
  with open(args['arg5'], 'rb') as public_key_file:
    response = repUtils.encrypt_request_assymmetric(load_rep_key(), "POST",
      f"http://{state['REP_ADDRESS']}/repository/create_org",
        files={ "public_key_file": public_key_file },
        data={ 
          "organization": args['arg1'],
          "identifier": args['arg2'],
          "name": args['arg3'],
          "email": args['arg4'],
        }
    )
    res = repUtils.decrypt_response_assymmetric(None,response.json())
    print(res)
    orgs[args['arg1']] = res["organization_public_key"]
  print(res)

# rep_list_orgs
elif state['command'] == 'rep_list_orgs':
  response = repUtils.encrypt_request_assymmetric(load_rep_key(), "GET",f"http://{state['REP_ADDRESS']}/repository/list_orgs")
  print(repUtils.decrypt_response_assymmetric(None,response.json()))

# rep_create_session <organization> <username> <password> <credentials file> <session file>
elif state['command'] == 'rep_create_session':
  rep_public_key = load_rep_key()
  with open(args['arg4'], 'rb') as credentials_file:
    org = repUtils.derive(args['arg1'].encode()).hex()
    id = repUtils.derive(args['arg2'].encode()).hex()
    private_key = load_private(args['arg4'])
    
    
    info_to_mac = (org+id).encode() #repUtils.encode_string2bytes(org+id) # repUtils.encode_string2bytes(org + id)
    
    chMac = repUtils.mac_sign_assymmetric(private_key, info_to_mac)
    

    response = repUtils.encrypt_request_assymmetric(load_rep_key(), "POST",
      f"http://{state['REP_ADDRESS']}/repository/organization/sessions/create_session",
      challenge={ 
        "organization": org,
        "identifier": id,
        "challenge": "",
        "mac" : chMac,

      }
    )
    
    print(response.json())
    response = repUtils.decrypt_response_assymmetric(private_key,response.json(), rep_public_key)
    
    response["challenge"] = repUtils.encode_string2bytes(response["challenge"])

    answer = repUtils.solve_challenge(private_key, response["challenge"])
    chMac = repUtils.mac_sign_assymmetric(private_key, (org + id).encode() + answer)
    name  = args['arg2'] + ""
    response = repUtils.encrypt_request_assymmetric(load_rep_key(), "POST",
      f"http://{state['REP_ADDRESS']}/repository/organization/sessions/create_session",
      files={ "credentials_file": credentials_file },
      data={ 
        "organization": args['arg1'],
        "identifier": name,
        "password": args['arg3']
      },
      challenge={ 
        "organization": org,
        "identifier": id,
        "challenge": answer,
        "mac" : chMac
      },
      private_key = private_key)
    info = repUtils.decrypt_response_assymmetric(private_key,response.json(), rep_public_key)
  
    token = repUtils.encode_string2bytes(info["token"])
    info.pop("token")

  if response.status_code == 200:
    with open(args['arg5'], 'wt') as session_file: 
      json.dump(info, session_file)
    save_token(token)
    print(json.dumps(info, indent=4))
    print(name)
    print(token)
    with open(args['arg5'], 'rt') as session_file: 
      print(session_file.read())
      save_session(info[org])
  

# rep_get_file <file handle> [file]
elif state['command'] == 'rep_get_file':
  response = requests.get(
    f"http://{state['REP_ADDRESS']}/repository/files/get_file",
    data={ "file_handle": args['arg1'] }
  )
  content = response.content
  s = content[:20]
  content = content[20:]  
  n = int.from_bytes(s, byteorder='big')
  sign = content[:n]
  content = content[n:]
  if repUtils.mac_check_assymmetric(load_rep_key(), content, sign):
    with open(f"files/{args['arg2']}", 'wb') as file: file.write(content)
    print({ "success": True })
  else:
    print({ "success": False })



#####################################################################################
############################# AUTHENTICATED API COMMANDS ############################
#####################################################################################

# rep_assume_role <session file> <role>
elif state['command'] == 'rep_assume_role':

  with open(args['arg1'], 'rb') as session_file:
    token = load_token()
    
    with open(args['arg1'], 'r') as temp_session: 
      session_id_hash = json.load(temp_session)["session_id_hash"]

    response = repUtils.encrypt_request_symmetric(session_id_hash, token, "POST",
      f"http://{state['REP_ADDRESS']}/repository/organization/roles/assume_role",
        files={ "session_file": session_file },
        data={ "role": args['arg2'] }
    )
    res = response.json()
    token = repUtils.encode_string2bytes(res["new_token"])
    save_token(token)
    
  print(repUtils.decrypt_response_symmetric(token,res))

# rep_drop_role <session file> <role>
elif state['command'] == 'rep_drop_role':
  with open(args['arg1'], 'rb') as session_file:
    token = load_token()
    
    with open(args['arg1'], 'r') as temp_session: 
      session_id_hash = json.load(temp_session)["session_id_hash"]
    
    response = repUtils.encrypt_request_symmetric(session_id_hash, token, "POST",
      f"http://{state['REP_ADDRESS']}/repository/organization/roles/drop_role",
        files={ "session_file": session_file },
        data={ "role": args['arg2'] }
    )
    res = response.json()
    token = repUtils.encode_string2bytes(res["new_token"])
    save_token(token)
    
  print(repUtils.decrypt_response_symmetric(token,res))

# rep_list_role <session file> <role>
elif state['command'] == 'rep_list_roles':
  with open(args['arg1'], 'rb') as session_file:
    token = load_token()
    
    with open(args['arg1'], 'r') as temp_session: 
      session_id_hash = json.load(temp_session)["session_id_hash"]
    
    response = repUtils.encrypt_request_symmetric(session_id_hash, token, "GET",
      f"http://{state['REP_ADDRESS']}/repository/organization/list_roles",
      files={ "session_file": session_file },
      data={ "role": args['arg2'] }
    )
    res = response.json()
    token = repUtils.encode_string2bytes(res["new_token"])
    save_token(token)
    
  print(repUtils.decrypt_response_symmetric(token,res))

# rep_list_subjects <session file> [username]
elif state['command'] == 'rep_list_subjects':
  with open(args['arg1'], 'rb') as session_file:
    token = load_token()
    
    with open(args['arg1'], 'r') as temp_session: 
      session_id_hash = json.load(temp_session)["session_id_hash"]
    
    response = repUtils.encrypt_request_symmetric(session_id_hash, token, "GET",
      f"http://{state['REP_ADDRESS']}/repository/organization/list_subjects",
        files={ "session_file": session_file },
        data={ "identifier": args.get('arg2', None) }
    )
    res = response.json()
    token = repUtils.encode_string2bytes(res["new_token"])
    save_token(token)
    
  print(repUtils.decrypt_response_symmetric(token,res))

# rep_list_role_subjects <session file> <role>
elif state['command'] == 'rep_list_role_subjects':
  with open(args['arg1'], 'rb') as session_file:
    token = load_token()
    
    with open(args['arg1'], 'r') as temp_session: 
      session_id_hash = json.load(temp_session)["session_id_hash"]
    
    response = repUtils.encrypt_request_symmetric(session_id_hash, token, "GET",
      f"http://{state['REP_ADDRESS']}/repository/organization/roles/list_role_subjects",
        files={ "session_file": session_file },
        data={ "role": args['arg2'] }
    )
    res = response.json()
    token = repUtils.encode_string2bytes(res["new_token"])
    save_token(token)
    
  print(repUtils.decrypt_response_symmetric(token,res))

# rep_list_subject_roles <session file> <username>
elif state['command'] == 'rep_list_subject_roles':
  with open(args['arg1'], 'rb') as session_file:
    token = load_token()
    
    with open(args['arg1'], 'r') as temp_session: 
      session_id_hash = json.load(temp_session)["session_id_hash"]
    
    response = repUtils.encrypt_request_symmetric(session_id_hash, token, "GET",
      f"http://{state['REP_ADDRESS']}/repository/organization/subjects/list_subject_roles",
        files={ "session_file": session_file },
        data={ "identifier": args['arg2'] }
    )
    res = response.json()
    token = repUtils.encode_string2bytes(res["new_token"])
    save_token(token)
    
  print(repUtils.decrypt_response_symmetric(token,res))

# rep_list_role_permissions <session file> <role>
elif state['command'] == 'rep_list_role_permissions':
  with open(args['arg1'], 'rb') as session_file:
    token = load_token()
    
    with open(args['arg1'], 'r') as temp_session: 
      session_id_hash = json.load(temp_session)["session_id_hash"]
    
    response = repUtils.encrypt_request_symmetric(session_id_hash, token, "GET",
      f"http://{state['REP_ADDRESS']}/repository/organization/roles/list_role_permissions",
        files={ "session_file": session_file },
        data={ "role": args['arg2'] }
    )
    res = response.json()
    token = repUtils.encode_string2bytes(res["new_token"])
    save_token(token)
    
  print(repUtils.decrypt_response_symmetric(token,res))

# rep_list_permission_roles <session file> <permission>
elif state['command'] == 'rep_list_permission_roles':
  with open(args['arg1'], 'rb') as session_file:
    token = load_token()
    
    with open(args['arg1'], 'r') as temp_session: 
      session_id_hash = json.load(temp_session)["session_id_hash"]
    
    response = repUtils.encrypt_request_symmetric(session_id_hash, token, "GET",
      f"http://{state['REP_ADDRESS']}/repository/organization/roles/list_permission_roles",
        files={ "session_file": session_file },
        data={ "permission": args['arg2'] }
    )
    res = response.json()
    token = repUtils.encode_string2bytes(res["new_token"])
    save_token(token)
    
  print(repUtils.decrypt_response_symmetric(token,res))

# rep_list_docs <session file> [-s username] [-d nt/ot/et date]
elif state['command'] == 'rep_list_docs':
  with open(args['arg1'], 'rb') as session_file:
    token = load_token()
    
    with open(args['arg1'], 'r') as temp_session: 
      session_id_hash = json.load(temp_session)["session_id_hash"]
    
    response = repUtils.encrypt_request_symmetric(session_id_hash, token, "GET",
      f"http://{state['REP_ADDRESS']}/repository/organization/documents/list_docs",
      files={ "session_file": session_file },
      data={ 
        "identifier": args.get('arg2', None),
        "date": args.get('arg3', None),
      }
    )
    res = response.json()
    token = repUtils.encode_string2bytes(res["new_token"])
    save_token(token)
    
  print(repUtils.decrypt_response_symmetric(token,res))



#####################################################################################
############################## AUTHORIZED API COMMANDS ##############################
#####################################################################################

# rep_add_subject <session file> <username> <name> <email> <credentials file>
elif state['command'] == 'rep_add_subject':
  with open(args['arg1'], 'rb') as session_file:
    with open(args['arg5'], 'rb') as credentials_file:
      token = load_token()
    
      with open(args['arg1'], 'r') as temp_session: 
        session_id_hash = json.load(temp_session)["session_id_hash"]
      
      response = repUtils.encrypt_request_symmetric(session_id_hash, token, "POST",
        f"http://{state['REP_ADDRESS']}/repository/organization/subjects/add_subject",
        files={ 
          "session_file": session_file,
          "credentials_file": credentials_file
        },
        data={ 
          "identifier": args['arg2'],
          "name": args['arg3'],
          "email": args['arg4'],
        }
      )
    
    res = response.json()
    token = repUtils.encode_string2bytes(res["new_token"])
    save_token(token)
    
  print(repUtils.decrypt_response_symmetric(token,res))

# rep_suspend_subject <session file> <username>
elif state['command'] == 'rep_suspend_subject':
  with open(args['arg1'], 'rb') as session_file:
    token = load_token()
    
    with open(args['arg1'], 'r') as temp_session: 
      session_id_hash = json.load(temp_session)["session_id_hash"]
    
    response = repUtils.encrypt_request_symmetric(session_id_hash, token, "POST",
      f"http://{state['REP_ADDRESS']}/repository/organization/subjects/suspend_subject",
        files={ "session_file": session_file },
        data={ "identifier": args['arg2'] }
    )
    
    res = response.json()
    token = repUtils.encode_string2bytes(res["new_token"])
    save_token(token)
    
  print(repUtils.decrypt_response_symmetric(token,res))

# rep_activate_subject <session file> <username>
elif state['command'] == 'rep_activate_subject':
  with open(args['arg1'], 'rb') as session_file:
    token = load_token()
    
    with open(args['arg1'], 'r') as temp_session: 
      session_id_hash = json.load(temp_session)["session_id_hash"]
    
    response = repUtils.encrypt_request_symmetric(session_id_hash, token, "POST",
      f"http://{state['REP_ADDRESS']}/repository/organization/subjects/activate_subject",
        files={ "session_file": session_file },
        data={ "identifier": args['arg2'] }
    )
    res = response.json()
    token = repUtils.encode_string2bytes(res["new_token"])
    save_token(token)
    
  print(repUtils.decrypt_response_symmetric(token,res))

# rep_add_role <session file> <role>
elif state['command'] == 'rep_add_role':
  with open(args['arg1'], 'rb') as session_file:
    token = load_token()
    
    with open(args['arg1'], 'r') as temp_session: 
      session_id_hash = json.load(temp_session)["session_id_hash"]
    
    response = repUtils.encrypt_request_symmetric(session_id_hash, token, "POST",
      f"http://{state['REP_ADDRESS']}/repository/organization/roles/add_role",
        files={ "session_file": session_file },
        data={ "role": args['arg2'] }
    )
    res = response.json()
    token = repUtils.encode_string2bytes(res["new_token"])
    save_token(token)
    
  print(repUtils.decrypt_response_symmetric(token,res))

# rep_suspend_role <session file> <role>
elif state['command'] == 'rep_suspend_role':
  with open(args['arg1'], 'rb') as session_file:
    token = load_token()
    
    with open(args['arg1'], 'r') as temp_session: 
      session_id_hash = json.load(temp_session)["session_id_hash"]
    
    response = repUtils.encrypt_request_symmetric(session_id_hash, token, "POST",
      f"http://{state['REP_ADDRESS']}/repository/organization/roles/suspend_role",
        files={ "session_file": session_file },
        data={ "role": args['arg2'] }
    )
    res = response.json()
    token = repUtils.encode_string2bytes(res["new_token"])
    save_token(token)
    
  print(repUtils.decrypt_response_symmetric(token,res))

# rep_reactivate_role <session file> <role>
elif state['command'] == 'rep_reactivate_role':
  with open(args['arg1'], 'rb') as session_file:
    token = load_token()
    
    with open(args['arg1'], 'r') as temp_session: 
      session_id_hash = json.load(temp_session)["session_id_hash"]
    
    response = repUtils.encrypt_request_symmetric(session_id_hash, token, "POST",
      f"http://{state['REP_ADDRESS']}/repository/organization/roles/reactivate_role",
        files={ "session_file": session_file },
        data={ "role": args['arg2'] }
    )
    res = response.json()
    token = repUtils.encode_string2bytes(res["new_token"])
    save_token(token)
    
  print(repUtils.decrypt_response_symmetric(token,res))

# rep_add_permission <session file> <role> <username>/<permission>
elif state['command'] == 'rep_add_permission':
  with open(args['arg1'], 'rb') as session_file:
    token = load_token()
    
    with open(args['arg1'], 'r') as temp_session: 
      session_id_hash = json.load(temp_session)["session_id_hash"]
    
    response = repUtils.encrypt_request_symmetric(session_id_hash, token, "POST",
      f"http://{state['REP_ADDRESS']}/repository/organization/roles/add_permission",
        files={ "session_file": session_file },
        data={ 
          "role": args['arg2'],
          "identifier": args['arg3']
        })
    res = response.json()
    token = repUtils.encode_string2bytes(res["new_token"])
    save_token(token)
    
  print(repUtils.decrypt_response_symmetric(token,res))

# rep_remove_permission <session file> <role> <username>/<permission>
elif state['command'] == 'rep_remove_permission':
  force_flag = 1 if ("f" in args.values() or "force" in args.values()) else 0
  with open(args['arg1'], 'rb') as session_file:
    token = load_token()
    
    with open(args['arg1'], 'r') as temp_session: 
      session_id_hash = json.load(temp_session)["session_id_hash"]
    
    response = repUtils.encrypt_request_symmetric(session_id_hash, token, "POST",
      f"http://{state['REP_ADDRESS']}/repository/organization/roles/remove_permission",
        files={ "session_file": session_file },
        data={ 
          "role": args['arg2'],
          "identifier": args['arg3'],
          "force_flag": force_flag
        })
    res = response.json()
    token = repUtils.encode_string2bytes(res["new_token"])
    save_token(token)
    
  print(repUtils.decrypt_response_symmetric(token,res))

# rep_add_doc <session file> <document name> <file> [alg]
elif state['command'] == 'rep_add_doc':
  with open(args['arg1'], 'rb') as session_file:
    with open(args['arg3'], 'rb') as file:
      secret, private_key = repUtils.symmetric_encryption(file.read(), "AES")
      upload_file = io.BufferedReader(io.BytesIO(secret))

      token = load_token()
    
    with open(args['arg1'], 'r') as temp_session: 
      session_id_hash = json.load(temp_session)["session_id_hash"]
    
    response = repUtils.encrypt_request_symmetric(session_id_hash, token, "POST",
        f"http://{state['REP_ADDRESS']}/repository/organization/documents/add_doc",
        files={ 
          "session_file": session_file,
          "file": upload_file
        },
        data={ "document_name": args['arg2'],
          "metadata" : {
            "file_handle": compute_hash(file.read()),
            "key": repUtils.decode_bytes2string(private_key),
            "algorithm": args.get('arg4', "AES")
          }, 
        }
      )
    res = response.json()
    token = repUtils.encode_string2bytes(res["new_token"])
    save_token(token)
    
  print(repUtils.decrypt_response_symmetric(token,res))

# rep_get_doc_metadata <session file> <document name>
elif state['command'] == 'rep_get_doc_metadata':
  with open(args['arg1'], 'rb') as session_file:
    token = load_token()
    
    with open(args['arg1'], 'r') as temp_session: 
      session_id_hash = json.load(temp_session)["session_id_hash"]
    
    response = repUtils.encrypt_request_symmetric(session_id_hash, token, "GET",
      f"http://{state['REP_ADDRESS']}/repository/organization/documents/get_doc_metadata",
      files={ "session_file": session_file },
      data={ "document_name": args['arg2'] }
    )
  content = response.content
  s = content[:20]
  content = content[20:]  
  n = int.from_bytes(s, byteorder='big')
  sign = content[:n]
  content = content[n:]
  if repUtils.mac_check_assymmetric(load_rep_key(), content, sign):
    repUtils.hybrid_decryption(load_rep_key(), content, "AES")
    with open(f"metadatas/{args['arg2']}", 'wb') as file: file.write(content)
    print({ "success": True })
  else:
    print({ "success": False })

    res = response.json()
    token = repUtils.encode_string2bytes(res["new_token"])
    save_token(token)
    
  print(repUtils.decrypt_response_symmetric(token,res))

# rep_get_doc_file <session file> <document name> [file]
elif state['command'] == 'rep_get_doc_file':
  with open(args['arg1'], 'rb') as session_file:
    token = load_token()
    
    with open(args['arg1'], 'r') as temp_session: 
      session_id_hash = json.load(temp_session)["session_id_hash"]
    
    response = repUtils.encrypt_request_symmetric(session_id_hash, token, "GET",
      f"http://{state['REP_ADDRESS']}/repository/organization/documents/get_doc_file",
      files={ "session_file": session_file },
      data={ "document_name": args['arg2'],
            "info" : "meta" }
    )

    metadata = repUtils.decrypt_response_assymmetric(load_private(),response.json())["res"]

    token = load_token()
    
    with open(args['arg1'], 'r') as temp_session: 
      session_id_hash = json.load(temp_session)["session_id_hash"]
    response = repUtils.encrypt_request_symmetric(session_id_hash, token, "GET",
    f"http://{state['REP_ADDRESS']}/repository/organization/documents/get_doc_file",
    files={ "session_file": session_file },
    data={ "document_name": args['arg2'],
          "info" : "file" }
  )
  content = response.content

  s = content[:20]
  content = content[20:]
  n = int.from_bytes(s, byteorder='big')
  sign = content[:n]
  content = content[n:]
  
  if repUtils.mac_check_assymmetric(load_rep_key(), content, sign):
    with open(f"files/{args['arg3']}", 'wb') as file: 
      private_key = repUtils.encode_string2bytes(metadata["key"])
      content = repUtils.symmetric_decryption(private_key, content, metadata["algorithm"])
      file.write(content)
    print({ "success": True })
  else:
    print({ "success": False })
  

  # if args.get('arg3', None): 
  #   with open(f"files/{args['arg3']}") as file: file.write(repUtils.decrypt_response(load_private(),response.json()))
  #   print({ "success": True })
    res = response.json()
    token = repUtils.encode_string2bytes(res["new_token"])
    save_token(token)
    
  print(repUtils.decrypt_response_symmetric(token,res))

# rep_delete_doc <session file> <document name>
elif state['command'] == 'rep_delete_doc':
  with open(args['arg1'], 'rb') as session_file:
    token = load_token()
    
    with open(args['arg1'], 'r') as temp_session: 
      session_id_hash = json.load(temp_session)["session_id_hash"]
    
    response = repUtils.encrypt_request_symmetric(session_id_hash, token, "POST",
      f"http://{state['REP_ADDRESS']}/repository/organization/documents/delete_doc",
      files={ "session_file": session_file },
      data={ "document_name": args['arg2'] }
    )
    res = response.json()
    token = repUtils.encode_string2bytes(res["new_token"])
    save_token(token)
    
  print(repUtils.decrypt_response_symmetric(token,res))

# rep_acl_doc <session file> <document name> [+/-] <role> <permission>
elif state['command'] == 'rep_acl_doc':
  if args['arg3'] not in ['+', '-']: raise ValueError("[+/-]")
  with open(args['arg1'], 'rb') as session_file:
    token = load_token()
    
    with open(args['arg1'], 'r') as temp_session: 
      session_id_hash = json.load(temp_session)["session_id_hash"]
    
    response = repUtils.encrypt_request_symmetric(session_id_hash, token, "POST",
      f"http://{state['REP_ADDRESS']}/repository/organization/documents/acl_doc",
      files={ "session_file": session_file },
      data={ 
        "document_name": args['arg2'],
        "operation": 1 if args['arg3'] == '+' else 0,
        "role": args['arg4'],
        "permission": args['arg5']
      }
    )
    res = response.json()
    token = repUtils.encode_string2bytes(res["new_token"])
    save_token(token)
    
  print(repUtils.decrypt_response_symmetric(token,res))