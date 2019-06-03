# Example 3

Notes:
Make sure you change the name of the S3 bucket in params.json

* aws cloudformation create-stack --stack-name jinyu-redshift --template-body file://create_cluster.json --parameters file://params.json --capabilities CAPABILITY_IAM --profile Jinyu
* aws cloudformation describe-stacks --stack-name jinyu-redshift --profile Jinyu
* aws cloudformation delete-stack --stack-name jinyu-redshift --profile Jinyu
* aws cloudformation update-stack --stack-name redshift-spectrum --template-body file://create_cluster.json --parameters file://params.json --capabilities CAPABILITY_IAM --profile Jinyu

