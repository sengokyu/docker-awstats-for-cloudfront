image_tag=sengokyu/awstats-for-cloudfront:latest

build:
	docker build -t $(image_tag) --force-rm .

shell:
	docker run -it --rm --env-file .env $(image_tag) /bin/sh

run:
	docker run -it --rm --env-file .env $(image_tag)

clean:
	docker rmi $(image_tag)

push:
    docker push $(image_tag)
