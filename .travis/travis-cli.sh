#!/bin/bash
set -xe

#   travis cli
function check_via_travis_cli(){
    docker run -ti -v $(pwd):/project --rm skandyla/travis-cli "$1" "$2" $3
}

while (($#)); do
  case "${1}" in
    check)
        check_via_travis_cli lint .travis.yml
        exit 0
    ;;
    encrypt-file)
	    check_via_travis_cli encrypt-file $2
        exit 0
	    ;;
    *)
        exit 1
  esac
done
