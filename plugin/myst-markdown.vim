" myst-markdown.nvim - MyST Markdown syntax highlighting for Neovim
" Author: myst-markdown.nvim contributors
" License: MIT

if exists('g:loaded_myst_markdown')
  finish
endif
let g:loaded_myst_markdown = 1

" Filetype detection for MyST markdown files
augroup myst_markdown
  autocmd!
  " Detect .myst and .md files with MyST content
  autocmd BufRead,BufNewFile *.myst setfiletype myst
  autocmd BufRead,BufNewFile *.md call s:DetectMyST()
augroup END

function! s:DetectMyST()
  " Check if file contains MyST-specific syntax in first 20 lines
  let lines = getline(1, 20)
  for line in lines
    " Look for MyST-specific patterns
    if line =~ '^\s*:::' || line =~ '^\s*%' || line =~ '^\s*+++' || line =~ '^([^)]\+)='
      setfiletype myst
      break
    endif
  endfor
endfunction