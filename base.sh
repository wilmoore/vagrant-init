#!/bin/bash

# better editor settings
cat > /home/vagrant/.bash_profile <<EOF
. ~/.bashrc

EDITOR=vim
set -o vi
EOF

# install vim
yes|apt-get install vim-nox
