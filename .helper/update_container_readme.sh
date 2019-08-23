#!/bin/bash
set -eu
set -xv

# Global Variables
DOCKERFILES=""
ENV=""
ARG=""
VERSION=""
REPO_FOLDER=""
VAR_FILE="./bash-template-engine/vars.sh"

# Functions
func_env2markdown(){
    MD="
    |Name|Default Value|
    |--- | ---         |
    "

    for k in $@
    do
        # k: ENV
        [ "$k" = "ENV" ] && continue
        [ "$k" = "/" ] && continue
        # k: NGNX_VERSION=1.14.0
        name="$(echo "$k"|cut -d = -f 1)"
        default_value="$(echo "$k"|cut -d = -f 2)"
        MD="
        $MD
        |$name |$default_value|"
    done
    echo "ENV='$MD'"
}

func_arg2markdown(){
    MD="
    |Name|Default Value|
    |--- | ---         |
    "

    for k in "$@"
    do
        # k: ARG
        [ "$k" = "ARG" ] && continue
        [ "$k" = "/" ] && continue
        # k: NGNX_VERSION=1.14.0
        name=$(echo "$k"|cut -d = -f 1)
        default_value=$(echo "$k"|cut -d = -f 2)
        MD="
        $MD
        |$name |$default_value|"
    done
    echo "ARG='$MD'"
}

func_writeReadme() {
    # Initialize variables.sh
    echo "#/bin/bash" > "$VAR_FILE"
    func_arg2markdown "$ARG" >> "$VAR_FILE"
    func_env2markdown "$ENV" >> "$VAR_FILE"
    echo "EXPOSE=$EXPOSE" >> "$VAR_FILE"
    bash-template-engine/render.sh "$VAR_FILE"
}

func_download_repo_to_tmp() {
    local REPOURL="$1"
    if [ -n "${REPOURL-}" ]
    then
        git clone "$REPOURL" "/tmp/tmp_$1"
        REPO_FOLDER="/tmp/tmp_$1"
    fi
}

func_check_dependency() {
     [ -z "$(which "$1")" ] && echo "Please Install $1 first. Exit now." && exit 1
     return 0
}

func_find_dockerfiles_in_repo() {
    local REPO_FOLDER="$1"
    DOCKERFILES="$(find "${REPO_FOLDER:-"."}" -name Dockerfile)"
}

#
#   MAIN
#



# https://jonalmeida.com/posts/2013/05/26/different-ways-to-implement-flags-in-bash/
while [ ! $# -eq 0 ]
do
	case "$1" in
		"--help" | -h)
			usage
			exit
			;;
        "--one-container")
                #ONE_CONTAINER="yes"
                ;;
        "--repo-folder")
                REPO="$2"
                shift
                ;;
        "--repo-url")
                REPOURL="$2"
                shift
                ;;
            *)
            echo "$STARTMSG False Parameter."
	esac
	shift
done

func_check_dependency "git"
func_download_repo_to_tmp "$REPOURL"
func_find_dockerfiles_in_repo "$REPO_FOLDER"

for i in $DOCKERFILES
do
    # Write Build Arguments
    ARG="$(grep ARG "$i")"
    
    # Write Environments
    ENV="$(grep ENV "$i")"
    # Default Exposed Ports
    EXPOSE="$(grep EXPOSE "$i")"
    # Version
    VERSION="$i"

    func_writeReadme
done


# Delete temp files...
[ -d "$REPO_FOLDER" ] && rm -Rf "$REPO_FOLDER"