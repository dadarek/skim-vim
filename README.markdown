## Install

After cloning this project, run the following:

    cd vim/bundle/command-t/ruby/command-t
    rvm use system
    ruby extconf.rb
    make

    git submodule update --init
    ./activate.rb

Be warned, the last command will overwrite any existing .vimrc, .gvimrc or .vim/ files you
have in your home directory.

## Credit

This was originally a fork of Skim's [vim_dotfiles](https://github.com/sl4m/vim_dotfiles).
