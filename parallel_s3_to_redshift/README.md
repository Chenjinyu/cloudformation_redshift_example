# Example 3

Notes:
Make sure you change the name of the S3 bucket in params.json

1. Create Stack named jinyu-redshift
```
aws cloudformation create-stack --stack-name jinyu-redshift --template-body file://create_cluster.json --parameters file://params.json --capabilities CAPABILITY_IAM --profile Jinyu
```

2. Describe Stack
```
aws cloudformation describe-stacks --stack-name jinyu-redshift --profile Jinyu
```

3. Delete Stack
``` 
aws cloudformation delete-stack --stack-name jinyu-redshift --profile Jinyu
```

4. Update Stack
```
* aws cloudformation update-stack --stack-name redshift-spectrum --template-body file://create_cluster.json --parameters file://params.json --capabilities CAPABILITY_IAM --profile Jinyu
```
