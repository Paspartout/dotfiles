local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

g.coq_settings = { auto_start = 'shut-up' }

-- Packages
require "paq" {
    "savq/paq-nvim";                  -- Let Paq manage itself

    {"nvim-treesitter/nvim-treesitter", run=":TSUpdate"};          -- Mind the semi-colons
    {'ms-jpq/coq_nvim', branch='coq'};
    {'ms-jpq/coq.artifacts', branch='artifacts'};
    {'nvim-lua/plenary.nvim'};
    {'nvim-telescope/telescope.nvim'};
    {'neovim/nvim-lspconfig'};
    {'williamboman/nvim-lsp-installer'};
    {'alaviss/nim.nvim'}
}

-- paq {'savq/paq-nvim', opt = true}    -- paq-nvim manages itself
-- paq {'nvim-treesitter/nvim-treesitter'}
-- paq {'neovim/nvim-lspconfig'}
-- paq {'kabouzeid/nvim-lspinstall'}
-- paq {'hrsh7th/nvim-compe'}
-- paq {'nvim-lua/popup.nvim'}
-- paq {'nvim-lua/plenary.nvim'}
-- paq {'nvim-telescope/telescope.nvim'} -- TODO: Emulate fzf by triggering on Ctrl-P
-- paq {'ziglang/zig.vim'}

-- Mappings

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

opt.number = true
opt.background="dark"

g.mapleader = " "
g.auto_save = 0
cmd "syntax on"

map('', '<c-p>', '<cmd>Telescope find_files<cr>')

-- TODO: Don't fold by default
-- opt.foldmethod="expr"
-- opt.foldexpr="nvim_treesitter#foldexpr()"

-- Enalbe treesitter on all maintained languages
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = "all",
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end


-- lspInstall + lspconfig stuff
-- local function setup_servers()
--     require "lspinstall".setup()
-- 
--     local lspconf = require("lspconfig")
--     local servers = require "lspinstall".installed_servers()
-- 
--     for _, lang in pairs(servers) do
--         if lang ~= "lua" then
--             lspconf[lang].setup {
--                 on_attach = on_attach,
--                 root_dir = vim.loop.cwd
--             }
-- 	    -- TODO: HUH, why?
--         elseif lang == "lua" then
--             lspconf[lang].setup {
--                 root_dir = function()
--                     return vim.loop.cwd()
--                 end,
--                 settings = {
--                     Lua = {
--                         diagnostics = {
--                             globals = {"vim"}
--                         },
--                         workspace = {
--                             library = {
--                                 [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--                                 [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
--                             }
--                         },
--                         telemetry = {
--                             enable = false
--                         }
--                     }
--                 }
--             }
--         end
--     end
-- end
-- 
-- setup_servers()
-- 
-- -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
-- require "lspinstall".post_install_hook = function()
--     setup_servers() -- reload installed servers
--     vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
-- end
-- 
-- -- replace the default lsp diagnostic letters with prettier symbols
-- vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
-- vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
-- vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
-- vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})
