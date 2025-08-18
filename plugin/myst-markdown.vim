" myst-markdown.nvim - MyST Markdown syntax highlighting for Neovim
" Author: myst-markdown.nvim contributors
" License: MIT

if exists('g:loaded_myst_markdown')
  finish
endif
let g:loaded_myst_markdown = 1

" Always provide commands for manual MyST activation
command! MystMarkdown setfiletype myst
command! SetMyst setfiletype myst