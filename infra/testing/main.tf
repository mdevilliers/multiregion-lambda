provider "aws" {}

# orange is the alias for the first region
provider "aws" {
  alias  = "orange"
  region = "eu-west-1"
}

# green is the alias for the second region
provider "aws" {
  alias  = "green"
  region = "eu-west-2"
}

# deploy the node application to 'orange'
module "app_orange" {
  source = "../modules/lambda-node-application"

  providers = {
    aws = "aws.orange"
  }

  environment = "test"

  application_name     = "example"
  application_version  = "1"
  application_filepath = "../../app/"
}

# create an api to front 'orange'
module "api_orange" {
  source = "../modules/apigateway-deployer"

  providers = {
    aws = "aws.orange"
  }

  api_name       = "example"
  api_stage_name = "test"
  api_swagger_filepath = "../../app/swagger.json"

  region               = "eu-west-1"                          # TODO
  lambda_invoke_arn    = "${module.app_orange.invoke_arn}"
  lambda_function_name = "${module.app_orange.function_name}"
}

# deploy the node application to 'green'
module "app_green" {
  source = "../modules/lambda-node-application/"

  providers = {
    aws = "aws.green"
  }

  environment = "test"

  application_name     = "example"
  application_version  = "1"
  application_filepath = "../../app/"
}

# create an api to front 'orange'
module "api_green" {
  source = "../modules/apigateway-deployer"

  providers = {
    aws = "aws.green"
  }

  api_name       = "example"
  api_stage_name = "test"
  api_swagger_filepath = "../../app/swagger.json"

  region               = "eu-west-2"                         # TODO 
  lambda_invoke_arn    = "${module.app_green.invoke_arn}"
  lambda_function_name = "${module.app_green.function_name}"
}
