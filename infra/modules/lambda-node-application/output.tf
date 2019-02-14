output "invoke_arn" {
  description = "Lambda function invoke arn"
  value       = "${aws_lambda_function.app.invoke_arn}"
}

output "arn" {
  description = "Lambda function arn"
  value       = "${aws_lambda_function.app.arn}"
}

output "function_name" {
  description = "Lambda function name"
  value       = "${aws_lambda_function.app.function_name}"
}
