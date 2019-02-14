About
-----

Toy project to deploy a Node function behind an AWS APIGateway to multiple regions in AWS


Project structure
-----------------

Folder -

./app - Node lambda function
./infra/modules/apigateway-deployer/ - Terraform module to deploy an AWS APIGateway using the apps swagger file 
./infra/modules/lambda-node-application/ -  Terraform module to deploy the node application as an AWS Lambda function
./infra/testing/ - Terraform script to provision test environment

Instructions
------------


Export your AWS credentials 

```
export AWS_ACCESS_KEY_ID=...
export AWS_SECRET_ACCESS_KEY=..
export AWS_DEFAULT_REGION=...

```

Deploy the testing instance for fun and giggles

```
cd testing
```

```
terraform init
```

```
terraform plan
```

If you want to deploy - 

```
terraform apply
```

The `testing` instance will deploy to two regions by default - eu-west-1 and eu-west-2


TODO
----

- Provision a Route53 endpoint to load balance between the multiple regions
- Save Terraform state to a more resilient place than a developer's machine
- Makefile
- Many other things...

