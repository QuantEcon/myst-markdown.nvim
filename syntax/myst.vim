" Vim syntax file
" Language: MyST Markdown
" Maintainer: myst-markdown.nvim contributors  
" License: MIT
" Based on standard markdown syntax with MyST extensions

if exists("b:current_syntax")
  finish
endif

" Read the markdown syntax to start with
runtime! syntax/markdown.vim
unlet! b:current_syntax

" Ensure case sensitivity matches markdown behavior
syn case ignore

" MyST-specific syntax regions and matches

" MyST comments (% comment)
syntax match mystComment "^%.*$" contains=@Spell
syntax match mystComment "^\s\+%.*$" contains=@Spell

" MyST targets ((name)=)
syntax match mystTarget "^([^)]\+)=\s*$" 

" MyST block breaks (+++)
syntax match mystBlockBreak "^+\{3,}\s*$"
syntax match mystBlockBreak "^\s\++\{3,}\s*$"

" MyST colon fences - need to handle them before directives
syntax region mystColonFence start="^\s*:\{3,}\s*\w*\s*$" end="^\s*:\{3,}\s*$" contains=mystColonFenceStart,mystColonFenceEnd keepend fold
syntax match mystColonFenceStart "^\s*:\{3,}\s*\w*\s*$" contained
syntax match mystColonFenceEnd "^\s*:\{3,}\s*$" contained

" MyST directives (:::directive with content)
syntax region mystDirective start="^\s*:::\s*\w\+.*$" end="^\s*:::\s*$" contains=mystDirectiveStart,mystDirectiveEnd keepend fold
syntax match mystDirectiveStart "^\s*:::\s*\w\+.*$" contained contains=mystDirectiveName
syntax match mystDirectiveEnd "^\s*:::\s*$" contained
syntax match mystDirectiveName "\w\+" contained

" MyST code-cell directives with language-specific highlighting
" Define supported languages for code-cell directives
if !exists('g:myst_code_cell_languages')
  let g:myst_code_cell_languages = ['python', 'python3', 'py', 'julia', 'jl', 'javascript', 'js', 'r', 'bash', 'sh', 'sql', 'ruby', 'go', 'rust', 'cpp', 'c', 'java']
endif

" Include syntax files for supported languages
let s:done_include = {}
for s:lang in g:myst_code_cell_languages
  let s:lang_clean = substitute(s:lang, '[^a-zA-Z0-9_]', '_', 'g')
  if has_key(s:done_include, s:lang_clean)
    continue
  endif
  " Map some common aliases to their actual syntax files
  let s:syntax_file = s:lang
  if s:lang =~ '^\(python3\|py\)$'
    let s:syntax_file = 'python'
  elseif s:lang =~ '^\(jl\)$'
    let s:syntax_file = 'julia'
  elseif s:lang =~ '^\(js\)$'
    let s:syntax_file = 'javascript'
  elseif s:lang =~ '^\(sh\)$'
    let s:syntax_file = 'bash'
  endif
  
  try
    exe 'syn include @mystCodeCell_'.s:lang_clean.' syntax/'.s:syntax_file.'.vim'
    unlet! b:current_syntax
    let s:done_include[s:lang_clean] = 1
  catch
    " Skip if syntax file not found
  endtry
endfor

" Create regions for code-cell directives with language-specific highlighting
for s:lang in g:myst_code_cell_languages
  let s:lang_clean = substitute(s:lang, '[^a-zA-Z0-9_]', '_', 'g')
  if has_key(s:done_include, s:lang_clean)
    exe 'syn region mystCodeCell_'.s:lang_clean.' matchgroup=mystBacktickDirectiveStart start="^\s*\z(`\{3,\}\)\s*{code-cell}\s\+'.s:lang.'.*$" end="^\s*\z1\s*$" keepend contains=@mystCodeCell_'.s:lang_clean
  endif
endfor

unlet! s:lang s:lang_clean s:syntax_file s:done_include

" MyST backtick directives (```{directive} with content) - for non-code-cell directives
syntax region mystBacktickDirective start="^\s*\z(`\{3,\}\)\s*{\%(code-cell\)\@!\w\+[^}]*}.*$" end="^\s*\z1\s*$" contains=mystBacktickDirectiveStart,mystBacktickDirectiveEnd keepend fold
syntax match mystBacktickDirectiveStart "^\s*`\{3,\}\s*{\w\+[^}]*}.*$" contained contains=mystBacktickDirectiveName
syntax match mystBacktickDirectiveEnd "^\s*`\{3,\}\s*$" contained
syntax match mystBacktickDirectiveName "{\w\+[^}]*}" contained

" MyST inline roles (:role:`content`)
syntax region mystInlineRole start=":\w\+:`" end="`" oneline contains=mystRoleName,mystRoleContent
syntax match mystRoleName ":\w\+:" contained
syntax region mystRoleContent start="`" end="`" contained

" MyST cross-references ({ref}`label` or {directive}`target`)  
syntax match mystCrossRef "{\w\+}`[^`]*`" oneline

" Math expressions (commonly used in MyST)
syntax region mystMath start="\$" end="\$" oneline keepend
syntax region mystMathBlock start="\$\$" end="\$\$" keepend

" MyST math directives and roles with LaTeX highlighting
" Include LaTeX syntax for math content
try
  syn include @mystMathTeX syntax/tex.vim
  unlet! b:current_syntax
catch
  " Fallback if tex.vim not available - use plaintex
  try
    syn include @mystMathTeX syntax/plaintex.vim
    unlet! b:current_syntax
  catch
    " If no TeX syntax available, create empty cluster
    syn cluster mystMathTeX contains=NONE
  endtry
endtry

" Math directive block {math}...{/math}
syntax region mystMathDirective start="^{math}$" end="^{/math}$" keepend contains=@mystMathTeX,mystMathDirectiveStart,mystMathDirectiveEnd
syntax match mystMathDirectiveStart "^{math}$" contained
syntax match mystMathDirectiveEnd "^{/math}$" contained

" Math inline role {math}`content`
syntax region mystMathRole start="{math}`" end="`" oneline contains=@mystMathTeX,mystMathRoleDelim
syntax match mystMathRoleDelim "{math}`\|`" contained

" Define highlighting colors
highlight def link mystComment Comment
highlight def link mystTarget PreProc
highlight def link mystBlockBreak Special
highlight def link mystColonFenceStart Delimiter
highlight def link mystColonFenceEnd Delimiter
highlight def link mystDirectiveStart Function
highlight def link mystDirectiveEnd Delimiter
highlight def link mystDirectiveName Type
highlight def link mystBacktickDirectiveStart Function
highlight def link mystBacktickDirectiveEnd Delimiter
highlight def link mystBacktickDirectiveName Type
highlight def link mystRoleName Type
highlight def link mystRoleContent String
highlight def link mystInlineRole String
highlight def link mystCrossRef String
highlight def link mystMath Special
highlight def link mystMathBlock Special
highlight def link mystMathDirective Special
highlight def link mystMathDirectiveStart Delimiter
highlight def link mystMathDirectiveEnd Delimiter
highlight def link mystMathRole Special
highlight def link mystMathRoleDelim Delimiter

let b:current_syntax = "myst"