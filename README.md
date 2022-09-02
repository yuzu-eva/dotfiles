# Dotfiles Repository

My personal dotfiles repository.

Should maybe write an installation script so replicating my setup is less
annoying.

## nvim

### lspconfig requirements

works on npm 8.10.0 + nodejs 16.13.1 and later.

```bash
npm i -g vscode-langservers-extracted
npm i -g typescript typescript-language-server
npm i -g bash-language-server
npm i -g emmet-ls
pip3 install jedi
pip3 install python-lsp-server[all]
gem install solargraph

```

### Treesitter

Remember to TSInstall the languages. Currently using:

+ bash
+ c
+ html
+ javascript
+ json
+ lua
+ python
+ ruby
+ tsx
+ typescript
+ vim
+ markdown

## Kitty

Using Hack Nerd Font.

Custom prompt is Starship.

## Window Manager

Using dwm with following patches:

+ swallow
+ fibonacci
+ focusonclick
+ statusallmons
+ vanitygaps

Config for dwm is in another repo.

## File Manager

Using nnn with preview-tui plugin.
