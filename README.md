# simple-note.nvim

## Introduction

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/e6f00018-e4a3-4ab0-bd13-dd802b9b93eb" />

Simple Note is a compact and small note taking popup window for neovim.

Note for the markdown to be rendered as shown in screenshot use plugin like: [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)

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

