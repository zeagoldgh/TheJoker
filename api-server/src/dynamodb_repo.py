import boto3
dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('joke')


def get_joke_data(id):
    response = table.get_item(
        Key={
            'id': id
        }
    )
    return response['Item']

def list_jokes():
    response = table.scan(Limit = 10)
    return response['Items']
