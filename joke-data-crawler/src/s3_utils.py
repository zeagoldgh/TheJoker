import boto3
import json

s3_client = boto3.client("s3")

joke_data_bucket = "joke-data-src-bucket-dzaa1417"

def save_joke_to_s3(joke):
    joke_data_string = json.dumps(joke)
    joke_data_bytes = str.encode(joke_data_string)
    s3_client.put_object(
        Body = joke_data_bytes,
        Bucket = joke_data_bucket,
        Key = joke["id"]+".json"
    )

def save_jokes_to_s3(jokes):
    for joke in jokes:
        save_joke_to_s3(joke)
        