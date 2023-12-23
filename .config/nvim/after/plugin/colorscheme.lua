local rose_pine = require "rose-pine"

rose_pine.setup({
    --- @usage "auto"|"main"|"moon"|"dawn"
    variant = "moon",
    --- @usage "main"|"moon"|"dawn"
    dark_variant = "moon",
    disable_float_background = true,
    disable_italics = true,

    --- @usage string hex value or named color from rosepinetheme.com/palette
    groups = {
        background = "moon",
        comment = "subtle",
    },
})

function Colorscheme(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

Colorscheme()
