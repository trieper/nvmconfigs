vim.filetype.add {
  -- extension = {
  -- paketdep = "dependencies", -- Files with `.foo` extension will use `myfiletype`
  -- },
  -- pattern = {
  -- ["*.bar"] = "myfiletype", -- Files matching this pattern will use `myfiletype`
  -- },
  filename = {
    ['paket.dependencies'] = 'paketdep', -- Specific filenames will use `myfiletype`
  },
}

vim.filetype.add {
  -- extension = {
  -- paketdep = "dependencies", -- Files with `.foo` extension will use `myfiletype`
  -- },
  -- pattern = {
  -- ["*.bar"] = "myfiletype", -- Files matching this pattern will use `myfiletype`
  -- },
  filename = {
    ['paket.references'] = 'paketref', -- Specific filenames will use `myfiletype`
  },
}

vim.filetype.add {
  extension = {
    dotnetproj = 'csproj',
  },
  -- pattern = {
  -- ["*.bar"] = "myfiletype", -- Files matching this pattern will use `myfiletype`
  -- },
  filename = {
    ['Directory.Build.props'] = 'paketref', -- Specific filenames will use `myfiletype`
  },
}

vim.filetype.add {
  extension = {
    dotnetproj = 'fsproj',
  },
}

vim.filetype.add {
  extension = {
    dotnetproj = 'targets',
  },
}
