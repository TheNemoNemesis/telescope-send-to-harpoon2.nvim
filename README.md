# telescope-send-to-harpoon2.nvim

Custom [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) action for sending selections to [harpoon](https://github.com/ThePrimeagen/harpoon/tree/harpoon2).  
(fork of [telescope-send-to-harpoon](https://github.com/asbjornhaland/telescope-send-to-harpoon.nvim) updated to harpoon2)

## Requirements

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) (required)
- [harpoon](https://github.com/ThePrimeagen/harpoon/tree/harpoon2) (required)

## Setup

```viml
Plug 'TheNemoNemesis/telescope-send-to-harpoon2.nvim'
```

Load the extension by doing:

```lua
require('telescope').load_extension('send_to_harpoon')
```

somewhere after your require('telescope').setup() call.

Add a keyboard shortcut to execute the action call.

```lua
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = require'telescope'.extensions.send_to_harpoon.actions.send_selected_to_harpoon
      },
    }
  },
}
```
