return {
  "telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-file-browser.nvim",
  },
  keys = {
    {
      "<leader>fP",
      function()
        require("telescope.builtin").find_files {
          cwd = require("lazy.core.config").options.root,
        }
      end,
      desc = "Telescope Find Plugin Folder",
    },
    {
      ";;",
      function()
        local builtin = require "telescope.builtin"
        builtin.resume()
      end,
      desc="Telescope Resume last picker",
    },
    {
      "\\\\",
      function()
        local builtin = require "telescope.builtin"
        builtin.diagnostics()
      end,
      desc="Telescope Show Diagnostics",
    },
    {
      ";s",
      function()
        local builtin = require "telescope.builtin"
        builtin.treesitter({
          initial_mode = "normal"
        })
      end,
      desc="Telescope Treesitter Window",
    },
    {
      "sf",
      function()
        local telescope = require "telescope"
        local function telescope_buffer_dir()
          return vim.fn.expand("%:p:h")
        end

        telescope.extensions.file_browser.file_browser({
          path = "%:p:h",
          cwd = telescope_buffer_dir(),
          respect_gitignore = false,
          hidden = true,
          grouped = true,
          previewer = false,
          initial_mode = "normal",
          layout_config = {height = 40},
        })
      end,
      desc= "Telescope File Browser",
    }
  },

  -- opts = function(_, opts)
  --   local opts = require('nvchad.configs.telescope')
  --
    -- local actions = require('telescope.actions')
    -- local fb_actions = require('telescope').extensions.file_browser.actions

  --   opts.defaults = vim.tbl_deep_extend('force', opts.defaults, {
  --     wrap_results = true,
  --     layout_strategy = 'horizontal',
  --     layout_config = {prompt_position = "top"},
  --     sorting_strategy = "ascending",
  --     windblend = 0,
  --     mappings = {
  --       n = {}
  --     }
  --   })
  --
  --   opts.pickers = {
  --     diagnostics = {
  --       -- theme = "ivy",
  --       initial_mode = "normal",
  --       layout_config = {
  --         preview_cutoff = 9999,
  --       },
  --     },
  --   }
  --
  --   print(opts.pickers.diagnostics.initial_mode)
    -- opts.extensions = {
    --   file_browser = {
    --     -- theme = "dropdown",
    --     hijack_netrw = true,
    --     mappings = {
    --       ["n"] = {
    --         ["N"] = fb_actions.create,
    --         ["h"] = fb_actions.goto_parent_dir,
    --         ["/"] = function ()
    --           vim.cmd("startinsert")
    --         end,
    --         ["<C-u>"] = function(prompt_bufnr)
    --           for _ = 1, 10 do
    --             actions.move_selection_previous(prompt_bufnr)
    --           end
    --         end,
    --         ["<C-d>"] = function(prompt_bufnr)
    --           for _ = 1, 10 do
    --             actions.move_selection_previous(prompt_bufnr)
    --           end
    --         end,
    --         ["<PageUp>"] = actions.preview_scrolling_up,
    --         ["<PageDown>"] = actions.preview_scrolling_down,
    --       },
    --     },
    --   },
    -- }
  --   return opts
  -- end,

}
