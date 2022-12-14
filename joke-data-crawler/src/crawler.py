from chucknorrisapi import load_joke
from s3_utils import save_joke_to_s3


def map_jokes(joke_from_api):
    
        
    return ({
           "id": joke_from_api["id"],
    "joke_value": joke_from_api["value"],
        })

def handler(event, context):
    joke_from_api = load_joke()
    joke = map_jokes(joke_from_api)
    save_joke_to_s3(joke)
    

if __name__ == "__main__":
    handler({},{})
