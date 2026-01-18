" ========================================
" YOUR COMPLETE MODERN VIM CONFIG 2026
" ========================================

" ========================================
" 1. PLUGINS (vim-plug) 
" ========================================
call plug#begin('~/.vim/plugged')

" LSP + Completion (IDE features)
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'

" Fuzzy Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" UI + Git
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'

call plug#end()

" ========================================
" 2. GENERAL SETTINGS
" ========================================
let mapleader = " "              " Spacebar leader (NvChad style)
set number relativenumber        " Relative line numbers
set tabstop=4 shiftwidth=4 expandtab  " 4-space tabs

" ========================================
" 3. NETRW FILE BROWSING (Neovim-style)
" ========================================
let g:netrw_banner = 0           " Clean look
let g:netrw_liststyle = 3        " Tree view
let g:netrw_browse_split = 0     " Current window (no splits)
let g:netrw_altv = 1             " Right split if needed

" ========================================
" 4. SMART WHITESPACE (4+ spaces only)
" ========================================
set list
set listchars=tab:>-,trail:·,eol:
highlight Indent4Spaces ctermfg=239 guifg=#504945
match Indent4Spaces / \{4,\}\ze\S/

" ========================================
" 5. KEYBINDINGS (Space + key)
" ========================================
" File browsing
nnoremap - :Explore<CR>          " - = file browser
nnoremap + :Explore .<CR>       " + = current dir  
nnoremap = :edit .<CR>          " = = current dir
nnoremap <leader>d :Rexplore<CR> " Space+d = close netrw

" Fuzzy finding
nnoremap <leader>ff :Files<CR>   " Space+ff = files
nnoremap <leader>fg :Rg<CR>      " Space+fg = grep

" LSP (when servers configured)
nnoremap <leader>gd :LspDefinition<CR>
nnoremap <leader>gh :LspHover<CR>
" Whitespace toggle (FIXED)
nnoremap <leader>l :call <SID>ToggleWhitespace()<CR>

function! s:ToggleWhitespace() abort
  if &list
    match none
    set nolist
  else
    set list
    match Indent4Spaces / \{4,\}\ze\S/
  endif
  syntax sync fromstart
endfunction
