-- Normal mode mappings (non-recursive)
-- 
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
keymap('i', 'jj', '<Esc>', { noremap = true })

-- Visual mode mappings
keymap('v', '<Leader>c', ':Commentary<CR>', { noremap = true, silent = true })
keymap('v', 'H', '^', { noremap = true })
keymap('v', 'L', '$', { noremap = true })

local function current_time()
  return os.date("%H:%M")  -- 時:分:秒の形式で現在時刻を取得
end

local function total_lines()
  return vim.fn.line('$')
end

local function encouragement()
  return [[頑張れ]]
end

local function lsp_clients()
  local clients = vim.lsp.get_active_clients({ bufnr = 0 })
  if next(clients) == nil then return "LSPなし" end
  local client_names = {}
  for _, client in pairs(clients) do
    table.insert(client_names, client.name)
  end
  return table.concat(client_names, ", ")
end

local function indent_style()
  if vim.bo.expandtab then
    return vim.bo.shiftwidth .. "スペース"
  else
    return vim.bo.tabstop .. "タブ"
  end
end

-- カスタムコンポーネントを作成
local function yank_register()
  -- ヤンクレジスタの内容を取得
  local yank_content = vim.fn.getreg('"')

  -- 改行をスペースに置き換え
  yank_content = yank_content:gsub("\n", " ")

  -- 内容を10文字に短縮し、長ければ"..."を追加
  if #yank_content > 10 then
    yank_content = string.sub(yank_content, 1, 7) .. "..."
  end

  -- 表示する内容を返す
  return yank_content ~= "" and yank_content or "EMPTY"
end

require("lualine").setup{
    options = {
      icons_enabled = true,
      theme = 'material',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {{encouragement, color={fg="#FF9999"}},'branch'},
      lualine_c = {
        {
          'diff',
          symbols = {added = ' ', modified = ' ', removed = ' '},
        },
        {
          'diagnostics',
          symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '}
        },
        {
          indent_style
        },
      },
      lualine_x = {
        'encoding', 'filetype', {'filename', path=1}},
      lualine_y = {
        {total_lines, color={fg="#FF99FF"}},
        {yank_register, icon = '📋'},
      },
      lualine_z = {
        {lsp_clients, color={fg="#99FF99", bg="#3c3c6c"}},
        {current_time, color={fg="#99FFFF", bg="#3c3c6c"}},
      }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
