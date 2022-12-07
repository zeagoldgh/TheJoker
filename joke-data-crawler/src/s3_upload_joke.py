import json
import boto3

s3_client = boto3.client("s3")

def upload_joke(joke_data_to_save):
    with open("joke.json", "w") as file:
        file.write(json.dumps(joke_data_to_save))

s3_client.upload_file('joke.json', 'joke-src-bucket-dzaa1417', 'joke.json')