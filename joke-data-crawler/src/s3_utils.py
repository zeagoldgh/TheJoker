import boto3
import json

s3 = boto3.resource("s3")

joke_data_bucket = ""

def get_joke_data(id):
    obj = s3.Object(joke_data_bucket, id+".json")
    joke_string = obj.get()['Body'].read().decode('utf-8')
    return json.load(joke_string)