local status, nvim_tree = pcall(require, "nvim-tree")

if (not status) then
  return
end

nvim_tree.setup({
  view = {
    width = 50
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    root_folder_modifier = ":t",
  }
})
