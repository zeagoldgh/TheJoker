from chucknorrisapi import load_jokes
from dynamodb_utils import save_joke_to_dynamodb


def map_jokes(joke_from_api):
    
        
    return ({
           "id": joke_from_api["id"],
    "joke_value": joke_from_api["value"],
        })

def handler(event, context):
    jokes_from_api = load_jokes()
    jokes = map_jokes(jokes_from_api)
    save_joke_to_dynamodb(jokes)
    

if __name__ == "__main__":
    handler({},{})