#!/bin/bash
set -eu

# Functions
usage() {
    text="
        $0 <https github-repository url> <temp-dir>
        Example:
            $0 https://github.com/DCSO/MISP-dockerized.git /tmp
    "

    echo "$text"
}

check_requirements() {
    [ -z "$(which "$1")" ] && echo "Did not found '$1'. Please install it first." && exit 1
    echo
}

# Parameter
[ -z "${1-}" ] && echo "No Github repository via first parameter" && usage && echo " Exit now." && exit 1
[ -z "${2-}" ] && echo "No temporary directory via second parameter" && usage && echo " Exit now." && exit 1

REPOSITORY=${1}
TMP_DIR=${2}
FOLDER="$(</dev/urandom tr -dc A-Za-z0-9 | head -c 6)"




#
#   MAIN
#

# Check Requirements
check_requirements git


# Clone Repository in /tmp
cd "$TMP_DIR" || ( mkdir -p "$TMP_DIR" && cd "$TMP_DIR") || (echo "Temporary directory '$TMP_DIR' is not available and can not be created. Exit now" && exit 1 )
git clone "$REPOSITORY" "$TMP_DIR/$FOLDER"
FULL_GIT_LOG="$(cd "$TMP_DIR/$FOLDER" && git log --decorate=short  --pretty=fuller --simplify-by-decoration)"


IFS="\n"
CommitDate=""
tag=""
message=""
for i in $FULL_GIT_LOG
do
   set -xv
    if grep -q "tag" "$i"
    then
        if [ ! -z "$message" ]
        then
            # Save complete Commit
            tmp_var="
            ---
            $message
            "
            echo "$tmp_var"

            # Delete Message
            message=""
        fi
        # Start a new Commit message
        tag="$(echo "$i|cut -d : -f 2")" && continue
    fi
    # Copy Date
    grep -q "CommitDate" "$i" && CommitDate="$(echo "$i|cut -d : -f 2")" && continue
    # Copy Message
    message="
        $message $i
        "


done



# Remove all after work
rm -Rf "$TMP_DIR/$FOLDER"