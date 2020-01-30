PROJECTNAME := $(notdir $(shell pwd))

prepare:
	mkdir -p jenkins
	sudo chown 1000 jenkins

deploy: prepare
	docker-compose up -d

clean:
	docker-compose down -v
	-docker rmi $(PROJECTNAME)_jenkins:latest
	-sudo rm -rf jenkins

.PHONY: prepare deploy clean