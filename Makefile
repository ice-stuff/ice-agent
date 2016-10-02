.PHONY: all \
	help \
	deps update-deps \
	test \
	lint

all:
	go build -o ice-agent .

###### Help ###################################################################

help:
	@echo '    all ................................. builds the grootfs cli'
	@echo '    deps ................................ installs dependencies'
	@echo '    update-deps ......................... updates dependencies'
	@echo '    test ................................ runs tests in Docker'
	@echo '    lint ................................ lint the Go code'
	@echo '    docker .............................. build the Docker image'
	@echo '    docker-push ......................... push the built Docker image'

###### Dependencies ###########################################################

deps:
	glide install

update-deps:
	glide update

###### Testing ################################################################

test:
	./hack/run-tests
	./hack/run-tests -i

###### Code quality ###########################################################

lint:
	./hack/lint

###### Docker #################################################################

docker:
	docker build -t glestaris/ice-agent-test .

docker-push:
	docker push glestaris/ice-agent-test
