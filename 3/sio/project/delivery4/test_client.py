import os
import subprocess
from repUtils import *

os.environ["REP_ADDRESS"] = "127.0.0.1:4000"
os.environ["REP_PUB_KEY"] = "public_key.pem"
os.makedirs("files", exist_ok=True)
with open("files/file1.txt", "w") as f: f.write("This is a test file")

def run_command(command, expected_output=None):
  #expected_output=None
  print(f"Running Command: {command}")
  result = subprocess.run(command, shell=True, text=True, capture_output=True)
  if result.stderr: print(f"Error:\n{result.stderr}")
  if result.stdout: print(f"Output: {result.stdout}")
  print("________________________________________________________")
  if expected_output: assert  expected_output in result.stdout, f"Expected output '{expected_output}' not found in:\n{result.stdout}"
  print("________________________________________________________")


########## GETTING REPO PUBKEY ###########
command = f"python3 client.py rep_get_rep_key"
run_command(command, expected_output=None)


########## CREATING CREDENTIALS ##########
command = f"python3 client.py rep_subject_credentials mypassword sessions/elon/elon_credentials.json"
run_command(command, expected_output="Credentials saved to sessions/elon/elon_credentials.json")


############# CREATING ORGS ##############
command = f"python3 client.py rep_create_org SpaceX elon ELONMUSK elon.musk@spacex.org sessions/elon/elon_credentials.json"
run_command(command, expected_output=None)
# command = f"python3 client.py rep_create_org Apple steve STEVEJOBS steve.jobs@apple.com sessions/steve/steve_credentials.json"
# run_command(command, expected_output=None)


######### LISTING ORGANIZATIONS ##########
command = f"python3 client.py rep_list_orgs"
run_command(command, expected_output="{'organizations': ['SpaceX']}")


########### CREATING SESSIONS ############
command = f"python3 client.py rep_create_session SpaceX elon mypassword sessions/elon/elon_credentials.json sessions/elon/elon_session.json"
run_command(command, expected_output=None)


############# ASSUMING ROLES #############
command = f"python3 client.py rep_assume_role sessions/elon/elon_session.json Managers"
run_command(command, expected_output="{'success': True}")


############# ADDING PEOPLE ##############
command = f"python3 client.py rep_subject_credentials mypassword sessions/donald/donald_credentials.json"
run_command(command, expected_output="Credentials saved to sessions/donald/donald_credentials.json")
command = f"python3 client.py rep_add_subject sessions/elon/elon_session.json donald DONALDHARRISON donald.harrison@spacex.org sessions/donald/donald_credentials.json"
run_command(command, expected_output="{'success': True}")

command = f"python3 client.py rep_subject_credentials mypassword sessions/gwynne/gwynne_credentials.json"
run_command(command, expected_output="Credentials saved to sessions/gwynne/gwynne_credentials.json")
command = f"python3 client.py rep_add_subject sessions/elon/elon_session.json gwynne GWYNNESHOTWELL gwynne.shotwell@spacex.org sessions/gwynne/gwynne_credentials.json"
run_command(command, expected_output="{'success': True}")


############ CREATING ROLES  #############
command = f"python3 client.py rep_add_role sessions/elon/elon_session.json Executives"
run_command(command, expected_output="{'success': True}")


############# LISTING ROLES #############
command = f"python3 client.py rep_list_roles sessions/elon/elon_session.json"
run_command(command, expected_output="{'roles': ['Managers']}")


###### ADDING PERMISSIONS TO ROLES  ######
command = f"python3 client.py rep_add_permission sessions/elon/elon_session.json Executives DOC_NEW"
run_command(command, expected_output="{'success': True}")
command = f"python3 client.py rep_add_permission sessions/elon/elon_session.json Executives SUBJECT_NEW"
run_command(command, expected_output="{'success': True}")
command = f"python3 client.py rep_add_permission sessions/elon/elon_session.json Executives SUBJECT_DOWN"
run_command(command, expected_output="{'success': True}")
command = f"python3 client.py rep_add_permission sessions/elon/elon_session.json Executives SUBJECT_UP"
run_command(command, expected_output="{'success': True}")
command = f"python3 client.py rep_add_permission sessions/elon/elon_session.json Executives ROLE_DOWN"
run_command(command, expected_output="{'success': True}")
command = f"python3 client.py rep_add_permission sessions/elon/elon_session.json Executives ROLE_UP"
run_command(command, expected_output="{'success': True}")
command = f"python3 client.py rep_add_permission sessions/elon/elon_session.json Managers ROLE_MOD"
run_command(command, expected_output="{'error': 'Permission already exists'}")
command = f"python3 client.py rep_add_permission sessions/elon/elon_session.json Executives ROLE_MOD"
run_command(command, expected_output="{'success': True}")


######### ADDING PEOPLE TO ROLES  ########
command = f"python3 client.py rep_add_permission sessions/elon/elon_session.json Managers gwynne"
run_command(command, expected_output="{'success': True}")
command = f"python3 client.py rep_add_permission sessions/elon/elon_session.json Executives donald"
run_command(command, expected_output="{'success': True}")


########### CREATING SESSIONS ############
command = f"python3 client.py rep_create_session SpaceX gwynne mypassword sessions/gwynne/gwynne_credentials.json sessions/gwynne/gwynne_session.json"
run_command(command, expected_output=None)
command = f"python3 client.py rep_create_session SpaceX donald mypassword sessions/donald/donald_credentials.json sessions/donald/donald_session.json"
run_command(command, expected_output=None)


############# ASSUMING ROLES #############
command = f"python3 client.py rep_assume_role sessions/gwynne/gwynne_session.json Managers"
run_command(command, expected_output="{'success': True}")
command = f"python3 client.py rep_assume_role sessions/donald/donald_session.json Executives"
run_command(command, expected_output="{'success': True}")


##### REMOVING PERMISSIONS TO ROLES  #####
command = f"python3 client.py rep_remove_permission sessions/donald/donald_session.json Executives ROLE_MOD"
run_command(command, expected_output="{'abort': 'Use f/force to remove user admin privileges'}")
command = f"python3 client.py rep_remove_permission sessions/donald/donald_session.json Executives ROLE_MOD force"
run_command(command, expected_output="{'success': True}")


############# DROPPING ROLES #############
command = f"python3 client.py rep_drop_role sessions/gwynne/gwynne_session.json Managers"
run_command(command, expected_output="{'success': True}")
command = f"python3 client.py rep_drop_role sessions/gwynne/gwynne_session.json Managers"
run_command(command, expected_output="{'error': 'Invalid role'}")


########### DONALD ADDS PERSON ###########
command = f"python3 client.py rep_subject_credentials mypassword sessions/brian/brian_credentials.json"
run_command(command, expected_output="Credentials saved to sessions/brian/brian_credentials.json")
command = f"python3 client.py rep_add_subject sessions/donald/donald_session.json brian BRIANBJELDE brian.bjelde@spacex.org sessions/brian/brian_credentials.json"
run_command(command, expected_output="{'success': True}")


########### CHANGING STATUS #############
command = f"python3 client.py rep_suspend_subject sessions/elon/elon_session.json brian"
run_command(command, expected_output="{'success': True}")


########### LISTING SUBJECTS #############
command = f"python3 client.py rep_list_subjects sessions/elon/elon_session.json brian"
run_command(command, expected_output="{'brian': False}")
command = f"python3 client.py rep_list_subjects sessions/elon/elon_session.json"
run_command(command, expected_output="{'brian': False, 'donald': True, 'elon': True, 'gwynne': True}")


########### CHANGING STATUS #############
command = f"python3 client.py rep_activate_subject sessions/elon/elon_session.json brian"
run_command(command, expected_output="{'success': True}")


########### LISTING SUBJECTS #############
command = f"python3 client.py rep_list_subjects sessions/elon/elon_session.json brian"
run_command(command, expected_output="{'brian': True}")


########### CHANGING STATUS #############
command = f"python3 client.py rep_suspend_role sessions/elon/elon_session.json Executives"
run_command(command, expected_output="{'success': True}")
command = f"python3 client.py rep_suspend_role sessions/elon/elon_session.json Executives"
run_command(command, expected_output="{'error': 'Role already suspended'}")
command = f"python3 client.py rep_reactivate_role sessions/elon/elon_session.json Executives"
run_command(command, expected_output="{'success': True}")


######### LISTING ROLE SUBJECTS #########
command = f"python3 client.py rep_list_role_subjects sessions/elon/elon_session.json Managers"
run_command(command, expected_output="{'roles': ['elon', 'gwynne']}")
command = f"python3 client.py rep_list_role_subjects sessions/elon/elon_session.json Executives"
run_command(command, expected_output="{'roles': ['donald']}")


######### LISTING SUBJECT ROLES #########
command = f"python3 client.py rep_list_subject_roles sessions/elon/elon_session.json gwynne"
run_command(command, expected_output="{'roles': ['Managers']}")
command = f"python3 client.py rep_list_subject_roles sessions/elon/elon_session.json brian"
run_command(command, expected_output="{'roles': []}")
command = f"python3 client.py rep_list_subject_roles sessions/elon/elon_session.json nonexistantperson"
run_command(command, expected_output="{'error': 'Invalid subject'}")


######## LISTING ROLE PERMISSIONS #######
command = f"python3 client.py rep_list_role_permissions sessions/elon/elon_session.json Managers"
run_command(command, expected_output="{'permissions': ['ROLE_NEW', 'ROLE_DOWN', 'ROLE_UP', 'ROLE_MOD', 'DOC_NEW', 'SUBJECT_NEW', 'SUBJECT_DOWN', 'SUBJECT_UP', 'ROLE_ACL']}")
command = f"python3 client.py rep_list_role_permissions sessions/elon/elon_session.json Executives"
run_command(command, expected_output="{'permissions': ['ROLE_DOWN', 'ROLE_UP', 'DOC_NEW', 'SUBJECT_NEW', 'SUBJECT_DOWN', 'SUBJECT_UP']}")


######## LISTING PERMISSION ROLES #######
command = f"python3 client.py rep_list_permission_roles sessions/gwynne/gwynne_session.json ROLE_MOD"
run_command(command, expected_output="{'roles': ['Managers']}")
command = f"python3 client.py rep_list_permission_roles sessions/gwynne/gwynne_session.json SUBJECT_NEW"
run_command(command, expected_output="{'roles': ['Managers', 'Executives']}")


########### Adding Document ##############
command = f"python3 client.py rep_add_doc sessions/elon/elon_session.json file1 files/file1.txt"
run_command(command, expected_output="{'success': True}")


########### Downloading File #############
command = f"python3 client.py rep_get_file e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855 file2.txt"
run_command(command, expected_output=None)


############ LISTING DOCUMENTS ###########
command = f"python3 client.py rep_list_docs sessions/elon/elon_session.json"
run_command(command, expected_output=None)
command = f"python3 client.py rep_list_docs sessions/elon/elon_session.json elon"
run_command(command, expected_output=None)


####### GETTING DOCUMENT METADATA ########
command = f"python3 client.py rep_get_doc_metadata sessions/elon/elon_session.json file1"
run_command(command, expected_output=None)


############ GETTING DOCUMENT ############
command = f"python3 client.py rep_get_doc_file sessions/elon/elon_session.json file1 file3" 
run_command(command, expected_output=None)


############# CHANGE DOC ACL #############
command = f"python3 client.py rep_acl_doc sessions/elon/elon_session.json file1 - Managers DOC_READ"
run_command(command, expected_output="{'success': True}")
command = f"python3 client.py rep_acl_doc sessions/elon/elon_session.json file1 + Managers DOC_READ"
run_command(command, expected_output="{'success': True}")
command = f"python3 client.py rep_acl_doc sessions/elon/elon_session.json file1 - Managers DOC_ACL"
run_command(command, expected_output="{'error': 'Permission cannot be removed from role'}")


########### DELETING DOCUMENT ############
command = f"python3 client.py rep_delete_doc sessions/elon/elon_session.json file1"
run_command(command, expected_output="{'file_handle': 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'}")