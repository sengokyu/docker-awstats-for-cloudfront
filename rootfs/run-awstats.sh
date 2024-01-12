#!/bin/ash

set -o errexit
set -o nounset
set -o pipefail

MOUNT_POINT=/logs
DATA_DIR=/awstats/data
OUTPUT_DIR=/awstats/result

## Mount S3
s3fs ${log_bucket_name} ${MOUNT_POINT}

## Copy stored data files
aws s3 sync s3://${awstats_bucket_name}/data /awstats/data

## Run awstats
awstats_buildstaticpages.pl -config=cloudfront -lang=jp -update -dir=${OUTPUT_DIR}

## Copy result and data files
aws s3 sync /awstats s3://${awstats_bucket_name}

