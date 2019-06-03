
COPY cjy.name_basics
FROM 's3://jinyu-colibri-digital-source-data/name.basics.tsv.gz'
IGNOREHEADER 1
ACCEPTINVCHARS
DELIMITER '\t'
GZIP
iam_role 'arn:aws:iam::123:role/redshift-spectrum-AccessS3BucketsRole-xxx';

COPY cjy.title
FROM 's3://jinyu-colibri-digital-source-data/title.akas.tsv'
IGNOREHEADER 1
ACCEPTINVCHARS
DELIMITER '\t'
GZIP
iam_role 'arn:aws:iam::123:role/redshift-spectrum-AccessS3BucketsRole-xxx';

COPY cjy.title_basics
FROM 's3://jinyu-colibri-digital-source-data/title.basics.tsv.gz'
IGNOREHEADER 1
ACCEPTINVCHARS
DELIMITER '\t'
GZIP
iam_role 'arn:aws:iam::123:role/redshift-spectrum-AccessS3BucketsRole-xxx';

