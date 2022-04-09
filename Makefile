start:
	docker-compose up -d --build
	docker exec -it manjaro_linux bash
	cd /home

stop:
	docker-compose stop manjaro_linux

remove:
	docker-compose down manjaro_linux
	docker image rm manjaro_linux
	docker image rm manjarolinux/base