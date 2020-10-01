#include .env

PROJECTNAME=$(shell basename "$(PWD)")

JAEGER_SERVICE_NAME="api"
JAEGER_AGENT_HOST="jaeger"
JAEGER_AGENT_PORT="6831"
JAEGER_ENDPOINT="jaeger"
JAEGER_SAMPLER_MANAGER_HOST_PORT="jaeger:5778"


build:
	docker build -t opentracing_flask_example .

test:
	echo "TODO"
run:
	docker run -p 5000:5000 opentracing_flask_example:latest

all: test build 