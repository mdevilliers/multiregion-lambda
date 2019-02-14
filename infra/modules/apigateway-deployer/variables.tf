variable "lambda_invoke_arn" {
  description = "The unique arn to invoke the lambda"
  default     = ""
}

variable "lambda_function_name" {
  description = "The name of the lambda function"
  default     = ""
}

variable "api_name" {
  description = "The name of the api gateway"
  default     = ""
}

variable "api_stage_name" {
  description = "The api gateway stage name to use"
  default     = ""
}

variable "api_swagger_filepath" {
  description = "The path to the application swagger file"
  default     = ""
}

variable "region" {
  description = "The region to deploy to"
  default     = ""
}


