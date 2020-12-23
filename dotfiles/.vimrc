"Vim plugins
call plug#begin('~/.vim/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
call plug#end()

"Settings
set encoding=UTF-8
set whichwrap+=<,>,[,]
let g:ale_fixers = {
 \ 'javascript': ['eslint'],
 \ 'typescript': ['eslint'],
 \ 'css': ['prettier'],
 \ 'scss': ['prettier'],
 \ }

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

"coc config
let g:coc_global_extensions = [
    \ "coc-snippets",
    \ "coc-pairs",
    \ "coc-tsserver",
    \ "coc-eslint",
    \ "coc-prettier",
    \ "coc-json",
    \ ]
"Nerd tree
let g:NERDTreeIgnore = ['^node_modules$']

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"Nerd Commenter
vmap <C-_> \c<space><CR>gv
nmap <C-_> \c<space><CR>
imap <C-_> <esc>\c<space><CR>i

