#!/bin/sh

# before_install:
  ##
  ## Install ssh-agent if not already installed, it is required by Docker.
  ## (change apt-get to yum if you use an RPM-based image)
  ##
  #- 'which ssh-agent || ( apt-get update -y && apt-get install openssh-client -y )'
  which ssh-agent || ( apk add --no-cache openssh-client )
  which git || ( apk add --no-cache git )


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
  #git config --global user.name "CI"

echo "Host github.com" > ~/.ssh/config
echo "  StrictHostKeyChecking no" >> ~/.ssh/config
echo "  UserKnownHostsFile /dev/null" >> ~/.ssh/config

# if [ $CI == "true" ]
# then
#     echo "CI"
#     echo "  ForwardAgent yes" >> ~/.ssh/config
#     ##
#     ## Run ssh-agent (inside the build environment)
#     ##
#     eval $(ssh-agent -s)

#     ##
#     ## Add the SSH key stored in SSH_PRIVATE_KEY variable to the agent store
#     ## We're using tr to fix line endings which makes ed25519 keys work
#     ## without extra base64 encoding.
#     ## https://gitlab.com/gitlab-examples/ssh-private-key/issues/1#note_48526556
#     ##
#     echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add - > /dev/null
#     # add git user.name
#     git config --global user.name "CI"
# else
#     echo "non-CI"
#     echo "  IdentityFile ~/.ssh/publish-key" >> ~/.ssh/config
#     cp ../publish.key ~/.ssh/publish-key
# fi
# echo "#########################################################"  

# install: 

echo "Install dependencies..."
pip install -r ../requirements.txt
pip install -e git+https://github.com/bitprophet/releases/#egg=releases
export PATH="$PATH:/$(whoami)/.local/bin"

#script: 

echo "Build sphinx docs..."
make -C ../ html
