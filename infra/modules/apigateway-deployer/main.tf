provider "aws"{}

data "aws_caller_identity" "current" {}

resource "aws_api_gateway_rest_api" "api" {
  name        = "${var.api_name}"
  description = "Rest API"
  body        = "${data.template_file.swagger.rendered}"
}

resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowAPIGatewayInvoke_${var.region}"
  action        = "lambda:InvokeFunction"
  function_name = "${var.lambda_function_name}"
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:${var.region}:${data.aws_caller_identity.current.account_id}:${aws_api_gateway_rest_api.api.id}/*/*"
}

data "template_file" "swagger" {
  template ="${file("${var.api_swagger_filepath}")}"

  vars {
    lambda_invoke_arn = "${var.lambda_invoke_arn}"
    account_id        = "${data.aws_caller_identity.current.account_id}"
  }
}

resource "aws_api_gateway_deployment" "deployment" {
  rest_api_id = "${aws_api_gateway_rest_api.api.id}"
  stage_name  = "${var.api_stage_name}"
}
