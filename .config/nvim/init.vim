call plug#begin("~/.vim/plugged")
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
"Plug 'kyazdani42/nvim-tree.lua'
"Plug 'kyazdani42/nvim-web-devicons'
Plug 'itchyny/lightline.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sainnhe/sonokai'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Basic 
set number
set cursorline
set history=1000
set clipboard=unnamed

set autoindent
set cindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set laststatus=2
set noshowmode
set autoread

filetype indent on

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2                                                   
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType c setlocal shiftwidth=4 tabstop=4

syntax sync minlines=200

autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None
" 

"///////////////////////////
" NERDTree plugin 
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" Close the tab if NERDTree is the only window remaining in it.
"autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endi

" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
"///////////////////////////



"/////////////////////////////
" Integrated Terminal 
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
    split term://zsh
    resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
" 


" treesitter 
" Highlight 
lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
    enable = true,
    custom_captures = {
        -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
        ["foo.bar"] = "Identifier",
        },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    },
}
EOF
" 
" 


" Sonokai theme 
if has('termguicolors')
    set termguicolors
endif
" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'andromeda' " 'default'`, `'atlantis'`, `'andromeda'`, `'shusia'`, `'maia'`, `'espresso'
let g:sonokai_enable_italic = 1
"let g:sonokai_disable_italic_comment = 1
colorscheme sonokai
" 


" lightline
let g:lightline = {
            \ 'colorscheme': 'sonokai',
            \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
            \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
            \ 'active' : {
                \   'left' : [ [ 'mode', 'paste' ],
                \              [ 'gitbranch', 'readonly', 'absolutepath', 'modified' ] ],
                \   'right': [ [ 'virtualenv', 'lineinfo' ],
                \              [ 'percent' ],
                \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
                \ },
                \ 'component_function' : {
                    \   'gitbranch' : 'gitbranch#name',
                    \   'filetype': 'MyFiletype',
                    \   'fileformat': 'MyFileformat',
                    \ },
                    \ }
"


" Colorizer
lua require'colorizer'.setup()
"

" COC
let g:coc_global_extensions = ['coc-json',
      \ 'coc-git',
      \ 'coc-cssmodules',
      \ 'coc-css',
      \ 'coc-eslint',
      \ 'coc-html',
      \ 'coc-tsserver',
      \ 'coc-tslint',
      \ 'coc-pyright',
      \ 'coc-stylelint',
      \ 'coc-yaml',
      \ 'coc-svg',
      \ 'coc-prettier',
      \ 'coc-swagger']
" \ 'coc-clangd',
" \ 'coc-python',


"/////////////////////
" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
"////////////////////
