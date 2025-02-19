from flask import Flask
from flask_wtf.csrf import CSRFProtect
from config import Config

app = Flask(__name__)
app.config.from_object(Config)

csrf = CSRFProtect(app)

@app.route('/')
def hello():
    return "Hello, Welcome to Zip Reg Tech!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
