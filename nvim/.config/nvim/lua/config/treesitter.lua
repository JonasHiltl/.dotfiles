require 'nvim-treesitter.configs'.setup {
  ensure_installed = { 'go', 'gomod', 'lua', 'typescript', 'proto', 'dockerfile' },
  sync_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true, disable = { 'yaml' } },
}
