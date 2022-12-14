import requests

url = "https://api.chucknorris.io/jokes/random"


def load_joke():
    response = requests.get(url)
    return response.json()
