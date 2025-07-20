return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#89b4fa" })       -- Blue
        vim.api.nvim_set_hl(0, "AlphaIcon", { fg = "#f5c2e7" })         -- Pink
        vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#fab387" })     -- Peach
        vim.api.nvim_set_hl(0, "AlphaLabel", { fg = "#89b4fa" })        -- Blue
        vim.api.nvim_set_hl(0, "AlphaValue", { fg = "#f5c2e7" })        -- Pink

        dashboard.section.header.val = {
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                     ]],
            [[       ████ ██████           █████      ██                     ]],
            [[      ███████████             █████                             ]],
            [[      █████████ ███████████████████ ███   ███████████   ]],
            [[     █████████  ███    █████████████ █████ ██████████████   ]],
            [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
            [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
            [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
        }

        dashboard.section.header.opts.hl = "AlphaHeader"

        dashboard.section.buttons.val = {
            dashboard.button("f", " " .. " Find file",       "<cmd> Telescope find_files <cr>"),
            dashboard.button("n", " " .. " New file",        "<cmd> ene <BAR> startinsert <cr>"),
            dashboard.button("g", " " .. " Find text",       "<cmd> Telescope live_grep <cr>"),
            dashboard.button("r", " " .. " Recent files",    "<cmd> Telescope oldfiles <cr>"),
            dashboard.button("c", " " .. " Config",          "<cmd> Telescope find_files cwd=~/.config/nvim <cr>"),
            dashboard.button("l", "󰒲 " .. " Lazy",            "<cmd> Lazy <cr>"),
            dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
        }

        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = "AlphaIcon"
            button.opts.hl_shortcut = "AlphaShortcut"
        end

        dashboard.section.footer = {
            type = "group",
            val = {},
            opts = { position = "center" },
        }

        vim.api.nvim_create_autocmd("User", {
            once = true,
            pattern = "LazyVimStarted",
            callback = function()
                local stats = require("lazy").stats()
                local startup_time = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                local plugins_text = stats.loaded .. "/" .. stats.count
                local time_text = startup_time .. "ms"

                local segments = {
                    { text = " Neovim loaded ", hl = "AlphaLabel" },
                    { text = plugins_text, hl = "AlphaValue" },
                    { text = " plugins in ", hl = "AlphaLabel" },
                    { text = time_text, hl = "AlphaValue" },
                }

                local full_text = table.concat(vim.tbl_map(function(seg) return seg.text end, segments))
                local hl_ranges = {}
                local current_pos = 0

                for _, segment in ipairs(segments) do
                    local text_len = #segment.text
                    if segment.hl then
                        table.insert(hl_ranges, {
                            segment.hl,
                            current_pos,
                            current_pos + text_len,
                        })
                    end
                    current_pos = current_pos + text_len
                end

                dashboard.section.footer.val = {
                    {
                        type = "text",
                        val = full_text,
                        opts = {
                            hl = hl_ranges,
                            position = "center",
                            shrink_margin = false,
                        },
                    },
                }

                pcall(vim.cmd.AlphaRedraw)
            end,
        })

        dashboard.config.layout = {
            { type = "padding", val = 1 },
            dashboard.section.header,
            { type = "padding", val = 2 },
            dashboard.section.buttons,
            { type = "padding", val = 3 },
            dashboard.section.footer,
        }

        alpha.setup(dashboard.opts)
    end,
}
