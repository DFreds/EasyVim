#!/bin/sh
set -e

cd ~/.vim_runtime

echo 'set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/plugins.vim
source ~/.vim_runtime/vimrcs/config.vim
source ~/.vim_runtime/vimrcs/autocmds.vim
source ~/.vim_runtime/vimrcs/keymaps.vim

try
source ~/.vim_runtime/vimrcs/my_config.vim
catch
endtry' > ~/.vimrc

echo "Installed the configuration successfully"
