import boto3
import os
client = boto3.client("sns")

topic_arn = os.getenv("TOPIC_ARN")

def inform_when_there_is_a_new_joke(value, id):
    client.publish(
        TopicArn=topic_arn,
        Message= "New Joke: "+ value +" \n "+id,
        Subject= "New Joke: " + value
    )



def handler_new_image(newImage):
    value = newImage["value"]["s"]
    id = newImage["id"]["s"]
    if "aws" in value.lower or "aws" in id.lower():
        inform_when_there_is_a_new_joke(value, id)


def handler_record(record):
    if "NewImage" in record["dynamodb"]:
        handler_new_image(record["dynamodb"]["NewImage"])


def handler(event, context):
    for record in event["Records"]:
        handler_record(record)
    print(event)