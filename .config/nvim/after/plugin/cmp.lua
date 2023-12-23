local cmp = require "cmp"
local luasnip = require "luasnip"
local lspkind = require "lspkind"

require("luasnip.loaders.from_vscode").lazy_load()

local CMP_DEFAULT_CONFIG = {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<c-y>"] = cmp.mapping.confirm { select = true },
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm { select = true },
    },

    -- sources for autocompletion
    sources = cmp.config.sources {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },

    -- configure lspkind for vs-code like icons
    formatting = {
        format = lspkind.cmp_format {
            maxwidth = 50,
            ellipsis_char = "...",
        },
    },
}

cmp.setup(CMP_DEFAULT_CONFIG)
