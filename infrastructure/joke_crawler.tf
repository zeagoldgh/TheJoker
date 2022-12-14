resource "aws_lambda_function" "joke_crawler" {
  function_name = "joke_crawler"
  s3_bucket     = "joke-src-bucket-dzaa1417"
  s3_key        = "joke-crawler.zip"
  role          = local.iam_role
  handler    = "dynamodb_crawler.handler"
  timeout       = 300
  runtime       = "python3.9"
  layers         =[aws_lambda_layer_version.requests_layer.arn]

}

resource "aws_lambda_layer_version" "requests_layer" {
  s3_bucket     = "joke-src-bucket-dzaa1417"
  s3_key        = "requests-layer.zip"
  layer_name    = "requests-layer"

  compatible_runtimes = ["python3.9"]
}

resource "aws_cloudwatch_event_rule" "every_seven_minutes" {
    name = "every_seven_minutes"
    description = "Fires every_seven_minutes"
    schedule_expression = "rate(7 minutes)"
}

resource "aws_cloudwatch_event_target" "joke_crawler_every_seven_minutes" {
    rule = aws_cloudwatch_event_rule.every_seven_minutes.name
    target_id = "crawled-jokes"
    arn = aws_lambda_function.joke_crawler.arn
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call_joke_crawler" {
    statement_id = "AllowExecutionFromCloudWatch"
    action = "lambda:InvokeFunction"
    function_name = aws_lambda_function.joke_crawler.function_name
    principal = "events.amazonaws.com"
    source_arn = aws_cloudwatch_event_rule.every_seven_minutes.arn
}
