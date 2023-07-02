build_base:
	docker-compose -p genken-cms -f docker-compose.yml build --no-cache base

build_php:
	docker-compose -p genken-cms -f docker-compose.yml build php

build_nginx:
	docker-compose -p genken-cms -f docker-compose.yml build nginx

log_php:
	docker-compose -p genken-cms -f docker-compose.yml logs -f php
access_php:
	docker-compose -p genken-cms -f docker-compose.yml exec php bash

log_nginx:
	docker-compose -p genken-cms -f docker-compose.yml logs -f nginx

show_all:
	docker-compose -p genken-cms -f docker-compose.yml ps

up:
	docker-compose -p genken-cms -f docker-compose.yml up -d php nginx phpmyadmin
down:
	docker-compose -p genken-cms -f docker-compose.yml down