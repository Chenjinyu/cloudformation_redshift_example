# Example 4

Notes:
Make sure you change the name of the S3 bucket in params.json

* aws cloudformation create-stack --stack-name jinyu-redshift-spectrum --template-body file://create_cluster.json --parameters file://params.json --capabilities CAPABILITY_IAM --profile Jinyu
* aws cloudformation describe-stacks --stack-name jinyu-redshift-spectrum
* aws cloudformation delete-stack --stack-name jinyu-redshift-spectrum
* aws cloudformation update-stack --stack-name jinyu-redshift-spectrum --template-body file://create_cluster.json --parameters file://params.json --capabilities CAPABILITY_IAM

## The problem with data warehouse
* One of the great strengths of data warehouses, and relational databases in general, is that they enforce you to define your schema up front
* This can also be a big problem - what happens if you have a new data set that you want to do some short term processing on, but you don’t want to update the schema for your entire dataset?
* Previously, you’d launch a new Redshift cluster with a copy of your existing data - slow to stand-up and expensive to run

## There are cheaper options for infrequently accessed data
* Consider S3 infrequent access storage - it;s $0.0125 per month per GB of data stored.
* Storing this on a dense compute Redshift instance would cost $1.35 per GB per month, or $0.33 per GB per month on a dense storage instance
* That’s between 26 and 108x as expensive depending on the instance type you use
* If you rarely query the data, you could be paying more than 100 x S3 pricing to store it compounded by the degenerative effect the extra data may have on query performance

## Enter Redshift Spectrum
Spectrum leverages other tools in the AWS ecosystem to query data on S3, process it, and join the results with data already stored in Redshift.

## This enables a number of important new use cases
* Move infrequently accessed data to S3 knowing it’s still available for query when we need it.
* Empower new analytics use cases by allowing data scientists and analysts to import, query and join external data sets with the main data warehouse.
* Use a smaller sized Redshift cluster since we no longer need to store all of our business data in hot storage.
* Some use cases can move off of Redshift altogether.

## The life of a Redshift Spectrum Query
* All queries are submitted to the leader node of your Redshift cluster, which optimizes the query and pushes execution down to the worker nodes in your cluster.
* Worker nodes examine the data catalogue to determine which partitions are required from S3.
* Worker nodes in your cluster - generate multiple requests to Spectrum, a shared service spanning thousands of EC2 instance per region
* Spectrum worker nodes scan,filter and aggregate data in S3 before streaming the required data back to Redshift.
* The final join and merge operations are performed on your cluster before results are returned to client.
* This approach allows managed compute resources in Spectrum to scale independently of storage(S3).
* It also enables higher concurrency, since multiple Redshift clusters can query the same data in S3.
* Lastly, you only pay for the data that your queries actually scan, so effectively partitioning data will reduce cost


# Glue Data Catalog - Creating a Schema for the External Dataset

## What is Glue?
* Amazon Glue is a fully managed ETL (Extract, Transform, Load) service
* Part of this means that Glue needs to store metadata about the data sources it connections to, most importantly the schema of each of those datasets.
* This component of Glue is called the Glue Data Catalogue
* The Glue Data Catalogue is a meta store designed to store schema information about various data sets.
* This enables schema on read tools like Redshift Spectrum and Athena to work

## Why Do We Need the Data Catalogue?
* Redshift Spectrum is a schema on read tool - that means that we don’t define any schema for our data set when we write it - we just upload a file to S3.
* In order for Redshift Spectrum to query data and join it back with the data we’ve stored in Redshift, it needs to know about the schema of the files it’s querying
* This is where the data catalogue comes in - we can define the schema of those files along with the location that they’re stored in.

## Making Files Available to Redshift
* Firstly we need to create what’s called an external database with an external schema - this is how Redshift refers to data sets that are managed outside of the cluster.
* Doing so creates an entry in the Glue Data Catalogue
* We then create an external table that defines all of the properties along with the schema for the files we want Redshift Spectrum to query for us


