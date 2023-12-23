local telescope = require "telescope"
local builtin = require "telescope.builtin"
local actions = require "telescope.actions"

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>fg", function()
    builtin.grep_string { search = vim.fn.input "[_grep $] " }
end)

telescope.setup {
    defaults = {
        prompt_prefix = " $ ",
        mappings = {
            i = {
                ["<C-u>"] = false,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
            },
        },
        file_ignore_patterns = { "node%_modules/.*" },
    },
}

telescope.load_extension "fzf"
