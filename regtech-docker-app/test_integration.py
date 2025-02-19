import requests
from app import app
import multiprocessing
import time

# Run Flask app in a separate process for integration testing
def run_app():
    app.run(host="0.0.0.0", port=5000)

def test_integration():
    # Start the Flask app in a background process
    p = multiprocessing.Process(target=run_app)
    p.start()

    # Give the app a moment to start up
    time.sleep(2)

    # Make an HTTP request to the running Flask app
    response = requests.get('http://localhost:5000/')

    # Check that the response is as expected
    assert response.status_code == 200
    assert response.text == "Hello, Welcome to Zip Reg Tech!"

    # Terminate the Flask app process
    p.terminate()
