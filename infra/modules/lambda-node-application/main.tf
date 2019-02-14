provider "aws" {}

data "archive_file" "zip" {
  type        = "zip"
  source_dir  = "${var.application_filepath}"
  output_path = "${var.application_name}_${var.application_version}.zip"
}

resource "aws_lambda_function" "app" {
  function_name = "${var.application_name}_${var.application_version}"

  filename         = "${var.application_name}_${var.application_version}.zip"
  source_code_hash = "${data.archive_file.zip.output_base64sha256}"

  handler = "index.handler"
  runtime = "nodejs6.10"

  role = "${aws_iam_role.role.arn}"
}

resource "aws_iam_role" "role" {
  name = "${var.application_name}_${var.environment}_lambda_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
