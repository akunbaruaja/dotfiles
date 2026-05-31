-- Neovim config with lazy.nvim

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- General settings
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Tab settings
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Keymaps
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>", { desc = "Clear search" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window right" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window up" })
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Plugins
require("lazy").setup({
  -- Colorscheme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000,
    config = function() vim.cmd.colorscheme "catppuccin-mocha" end },

  -- Fuzzy finder
  { "nvim-telescope/telescope.nvim", branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    },
  },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "python", "go", "typescript", "rust" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- LSP
  { "neovim/nvim-lspconfig",
    config = function()
      local lsp = require("lspconfig")
      lsp.lua_ls.setup({})
      lsp.pyright.setup({})
      lsp.gopls.setup({})
      lsp.ts_ls.setup({})
      lsp.rust_analyzer.setup({})
    end,
  },

  -- Statusline
  { "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require("lualine").setup() end,
  },

  -- Git signs
  { "lewis6991/gitsigns.nvim", config = function() require("gitsigns").setup() end,
  },

  -- Autopairs
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },
})
