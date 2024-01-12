#!/bin/ash

set -o errexit
set -o nounset
set -o pipefail

## Rewrite awstats configuration
sed -i "s/%%log_folder_name%%/${log_folder_name}/;s/%%site_domain%%/${site_domain}/" /etc/awstats/awstats.cloudfront.conf

## Create aws-cli credential file
(echo '[default]';
echo aws_access_key_id = ${aws_access_key_id};
echo aws_secret_access_key = ${aws_secret_access_key};
) > /root/.aws/credentials
chmod -R go-rx /root/.aws

echo ""
exec "$@"

