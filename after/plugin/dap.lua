---@diagnostic disable: missing-fields
local dap = require('dap')
local dapui = require('dapui')

--[[ dap.adapters.dart = {
  type = 'executable',
  command = "flutter",
  args = { '-v', 'debug_adapter' },
  options = {
    detached = false,
  },
} ]]

dap.adapters.dart = {
  type = 'executable',
  command = vim.fn.stdpath('data') .. '/mason/bin/dart-debug-adapter.cmd',
  args = { 'flutter' },
  options = {
    detached = false,
  },
}

--[[ dap.adapters.dart = {
  type = "executable",
  command = "node",
  args = { "C:/Users/nihal/Dart-Code/out/dist/debug.js", "flutter" },
  options = {
    detached = false
  }
} ]]

dap.configurations.dart = {
  {
    type = "flutter",
    request = "launch",
    name = "Launch flutter",
    dartSdkPath = "C:/src/flutter/bin/cache/dart-sdk/",
    flutterSdkPath = "C:/src/flutter/",
    program = "${workspaceFolder}/lib/main.dart",
    cwd = "${workspaceFolder}",
    console = 'externalTerminal',
    sourceMaps = true,
  },
  {
    type = 'flutter',
    request = 'attach',
    name = 'Attach Program',
    dartSdkPath = "C:/src/flutter/bin/cache/dart-sdk/",
    flutterSdkPath = "C:/src/flutter/",
    program = "${workspaceFolder}/lib/main.dart",
    cwd = "${workspaceFolder}",
    console = 'externalTerminal',
    sourceMaps = true,
  }
}

--[[ dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = { '/home/n1h41/.local/share/nvim/lazy/vscode-node-debug2/out/src/nodeDebug.js' },
} ]]

-- dap.configurations.javascript = {
--   {
--     name = 'Launch',
--     type = 'node2',
--     request = 'launch',
--     program = '${file}',
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = 'inspector',
--     console = 'integratedTerminal',
--   },
--   {
--     -- For this to work you need to make sure the node process is started with the `--inspect` flag.
--     name = 'Attach to process',
--     type = 'node2',
--     request = 'attach',
--     processId = require 'dap.utils'.pick_process,
--   }
-- }
--
-- dap.configurations.typescript = {
--   {
--     name = "ts-node (Node2 with ts-node)",
--     type = "node2",
--     request = "launch",
--     cwd = vim.loop.cwd(),
--     runtimeArgs = { "-r", "ts-node/register/transpile-only" },
--     runtimeExecutable = "node",
--     args = { "--inspect", "${file}" },
--     sourceMaps = true,
--     skipFiles = { "<node_internals>/**", "node_modules/**" },
--     console = 'integratedTerminal',
--   },
--   {
--     name = "Jest (Node2 with ts-node)",
--     type = "node2",
--     request = "launch",
--     cwd = vim.loop.cwd(),
--     runtimeArgs = { "--inspect-brk", "${workspaceFolder}/node_modules/.bin/jest" },
--     runtimeExecutable = "node",
--     args = { "${file}", "--runInBand", "--coverage", "false" },
--     sourceMaps = true,
--     port = 9229,
--     skipFiles = {
--       "<node_internals>/**",
--       "node_modules/**",
--     },
--     console = 'integratedTerminal',
--   },
--   {
--     type = 'node2',
--     request = 'attach',
--     name = 'Attach Program (Node2 with ts-node)',
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     skipFiles = { '<node_internals>/**' },
--     port = 9229,
--   },
-- }



local dap_breakpoint = {
  error = {
    text = "🔴",
    texthl = "LspDiagnosticsSignError",
    linehl = "",
    numhl = "",
  },
  rejected = {
    text = "🔘",
    texthl = "LspDiagnosticsSignHint",
    linehl = "",
    numhl = "",
  },
  stopped = {
    text = "🟢",
    texthl = "LspDiagnosticsSignInformation",
    linehl = "DiagnosticUnderlineInfo",
    numhl = "LspDiagnosticsSignInformation",
  },
}

vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)

dapui.setup()

--[[ dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open({})
end ]]

require("telescope").load_extension("dap")
