---@diagnostic disable: missing-fields
require("neotest").setup({
  adapters = {
    require("neotest-dart")({
      command = "flutter",
      use_lsp = true,
    }),
    require("neotest-go"),
  }
})
