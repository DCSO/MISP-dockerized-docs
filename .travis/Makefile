#
#	Makefile
#
.PHONY: help test-travis build push start

help:
	echo "Please use a command"

test-travis:
	.travis/travis-cli.sh check

encrypt-file:
	.travis/travis-cli.sh encrypt-file $(key)

build:
	make -C ../ html

push:
	.travis/push.sh

start:
	docker run -ti --rm -v $(CURDIR)/../:/data python bash