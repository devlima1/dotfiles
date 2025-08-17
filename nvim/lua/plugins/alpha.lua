return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            "                                                     ",
            "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
            "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
            "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
            "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
            "                                                     ",
        }

        dashboard.section.buttons.val = {
            dashboard.button("f", " " .. " Find File", ":Telescope find_files<CR>"),
            dashboard.button("n", " " .. " New File", ":enew<CR>"),
            dashboard.button("g", " " .. " Find Text", ":Telescope live_grep<CR>"),
            dashboard.button("r", " " .. " Recent Files", ":Telescope oldfiles<CR>"),
            dashboard.button("c", " " .. " Config", ":e ~/.config/nvim<CR>"),
            dashboard.button("L", "󰒲 " .. " Lazy", ":Lazy<CR>"),
            dashboard.button("q", " " .. " Quit", ":qa<CR>"),
        }

        local lazy_stats = require("lazy").stats()
        local version = vim.version()
        local nvim_version_stats = version.major .. "." .. version.minor .. "." .. version.patch
        dashboard.section.footer.val = {
            " " .. lazy_stats.count .. " plugins " .. "v" .. nvim_version_stats,
        }

        require("alpha").setup(dashboard.config)
    end,
}
