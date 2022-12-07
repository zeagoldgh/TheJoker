from chuck_norris_api import get_new_joke
from s3_upload_joke import upload_joke

joke_data_to_save = get_new_joke()
upload_joke(joke_data_to_save)
