# simple-note.nvim

## Introduction

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/a3a99737-ace3-49ae-86bd-92100d3a179f" />


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

- Simple Note supports changes to:
  - Hotkey: default ```<leader> ns```
  - Window:
    - Border
    - Width
    - Height
    - Anchor

```
require("simple_note").setup(
{
  hotkey = "<leader>ns",
  window = {
    border = "rounded",
    width = 0.6,
    height = 0.4,
    anchor = "NW",
  },
})
```


