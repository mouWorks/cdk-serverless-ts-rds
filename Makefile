#!/usr/bin/make -f

pull:
	@echo ">>> Pull Code on Current branch [$(BRANCH)]"
	git pull origin $(BRANCH) --rebase

push: pull
	@echo ">>> Current branch [$(BRANCH)] Pushing Code"
	git push origin $(BRANCH)

start:
	@echo "start local service"
	docker-compose up -d

stop:
	@echo "stop local service"
	docker-compose stop

deploy:
	@echo "Deploying using AWS CDK"
	cd cdk && cdk deploy
