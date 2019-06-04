# Example 2
Notes:
Make sure you change the name of the S3 bucket in params.json

## download files[title.akas.tsv.gz, title.basics.tsv.gz] from
* https://datasets.imdbws.com/
* unzip title.akas.tsv.gz to title.akas.tsv. this example we will know the redshift can detail with plain file or compressed file.

* COPY cjy.title
* FROM 's3://colibri-digital-source-data/title.akas.tsv'
* IGNOREHEADER 1
* ACCEPTINVCHARS
* DELIMITER '\t'
* iam_role 'arn:aws:iam::123:role/first-redshift-AccessS3BucketsRole-xxx';

* COPY cjy.title_basics
* FROM 's3://colibri-digital-source-data/title.basics.tsv.gz'
* IGNOREHEADER 1
* ACCEPTINVCHARS
* DELIMITER '\t'
* GZIP <-- I want to highlight here
* iam_role 'arn:aws:iam::123:role/first-redshift-AccessS3BucketsRole-xxx';


## For this example, we want to load a dataset that’s got a fairly large number of records - ideally at least 1M
* We want to be able to load the data into more than one table so we can demonstrate joining it.
* The data needs to be easily downloadable in a recognizable flat file format.
* Ideally we should easily be able to understand the semantics of the dataset - i.e. what it means without any domain specific knowledge.


* aws cloudformation create-stack --stack-name first-redshift --template-body file://create_cluster.json --parameters file://params.json --capabilities CAPABILITY_IAM --profile Jinyu
* aws cloudformation describe-stacks --stack-name first-redshift  --profile Jinyu
* aws cloudformation delete-stack --stack-name first-redshift  --profile Jinyu
* aws cloudformation update-stack --stack-name redshift-spectrum --template-body file://create_cluster.json --parameters file://params.json --capabilities CAPABILITY_IAM --profile Jinyu

## see the progress in the cloudformation, and once the redshift has been created, go to Redshift dashborad.


## connect to the new created Redshfit. eg. DataGrip, Pestico
* run `* aws cloudformation describe-stacks --stack-name first-redshift`, from the Outputs find out the Redsfhit endpoint. 
* from the params.json find your database name, username and password.
* run the query from copy_data.sql copy files from S3 to Redshift

