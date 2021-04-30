from flask import Flask
from flask_cors import CORS
app = Flask(__name__)
CORS(app, resources={r"/*": {"origins": "*"}})

# for database
from flask_sqlalchemy import SQLAlchemy
app.config.from_pyfile('config.py')
db = SQLAlchemy(app)

from backend import views, command


