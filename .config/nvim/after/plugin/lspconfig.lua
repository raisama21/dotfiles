local lspconfig = require "lspconfig"
local cmp_nvim_lsp = require "cmp_nvim_lsp"

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<space>f", vim.diagnostic.open_float)
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

lspconfig["html"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "html" },
}

lspconfig["cssls"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "css", "scss", "less" },
    settings = {
        css = {
            lint = {
                unknownAtRules = "ignore",
            },
        },
    },
}

lspconfig["tsserver"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx"
    },
}

lspconfig["tailwindcss"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = {
        "astro",
        "astro-markdown",
        "gohtml",
        "html",
        "css",
        "less",
        "postcss",
        "sass",
        "scss",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "svelte",
    },
}

lspconfig["emmet_ls"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = {
        "html",
        "typescriptreact",
        "javascriptreact",
        "css",
        "sass",
        "scss",
    },
}

lspconfig["lua_ls"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "lua" },
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "lua" },
            },
        },
    },
}

lspconfig["clangd"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
}

lspconfig["sqlls"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "sql", "mysql" }
}

lspconfig["gopls"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparams = true,
            },
        },
    },
}
