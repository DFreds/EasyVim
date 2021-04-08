# EasyVim

This is my personal configuration for Vim utilizing Neovim.

## Installation

1. First, install [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim).

1. Clone this repo into ~/.vim_runtime like so:

    ```bash
    git clone --depth=1 https://github.com/DFreds/EasyVim.git ~/.vim_runtime
    sh ~/.vim_runtime/install.sh
    ```

1. Open up Neovim anywhere and install the plugins like so:

   ```bash
   nvim .
   :PlugInstall
   ```

1. Close and reopen Neovim and run:

   ```vim
   :CocInstall
   ```

That's it! The install script has successfully sourced all the files and included them in your ~/.vimrc, which Neovim will read on startup. [Vim Plug](https://github.com/junegunn/vim-plug) will install and manage all of the plugins that are included.

## Included Plugins

* ack
* ALE
* auto-pairs
* coc.nvim
* dart-vim-plugin
* fugitive-gitlab.vim
* fzf and fzf.vim
* goyo.vim
* indentline
* lightline-ale
* lightline.vim
* tabular
* tlib_vim
* ultisnips
* undotree
* vim-addon-mw-utils
* vim-better-whitespace
* vim-bundler
* vim-commentary
* vim-dispatch
* vim-easymotion
* vim-floaterm
* vim-fugitive
* vim-gitgutter
* vim-javascript
* vim-jsdoc
* vim-lastplace
* vim-less
* vim-lsc
* vim-lsc-dart
* vim-markdown
* vim-matchup
* vim-projectionist
* vim-rails
* vim-repeat
* vim-ruby
* vim-snippets
* vim-test
* vim-vinegar
* vim-yankstack

## Included Colorschemes

* [vim-monokai](https://github.com/crusoexia/vim-monokai): The default
* [PaperColor](https://github.com/NLKNguyen/papercolor-theme)

## Keybindings

The [leader](http://learnvimscriptthehardway.stevelosh.com/chapters/06.html#leader) is `,`, so whenever you see `<leader>` it means `,`.

### Any Mode Mappings

| Mapping | Description                        |
| ---     | ---                                |
| M

### Normal Mappings

| Mapping    | Description                        |
| ---        | ---                                |
| F6         | Toggle between light and dark mode |
| <leader>ft | Toggle floaterm                    |

## Custom Configuration

This setup automatically supports adding your own configuration. To do so, create a file under the vimrcs folder like so:

* ~/.vim_runtime/vimrcs/my_config.vim

This is automatically sourced after following the installation steps above. From there, feel free to add any of your own configuration to the file, and it will be ignored by git.
