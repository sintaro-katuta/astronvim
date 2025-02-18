return {
  plugins = {
    better_escape = {
      mapping = { "jk", "jj", "kk" },
    },
  },
  -- 既存の設定...
  polish = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
      end,
    })
  end,
}
