# simple-note.nvim

## Introduction

Simple Note is a compact and small note taking popup window for neovim

## Features

- Quick Note taking
- Auto saving
- Unobtrussive 
- Supports Markdown 

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
## Navigation

- exit simple note with <esc>, q or Q when in Normal mode
- Launch Simple note using <leader>ns

## Customisation

- Currently Simple Note only supports Custom Keybinds
```
require("simple_note").setup(
{
  hotkey = "<leader>ns"
})
```
