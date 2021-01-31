call plug#begin()

"------
" compile and run rust projects
nnoremap <F6> :w <CR> :!clear <CR> :cargo run<CR>
" compile and run c++ projects
nnoremap <F5> :w <CR> :!clear <CR> :!g++ % -o %< && ./%< <CR>
" control-v opens .vimrc in a vertical split
nnoremap <C-v> :vsplit ~/.vimrc <cr>
" call path tree
nnoremap <C-o> :NERDTreeToggle <cr>

"auto format when save
let g:rustfmt_autosave = 1
" use cargo with syntastic for check rust codes
let g:syntastic_rust_checkers = ['cargo']

" syntax check
Plug 'vim-syntastic/syntastic'


" no swap

set noswapfile

"IndentLine
Plug 'Yggdroot/indentLine'

let g:indentLine_color_term = 239
let g:indentLine_char = '│'


" vim slime
Plug 'jpalardy/vim-slime'

let g:slime_target = "screen"
let g:slime_target = "vimterminal"
let g:slime_paste_file = tempname()
"





"----- CTRL P settings


set runtimepath^=~/.config/nvim/bundle/ctrlp.vim


let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


"--- auto sugestion


" --------------------------------------------------------
" SETTINGS START

set completeopt=longest,menuone

" SETTINGS END
" --------------------------------------------------------

" --------------------------------------------------------
" COC-VIM TAB SETTINGS START


function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" COC-VIM TAB SETTINGS END
" --------------------------------------------------------




"------- defx
if has('nvim')
	Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/defx.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif

"---- vim airline

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


"--- tema
"--- monokai

Plug 'ayu-theme/ayu-vim'


"---- colocando numero nas linhas

set number
set relativenumber


"------- defx enable Highlight
"let g:defx_icons_term_colors = {
"			\ 'red': 2
"			\ }


" dark theme
Plug 'kamykn/dark-theme.vim'



"======== nerdtree
Plug 'preservim/nerdtree'

"=== automatically init
"autocmd vimenter * NERDTree

"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


"======= dev-icons
Plug 'ryanoasis/vim-devicons'



"======= defxconf
let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 1
let g:defx_icons_directory_icon = ''
let g:defx_icons_mark_icon = '*'
let g:defx_icons_copy_icon = ''
let g:defx_icons_move_icon = ''
let g:defx_icons_parent_icon = ''
let g:defx_icons_default_icon = ''
let g:defx_icons_directory_symlink_icon = ''
" Options below are applicable only when using "tree" feature
let g:defx_icons_root_opened_tree_icon = ''
let g:defx_icons_nested_opened_tree_icon = ''
let g:defx_icons_nested_closed_tree_icon = ''

" ayu theme
Plug 'ayu-theme/ayu-vim' " or other package manager
"...
set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
"colorscheme ayu

Plug 'ervandew/supertab'
Plug 'Chiel92/vim-autoformat'

" Use release branch (recommend)
Plug 'neoclide/coc.nvim'

"night owl theme
Plug 'haishanh/night-owl.vim'

Plug 'ervandew/supertab'
Plug 'Chiel92/vim-autoformat'
Plug 'rust-lang/rust.vim'

" debuger
Plug 'dbgx/lldb.nvim'



call plug#end()


"---- airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'




"--- tecla de atalho pra compilar
nnoremap <F5> :w <CR> :terminal rs % && ./%< <CR>


"---- tema

""""" install
" or with NeoBundle
" NeoBundle 'haishanh/night-owl.vim'
" or with Vundle
" Plugin 'haishanh/night-owl.vim'

""""" enable 24bit true color

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
	set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

""""" enable the theme

" To enable the lightline theme
"let g:lightline = { 'colorscheme': 'nightowl' }
colorscheme ayu
syntax off

"---- status line

let g:airline_theme='minimalist'



" Press Tab to scroll _down_ a list of auto-completions
let g:SuperTabDefaultCompletionType = "<c-n>"

" rustfmt on write using autoformat
autocmd BufWrite * :Autoformat

"TODO: clippy on write
autocmd BufWrite * :Autoformat

nnoremap <leader>c :!cargo clippy


"---
