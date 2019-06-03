# Example 4

Notes:
Make sure you change the name of the S3 bucket in params.json

* aws cloudformation create-stack --stack-name jinyu-redshift-spectrum --template-body file://create_cluster.json --parameters file://params.json --capabilities CAPABILITY_IAM --profile Jinyu
* aws cloudformation describe-stacks --stack-name jinyu-redshift-spectrum
* aws cloudformation delete-stack --stack-name jinyu-redshift-spectrum
* aws cloudformation update-stack --stack-name jinyu-redshift-spectrum --template-body file://create_cluster.json --parameters file://params.json --capabilities CAPABILITY_IAM

Glue Data Catalog

