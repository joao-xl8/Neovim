local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
vim.keymap.set('n', '<leader>pc', builtin.commands, {})
vim.keymap.set('n', '<leader>po', builtin.oldfiles, {})
vim.keymap.set("n", "<leader>pg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set("n", "<leader>pm", ":lua require('telescope').extensions.media_files.media_files()<CR>")
vim.keymap.set(
  "n",
  "<leader>pk",
  '<cmd>lua require("telescope.builtin").live_grep({ glob_pattern = "!{spec,test}"})<CR>',
  { desc = "Live Grep Code" }
)
require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "Pods",
      "ios",
      "android"
    }
  }
}

require('telescope').load_extension('live_grep_args')
require('telescope').load_extension('media_files')

