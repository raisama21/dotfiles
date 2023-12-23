local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

local MASON_DEFAULT_CONFIG = {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
}

local MASON_LSPCONFIG_DEFAULT_CONFIG = {
    ensure_installed = {
        -- lua stuff
        "lua_ls",

        -- c stuff
        "clangd",

        -- web dev stuff
        "html",
        "cssls",
        "tailwindcss",
        "tsserver",
        "emmet_ls",

	-- golang
	"gopls",

        -- database stuff
        "sqlls"
    },

    automatic_installation = true,
};

mason.setup(MASON_DEFAULT_CONFIG);

mason_lspconfig.setup(MASON_LSPCONFIG_DEFAULT_CONFIG);
