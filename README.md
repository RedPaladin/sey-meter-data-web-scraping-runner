# Docker with Self-hoster runner to run the test of sey-meter-data-web-scraping

## Pull the docker image from dockerhub

`docker pull redpaladin751/sey-meter-data-web-scraping-runner`

## Build the docker image

`docker build . -t sey-meter-data-web-scraping-runner`

## Run the docker image

`docker run -e GH_RUNNER_URL=changeme -e GH_RUNNER_TOKEN=changeme sey-meter-data-web-scraping-runner`
