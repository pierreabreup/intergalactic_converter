SHELL := /bin/bash # Use bash syntax

run:
	docker-compose run --service-ports --name finreach-container --rm app \
	ruby start.rb

test:
	docker-compose run --service-ports --name finreach-container --rm app \
	rspec

dev:
	docker-compose run --service-ports --name finreach-container --rm app

destroy:
	docker-compose down
	docker volume rm finreach_finreach-usrlocal
	docker rmi finreach_app
