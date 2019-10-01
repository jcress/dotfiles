#!/bin/bash

mv ~/.bashrc ~/.bashrc.old
ln -s ~/dotfiles/bashrc ~/.bashrc

mv ~/.bash_aliases ~/.bash_aliases.old
ln -s ~/dotfiles/bash_aliases ~/.bash_aliases
