#!/usr/bin/env bash

# Copy over the appropriate configuration files for emacs on a *NIX platform

#cd "$(dirname "${BASH_SOURCE}")"
git pull origin master

gitExitCode=$?
if [[ $gitExitCode != 0 ]]; then
    exit $gitExitCode
fi

# copy the main file over
cp .emacs $HOME

# copy the emacs dir over
cp -r .emacs.d $HOME
