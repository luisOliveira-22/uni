import os, shutil

def eraese(folder):
    
    for filename in os.listdir(folder):
        file_path = os.path.join(folder, filename)
        try:
            if os.path.isfile(file_path) or os.path.islink(file_path):
                os.unlink(file_path)
                os.remove(file_path)
            elif os.path.isdir(file_path):
                shutil.rmtree(file_path)
                eraese(file_path)
        except Exception as e:
            print('Failed to delete %s. Reason: %s' % (file_path, e))
        
        os.remove(folder)

def default_eraese():
    

    folders = ['./files', './metadatas', './private', './sessions', './repo', './__pycache__']
    for folder in folders:
        try:
            eraese(folder)
            os.rmdir(folder)
        except:
            print('Failed to delete %s' % folder)
            pass
    try:
        os.remove('./filename')
    except:
        print('Failed to delete %s' % './filename')
        pass

for i in range(6):
    default_eraese()