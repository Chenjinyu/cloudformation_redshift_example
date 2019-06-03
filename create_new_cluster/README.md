Notes:
Make sure you change the name of the S3 bucket in params.json

* aws cloudformation create-stack --stack-name first-redshift --template-body file://create_cluster.json --parameters file://params.json --profile Jinyu
* aws cloudformation describe-stacks --stack-name first-redshift --profile Jinyu
* aws cloudformation delete-stack --stack-name first-redshift --profile Jinyu
