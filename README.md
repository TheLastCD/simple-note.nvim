# simple-note.nvim

## Introduction

Simple Note is a compact and small note taking popup window for neovim

## Features

- Quick Note taking
- Auto saving
- Unobtrussive 

## Install

### vim-plug

```
Plug 'TheLastCD/simple-note.nvim'
lua require('simple_note').setup()
```

### packer.nvim

```
use {
"TheLastCD/simple-note.nvim",
config = function()
require("simple_note").setup()
end,
}
```
### lazy.nvim

```
{
"TheLastCD/simple-note.nvim",
config = function()
require("simple_note").setup()
end,
}
```

## Customisation

- Currently Simple Note only supports Custom Keybinds
```
require("simple_note").setup(
{
  hotkey = "<leader>ns"
})
```
