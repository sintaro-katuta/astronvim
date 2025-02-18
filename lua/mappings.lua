local keymap = vim.api.nvim_set_keymap
keymap('n', 'x', '"_x', { noremap = true })
keymap('n', 's', '"_s', { noremap = true })
keymap('n', 'f', '<leader><leader><leader>bdw', { noremap = true })

-- Normal mode mappings
keymap('n', 'J', '10j', { noremap = true })
keymap('n', 'K', '10k', { noremap = true })
keymap('n', 'H', '^', { noremap = true })
keymap('n', 'L', '$', { noremap = true })

keymap('n', '<Leader>h', '<C-w>h', { noremap = true })
keymap('n', '<Leader>j', '<C-w>j', { noremap = true })
keymap('n', '<Leader>k', '<C-w>k', { noremap = true })
keymap('n', '<Leader>l', '<C-w>l', { noremap = true })

keymap('n', 'u', ':undo<CR>', { noremap = true, silent = true })
keymap('n', '<C-r>', ':redo<CR>', { noremap = true, silent = true })

-- 画面分割
keymap('n', 'ss', ':split<Return><C-w>w', { noremap = true })
keymap('n', 'sv', ':vsplit<Return><C-w>w', { noremap = true })

keymap('n', '<C-j>', '<Down>', { noremap = true })
keymap('n', '<C-k>', '<Up>', { noremap = true })

keymap('n', '<Leader>p', ':lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>c', ':Commentary<CR>', { noremap = true, silent = true })

keymap('n', '<Leader>e', ':Neotree filesystem reveal left<CR>', { noremap = true, silent = true}) 

keymap('n', '<C-k>', '<C-w>w', { noremap = true })
-- Insert mode mappings
keymap('i', 'jk', '<Esc>', { noremap = true })
keymap('i', 'ｊｋ', '<Esc>', { noremap = true })

-- Visual mode mappings
keymap('v', '<Leader>c', ':Commentary<CR>', { noremap = true, silent = true })
keymap('v', 'H', '^', { noremap = true })
keymap('v', 'L', '$', { noremap = true })

