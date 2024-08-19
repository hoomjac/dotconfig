if !exists('g:vscode')
  lua require('hoomjac.plugins-setup') 
  lua require('hoomjac.core.options') 
  lua require('hoomjac.core.keymaps') 
  lua require('hoomjac.core.colorscheme')
  lua require('hoomjac.plugins.comment')
  lua require('hoomjac.plugins.nvim-tree')
  lua require('hoomjac.plugins.lualine')
  lua require('hoomjac.plugins.telescope')
  lua require('hoomjac.plugins.nvim-cmp')
  lua require('hoomjac.plugins.lsp.mason')
  lua require('hoomjac.plugins.lsp.lspsaga')
  lua require('hoomjac.plugins.lsp.lspconfig')
  lua require('hoomjac.plugins.lsp.null-ls')
  lua require('hoomjac.plugins.autopairs')
  lua require('hoomjac.plugins.treesitter')
  lua require('hoomjac.plugins.refactoring')
  lua require('hoomjac.plugins.gitsigns')
  lua require('hoomjac.plugins.hop')
  lua require('hoomjac.plugins.smooth-cursor')
  lua require('hoomjac.plugins.rayso')
else
  runtime! vscode/general.vim  
  runtime! vscode/mappings.vim
  runtime! vscode/plugins.vim
endif
runtime! autocmd.vim
