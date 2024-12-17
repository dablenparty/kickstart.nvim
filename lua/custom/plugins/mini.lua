return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- Floating window file manager. Use hyphen to open it at any time
    local mini_files = require 'mini.files'
    local width_preview_max = 80
    local width_preview_min = 40
    local width_preview_want = math.floor(vim.api.nvim_win_get_width(0) / 3)
    local preview_config = {}
    if width_preview_want >= width_preview_min then
      preview_config = { preview = true, width_preview = math.max(width_preview_want, width_preview_max) }
    end
    mini_files.setup { windows = preview_config }
    vim.keymap.set('n', '-', mini_files.open, { desc = 'Open parent directory' })

    -- FIXME: doesn't work on macOS
    -- Allows for moving selections with Alt (Meta) + hjkl
    require('mini.move').setup()

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
