import requests
import json

url = "https://api.chucknorris.io/jokes/random"
response = requests.get(url)
data = response.json()

print ("New Joke:")
print (data["value"])

joke_data = {
    "id": data["id"],
    "joke": data["value"],
} 

print(joke_data)

with open("joke.json", "w") as f:
        f.write(json.dumps(joke_data))
