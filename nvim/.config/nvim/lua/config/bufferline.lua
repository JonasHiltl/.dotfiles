vim.opt.termguicolors = true

require 'bufferline'.setup {
  options = {
    icon_pinned = '車',
    diagnostics = 'nvim_lsp',
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "left",
        highlight = "Directory",
      }
    },
    color_icons = true,
    sort_by = 'insert_after_current',
  },
  highlights = {
    buffer_selected = {
      gui = "bold"
    },
    diagnostic_selected = {
      gui = "bold"
    },
    warning_selected = {
      gui = "bold"
    },
    warning_diagnostic_selected = {
      gui = "bold"
    },
    info_selected = {
      gui = "bold"
    },
    info_diagnostic_selected = {
      gui = "bold"
    },
    error_selected = {
      gui = "bold"
    },
    error_diagnostic_selected = {
      gui = "bold"
    }
  },
}
