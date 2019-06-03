-- Copy same file in  times using a manifest
COPY imdb.title_basics
FROM 's3://colibri-digital-source-data/import.manifest'
IGNOREHEADER 1
ACCEPTINVCHARS
DELIMITER '\t'
GZIP
iam_role 'arn:aws:iam::123:role/jinyu-redshift-AccessS3BucketsRole-xxx'
manifest;

-- Copy one file
COPY imdb.name_basics
FROM 's3://colibri-digital-source-data/name.basics.tsv.gz'
IGNOREHEADER 1
ACCEPTINVCHARS
DELIMITER '\t'
GZIP
iam_role 'arn:aws:iam::123:role/jinyu-redshift-AccessS3BucketsRole-xxx';

