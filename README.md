# EasyVim

This is my personal configuration for Vim utilizing Neovim.

## Installation

1. First, install [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim).

1. Clone this repo into ~/.vim_runtime like so:
  
   `git clone https://github.com/DFreds/EasyVim ~/.vim_runtime`

1. Next, run the install script:
  
   `cd ~/.vim_runtime && install.sh`
   
1. Open up Neovim anywhere and install the plugins like so:
   
   `nvim .`
   `:PlugInstall`

That's it! The install script has successfully sourced all the files and included them in your ~/.vimrc, which Neovim will read on startup. [Vim Plug](https://github.com/junegunn/vim-plug) will install and manage all of the plugins that are included.

## Custom Plugins and Configuration

This setup automatically supports adding your own plugins and configuration. To do so, create files under the vimrcs folder like so:

* ~/.vim_runtime/vimrcs/my_plugins.vim
* ~/.vim_runtime/vimrcs/my_config.vim

These are automatically sourced after following the installation steps above. From there, feel free to add any of your own configuration or plugins to the corresponding files, and they will be ignored by git.

## Keybindings

The leader key is `,`.

### Any Mode Mappings

### Normal Mappings

| Mapping | Description |
| F6      | Toggle between light and dark mode |

