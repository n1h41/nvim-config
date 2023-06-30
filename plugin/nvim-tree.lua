local status, nvim_tree = pcall(require, "nvim-tree")

if (not status) then
  return
end

nvim_tree.setup({
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
    root_folder_modifier = ":t",
    indent_markers = {
      enable = true,
    },
    icons = {
      git_placement = "signcolumn",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      }
    }
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
})
