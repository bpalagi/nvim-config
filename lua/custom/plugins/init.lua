-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Markdown text styling
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {},
  },

  -- Inline image rendering (requires Kitty graphics protocol, works in Ghostty)
  {
    '3rd/image.nvim',
    ft = { 'markdown' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('image').setup {
        backend = 'kitty', -- Ghostty supports this
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = true,
          },
        },
        window_overlap_clear_enabled = true,
      }
    end,
  },
  -- Paste image from clipboard into Markdown
  {
    'HakonHarnes/img-clip.nvim',
    ft = { 'markdown' },
    opts = {
      default = {
        dir_path = 'images', -- where pasted images will be stored
        file_name = '%Y-%m-%d-%H-%M-%S', -- timestamp names
        relative_to_current_file = true, -- keep links relative
      },
    },
    keys = {
      { '<leader>pi', ':PasteImage<CR>', desc = 'Paste image into Markdown' },
    },
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- for file icons
    },
    config = function()
      require('nvim-tree').setup {
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = true,
        update_cwd = true,
        view = {
          width = 50,
        },
        filters = {
          dotfiles = false,
          git_ignored = false,
        },
      }
      -- Set keymap to toggle NvimTree with <leader>e
      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    end,
  },
}
