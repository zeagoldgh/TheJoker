import requests

def get_new_joke():
    url = "https://api.chucknorris.io/jokes/random"
    response = requests.get(url)
    
    data = response.json()

    print ("New Joke:")
    print (data["value"])

    return {
        "id": data["id"],
        "joke": data["value"],
    } 