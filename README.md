# Awstats for AWS CloudFront

## Sample usage

Create `.env` file.

```console
cp .env.sample .env
vi .env
```

Run the container.

```console
docker run --rm -it --privileged --env-file .env sengokyu/cloudfront-awstats
```

Require `--privileged` option cause of image uses FUSE module.

## Required environment variables

| Name                  | Purpose                                            | Sample           |
| :-------------------- | :------------------------------------------------- | :--------------- |
| aws_access_key_id     | Mount S3 filesystem. Download/Upload Awstata data. | AKIAXXXXXXXXXXXX |
| aws_secret_access_key | Same as above.                                     |                  |
| log_bucket_name       | S3 bucket name which stores access log.            |                  |
| log_folder_name       | S3 folder name of above which stores access log.   |                  |
| awstats_bucket_name   | S3 bucket name for Awstats data.                   |                  |
| site_domain           | SiteDomain parameter in Awstats configuration.     | www.example.com  |

## Internal work

1. Update **LogFolder** and **SiteDomain** parameter in Awstats configuration.
1. Mount **log_bucket_name** to `/logs` directory via S3fs-fuse.
1. Download `data` folder in **awstats_bucket_name** to `/awstats/data`.
1. Execute awstats_buildstaticpages.pl
1. Upload result and data to **awstats_bucket_name**.
