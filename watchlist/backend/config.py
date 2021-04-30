USER = 'steiner'
PASSWORD = 'whoamisteiner3044'
HOST = '127.0.0.1' # localhost need unix sock
PORT = 3306
DB = 'flask_ex'

SQLALCHEMY_DATABASE_URI = 'mysql://{}:{}@{}:{}/{}'.format(USER, PASSWORD, HOST, PORT, DB)
SQLALCHEMY_TRACK_MODIFICATIONS = False
