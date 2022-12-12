resource "aws_dynamodb_table" "jokes" {
  name     = "joke"
  hash_key = "id"

  attribute {
    name = "id"
    type = "S"
  }

  read_capacity  = 5
  write_capacity = 5

  stream_enabled = true
  stream_view_type = "NEW_AND_OLD_IMAGES"
}
