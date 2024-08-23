# Praise.nvim

🙏 A simple NeoVim plugin that shows virtual inline Git blame information.

## Requirements
- Neovim >= 0.9
- awk
- sed
-  git

## Installation

### Plug
```lua
Plug 'theoboldalex/praise.nvim'
```

### Packer
```lua
use {'theoboldalex/praise.nvim'}
```

### Lazy
```lua
-- init.lua
{ 'theoboldalex/praise.nvim' }

-- plugins/praise.lua
return {
  'theoboldalex/praise.nvim'
}
```

## Customisation

### updatetime
You can change the point at which the blame information appears in the buffer by setting the updatetime option in your configuration.

```lua
vim.opt.updatetime = 1000 -- the default is 4000ms
```
> [!WARNING]
> 
> Setting very low `updatetime` values can have a negative effect on performance. make sure you have read and understood `h: updatetime` and `:h CursorMoved`.



