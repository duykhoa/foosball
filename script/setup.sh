#!/bin/bash

pwd=`pwd`

# reload gemset
cd ..
cd $pwd

# install tmuxinator gem
# gem install tmuxinator

# soft link foosball to ~/.tmuxinator
foosball_des="~/.tmuxinator/foosball.yml"

if [ ! -e $foosball_des ]
then
  ln -s $pwd/foosball ~/.tmuxinator/foosball.yml
fi

# more stuffs go there later
# bundle install, rake db:bootstrap...
#

# open chrome tab, only work on Chrome, use port 9090, may need to reload
open http://localhost:9090

# start development environment
# later on, just use this command to start tmux session for foosball
mux foosball
