#
#	Makefile
#
.PHONY: help test-travis build push start

help:
	@echo "Please use: \n \
		test-travis 	-	test .travis.yml file \n \
		encrypt-file 	-	encrypt-files for travis-ci \n \
		build 		-	build sphinx html files \n \
		push 		-	push files to github branch \n \
		start 		-	start docker python container to test and look sphinx documentation \n \
		"

test-travis:
	docker run -ti -v $(CURDIR)/../:/project --rm skandyla/travis-cli lint

encrypt-file:
	docker run -ti -v $(CURDIR)/../:/project --rm skandyla/travis-cli encrypt-file $(CURDIR)/../publish.key -r DCSO/MISP-dockerized-docs

report:
	docker run -ti -v $(CURDIR)/../:/project --rm skandyla/travis-cli report --org

update-travis-check:
	docker pull skandyla/travis-cli

build-html:
	make -C ../ html

build-docker:
	./build.sh

push:
	./push.sh

start:
	docker run --rm -v $(CURDIR)/../:/data dockerhub.dcso.de/sphinx make clean
	docker run --rm -v $(CURDIR)/../:/data dockerhub.dcso.de/sphinx
	