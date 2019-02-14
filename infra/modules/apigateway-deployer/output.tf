output "base_url" {
  description = "URL for the gateway frontend"
  value       = "${aws_api_gateway_deployment.deployment.invoke_url}"
}
