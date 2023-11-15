local status, nvim_tree = pcall(require, "nvim-tree")

if (not status) then
    return
end

nvim_tree.setup({
    hijack_unnamed_buffer_when_opening = true,
    hijack_cursor = true,
    prefer_startup_root = true,
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
    },
    modified = {
        enable = true,
    },
    view = {
        width = 30,
        adaptive_size = true,
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    renderer = {
        full_name = true,
        highlight_git = true,
        root_folder_modifier = ":t",
        indent_width = 3,
        indent_markers = {
            enable = true,
        },
        icons = {
            git_placement = "after",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            }
        }
    },
    actions = {
        open_file = {
            quit_on_open = true,
        }
    },
    tab = {
        sync = {
            open = true,
            close = true,
        }
    }
})
