#!/usr/bin/sh



git --version
git remote add -t gh-pages origin_MAIN git@github.com:DCSO/MISP-dockerized.git
git remote add -t gh-pages origin_GITHUB git@github.com:DCSO/MISP-dockerized-docs.git


# Push HTML files to gh-pages automatically.

echo -n "try to upload..."
# ghp-import Options:
#   -n, --no-jekyll       Include a .nojekyll file in the branch.
#   -c CNAME, --cname=CNAME
#                         Write a CNAME file with the given CNAME.
#   -m MESG, --message=MESG
#                         The commit message to use on the target branch.
#   -p, --push            Push the branch to origin/{branch} after committing.
#   -f, --force           Force the push to the repository
#   -r REMOTE, --remote=REMOTE
#                         The name of the remote to push to. [origin]
#   -b BRANCH, --branch=BRANCH
#                         Name of the branch to write to. [gh-pages]
#   -s, --shell           Use the shell when invoking Git. [False]
#   -l, --follow-links    Follow symlinks when adding files. [False]
#   -h, --help            show this help message and exit
ghp-import -n -m "Update MISP-dockerized-docs" -f -p -r origin_GITHUB ../_build/html
#ghp-import -n -m "Update MISP-dockerized-docs" -p -s -r origin_MAIN ../_build/html
echo "finished."


echo "#########################################################"
echo "#########################################################"  
echo