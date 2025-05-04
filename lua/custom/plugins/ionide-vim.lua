return {
  {
    'ionide/Ionide-vim',
    init = function()
      vim.g['fsharp#lsp_auto_setup'] = 0
      vim.g['fsharp#exclude_project_directories'] = { 'paket_files' }
    end,
  },
}
