#!/bin/bash

# before_install:
  ##
  ## Install ssh-agent if not already installed, it is required by Docker.
  ## (change apt-get to yum if you use an RPM-based image)
  ##
  #- 'which ssh-agent || ( apt-get update -y && apt-get install openssh-client -y )'
  'which ssh-agent || ( apk add --no-cache openssh-client )'
  'which git || ( apk add --no-cache git )'

  ##
  ## Run ssh-agent (inside the build environment)
  ##
  eval $(ssh-agent -s)

  ##
  ## Add the SSH key stored in SSH_PRIVATE_KEY variable to the agent store
  ## We're using tr to fix line endings which makes ed25519 keys work
  ## without extra base64 encoding.
  ## https://gitlab.com/gitlab-examples/ssh-private-key/issues/1#note_48526556
  ##
  echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add - > /dev/null
  
  ##
  ## Create the SSH directory and give it the right permissions
  ##
  mkdir -p ~/.ssh
  chmod 700 ~/.ssh

  ##
  ## Optionally, if you will be using any Git commands, set the user name and
  ## and email.
  ##
  #git config --global user.email ""
  git config --global user.name "CI"


echo "Host github.com" >> ~/.ssh/config
echo "  StrictHostKeyChecking no" >> ~/.ssh/config
echo "  UserKnownHostsFile /dev/null" >> ~/.ssh/config

if [ $CI == "true" ]
then
    echo "CI"
    git config --global user.name "CI"
    

else
    echo "non-CI"
    echo "  IdentityFile ~/.ssh/publish-key" >> ~/.ssh/config
    cp ../publish.key ~/.ssh/publish-key
fi
echo "#########################################################"  



git --version
git remote add -t gh-pages origin_MAIN git@github.com:DCSO/MISP-dockerized.git

# install: 
export PATH="$PATH:/$(whoami)/.local/bin"
pip install -r ../requirements.txt
"pip install -e git+https://github.com/bitprophet/releases/#egg=releases"
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
ghp-import -n -m "Update MISP-dockerized-docs" -f -p ../_build/html
#ghp-import -n -m "Update MISP-dockerized-docs" -p -s -r origin_MAIN ../_build/html
echo "finished."


echo "#########################################################"
echo "#########################################################"  
echo