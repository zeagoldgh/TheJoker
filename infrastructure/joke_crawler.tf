resource "aws_lambda_function" "joke_crawler" {
  function_name = "joke_crawler"
  s3_bucket     = "joke-src-bucket-dzaa1417"
  s3_key        = "joke-crawler.zip"
  role          = "arn:aws:iam::208631683274:role/LabRole"
  handler    = "crawler.handler"
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