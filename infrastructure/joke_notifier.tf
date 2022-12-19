resource "aws_lambda_function" "joke_notifier" {
  function_name = "joke_notifier"
  filename        = "../build/sns-notifier.zip"
  role          = local.iam_role
  handler       = "sns_notifier.handler"
  timeout       = 300
  runtime       = "python3.9"
  source_code_hash = filebase64sha256("../build/sns-notifier.zip")

environment {
    variables = {
      TOPIC_ARN = aws_sns_topic.jokes_topic.arn
    }
  }
}

resource "aws_lambda_event_source_mapping" "joke_table_update" {
  event_source_arn  = aws_dynamodb_table.jokes.stream_arn
  function_name     = aws_lambda_function.joke_notifier.arn
  starting_position = "LATEST"
}

resource "aws_sns_topic" "jokes_topic" {
  name = "jokestopic"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.jokes_topic.arn
  protocol  = "email"
  endpoint  = "owolabisulaimon90@gmail.com"
}
