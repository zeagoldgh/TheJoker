from chucknorrisapi import load_joke
from dynamodb_utils import save_joke_to_dynamodb


def map_jokes(joke_from_api):
    
        
    return ({
           "id": joke_from_api["id"],
    "joke_value": joke_from_api["value"],
        })

def handler(event, context):
    joke_from_api = load_joke()
    joke = map_jokes(joke_from_api)
    save_joke_to_dynamodb(joke)
    

if __name__ == "__main__":
    handler({},{})