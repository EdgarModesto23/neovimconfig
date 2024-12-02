vim.opt.relativenumber = true

return {
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require "harpoon"
      harpoon:setup {}
      vim.keymap.set("n", "<D-a>", function()
        harpoon:list():add()
      end)
      vim.keymap.set("n", "å", function()
        harpoon:list():add()
      end)
      vim.keymap.set("n", "<D-l>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)
      vim.keymap.set("n", "¬", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)
      vim.keymap.set("n", "<D-Left>", function()
        harpoon:list():prev()
      end)
      vim.keymap.set("n", "œ", function()
        harpoon:list():prev()
      end)
      vim.keymap.set("n", "∑", function()
        harpoon:list():next()
      end)
      vim.keymap.set("n", "<D-Right>", function()
        harpoon:list():next()
      end)
      vim.keymap.set("n", "<D-1>", function()
        harpoon:list():select(1)
      end)
      vim.keymap.set("n", "<D-2>", function()
        harpoon:list():select(2)
      end)
      vim.keymap.set("n", "<D-3>", function()
        harpoon:list():select(3)
      end)
      vim.keymap.set("n", "<A-4>", function()
        harpoon:list():select(4)
      end)
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "html",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- {
  --   "github/copilot.vim",
  --   lazy = false,
  -- },

  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "plugins.configs.lint"
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "plugins.configs.null-ls"
    end,
  },

  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {

    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "tpope/vim-surround",
    lazy = false,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "html",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettierd",
        "typescript-language-server",
        "goimports-reviser",
        "eslint-lsp",
        "gofumpt",
        "black",
        "debugpy",
        "pyright",
        "mypy",
        "jdtls",
        "ruff",
        "gopls",
        "golines",
        "clangd",
        "elixir-ls",
        "intelephense",
        "bash-language-server",
        "tailwindcss-language-server",
        "clang-format",
        "dockerfile-language-server",
        "docker-compose-language-service"
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "go",
      },
    },
  },
}
