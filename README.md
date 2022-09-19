# Dotfiles Repository

My personal dotfiles repository.  
Listed commands work with debian based distros.  
Should maybe write an installation script so replicating my setup is less
annoying.

## nvim

### lspconfig requirements

works on npm 8.10.0 + nodejs 16.13.1 and later.

My lspconfig uses language servers for:

- Bash
- C
- css
- html
- JavaScript / TypeScript
- Lua
- Python
- Ruby

The following command block can be copy-pasted into a bash terminal.  
It will install all requirements needed for the lspconfig to work.  
May need super user privilege.

Requires npm, pip3, ruby and git.

```bash
npm i -g vscode-langservers-extracted
npm i -g typescript typescript-language-server
npm i -g bash-language-server
npm i -g emmet-ls
pip3 install jedi
pip3 install python-lsp-server[all]
gem install solargraph
sudo apt-get install clangd-12
git clone  --depth=1 https://github.com/sumneko/lua-language-server ~/.local/src/lua-language-server
cd ~/.local/src/lua-language-server
git submodule update --depth 1 --init --recursive
cd -
```

### Treesitter

Remember to TSInstall *

## Kitty

Using Hack Nerd Font.

Custom prompt is Starship.

## Window Manager

I am using dwm with my [personal config](https://github.com/yuzu-eva/my-personal-dwm).

## File Manager

Using nnn with preview-tui plugin.

Rarely use it, may uninstall.
