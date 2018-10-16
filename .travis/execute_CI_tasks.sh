#!/bin/bash

# before_install:
mkdir -p ~/.ssh

if [ $CI == "true" ]
then
    echo "CI"
    #openssl aes-256-cbc -K $encrypted_eff88d0bace2_key -iv $encrypted_eff88d0bace2_iv -in publish-key.enc -out ~/.ssh/publish-key -d
    #chmod u=rw,og= ~/.ssh/publish-key
else
    echo "non-CI"
    cp ../publish.key ~/.ssh/publish-key
fi
echo "#########################################################"  

echo "Host github.com" >> ~/.ssh/config
echo "  IdentityFile ~/.ssh/publish-key" >> ~/.ssh/config
git --version
git remote add -t gh-pages origin_MAIN git@github.com:DCSO/MISP-dockerized.git

# install: 
export PATH="$PATH:/$(whoami)/.local/bin"
pip install -r ../requirements.txt
pip install -e git+https://github.com/bitprophet/releases/#egg=releases
echo "#########################################################"  
echo "#########################################################"  
echo "#########################################################"  
echo

#script: 
make -C ../ html
echo "#########################################################"
echo "#########################################################"  
echo "#########################################################"  
echo


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
ghp-import -n -m "Update MISP-dockerized-docs" -p ../_build/html
echo "finished."
#ghp-import -n -m "Update MISP-dockerized-docs" -p -s -r origin_MAIN ../_build/html
echo "#########################################################"
echo "#########################################################"  
echo