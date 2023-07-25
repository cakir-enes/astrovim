return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "tundra",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
        "ruff_lsp",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
      --
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  plugins = {
    {
      "nyngwang/NeoZoom.lua",
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
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}
