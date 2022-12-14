import boto3
import os

dynamodb = boto3.resource("dynamodb")

jokes_table_name = "jokes"

jokes_table = dynamodb.Table(jokes_table_name)


def save_joke_to_dynamodb(joke):
    jokes_table.put_item(Item = joke)

def save_jokes_to_dynamodb(jokes):
    for joke in jokes:
        save_joke_to_dynamodb(joke)
        