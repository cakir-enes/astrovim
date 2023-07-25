return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "sam4llis/nvim-tundra",
    config = function()
      require("nvim-tundra").setup {
        plugins = {
          lsp = true,
          treesitter = true,
          telescope = true,
          nvimtree = true,
          cmp = true,
          context = true,
          dbui = true,
          gitsigns = true,
          neogit = true,
        },
      }
    end,
  },
  { "decaycs/decay.nvim", as = "decay", event = "UIEnter" },
  {
    "nyngwang/NeoZoom.lua",
    event = "UIEnter",
    config = function()
      require("neo-zoom").setup {
        popup = { enabled = true }, -- this is the default.
        -- NOTE: Add popup-effect (replace the window on-zoom with a `[No Name]`).
        -- EXPLAIN: This improves the performance, and you won't see two
        --          identical buffers got updated at the same time.
        -- popup = {
        --   enabled = true,
        --   exclude_filetypes = {},
        --   exclude_buftypes = {},
        -- },
        exclude_buftypes = { "terminal" },
        -- exclude_filetypes = { 'lspinfo', 'mason', 'lazy', 'fzf', 'qf' },
        winopts = {
          offset = {
            -- NOTE: omit `top`/`left` to center the floating window vertically/horizontally.
            -- top = 0,
            -- left = 0.17,
            width = 180,
            height = 0.95,
          },
          -- NOTE: check :help nvim_open_win() for possible border values.
          border = "thicc", -- this is a preset, try it :)
        },
        presets = {
          {
            -- NOTE: regex pattern can be used here!
            filetypes = { "dapui_.*", "dap-repl" },
            winopts = {
              offset = { top = 0.02, left = 0.26, width = 0.74, height = 0.25 },
            },
          },
          {
            filetypes = { "markdown" },
            callbacks = {
              function() vim.wo.wrap = true end,
            },
          },
        },
      }
      vim.keymap.set("n", "<CR>", function() vim.cmd "NeoZoomToggle" end, { silent = true, nowait = true })
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          -- default options: exact mode, multi window, all directions, with a backdrop
          require("flash").jump()
        end,
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function() require("flash").treesitter() end,
      },
    },
  },
  {
    "tzachar/highlight-undo.nvim",
    config = function()
      require("highlight-undo").setup {
        hlgroup = "HighlightUndo",
        duration = 300,
        keymaps = {
          { "n", "u",     "undo", {} },
          { "n", "<C-r>", "redo", {} },
        },
      }
    end,
  },
}
