Notes:
Make sure you change the name of the S3 bucket in params.json

* aws cloudformation create-stack --stack-name first-redshift --template-body file://create_cluster.json --parameters file://params.json --profile Jinyu
* aws cloudformation describe-stacks --stack-name first-redshift --profile Jinyu
* aws cloudformation delete-stack --stack-name first-redshift --profile Jinyu



## CloudFormation Crash Course
* When you deploy multiple resources it’s called a stack, actions are taken on this stack.
* Four key sections of the template to take note of:
* Parameters: these are the variables that go into your stack
* Conditions: used to evaluate simple Boolean logic in the template
* Resources: The things you actually want to create
* Outputs: The outputs from your stack creation, such as the query endpoint.

## What we’re going to create
* A new custom VPC with an internet gateway, public subnet, route table, route and association between them
* A security group for Redshift referencing our own IP address
* A parameter group to configure the Redshift cluster.
* A single node Redshift cluster that launches in the public subnet of your new VPC.
