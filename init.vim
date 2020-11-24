call plug#begin()



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

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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

Plug 'phanviet/vim-monokai-pro'



"---- colocando numero nas linhas

set number
set relativenumber


"------- defx enable Highlight
let g:defx_icons_term_colors = {
			\ 'red': 2
			\ }


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



Plug 'ervandew/supertab'
Plug 'Chiel92/vim-autoformat'

" Use release branch (recommend)
Plug 'neoclide/coc.nvim'
Plug 'neovim/nvim-lsp'


Plug 'ervandew/supertab'
Plug 'Chiel92/vim-autoformat'
Plug 'rust-lang/rust.vim'





call plug#end()


"---- airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'




"--- tecla de atalho pra compilar
nnoremap <F5> :w <CR> :terminal rs % && ./%< <CR>


"---- tema

set termguicolors
colorscheme monokai_pro

let g:lightline = {
			\ 'colorscheme': 'monokai_pro',
			\ }


"---- status line

let g:airline_theme='luna'





" auto save with formating rust
let g:rustfmt_autosave = 1

"setup rust-lang pack
let g:rust_clip_command = 'xclip -selection clipboard'

" setup rust_analyzer LSP (IDE features)
"lua require'nvim_lsp'.rust_analyzer.setup{}

" Use LSP omni-completion in Rust files
autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc







" Press Tab to scroll _down_ a list of auto-completions
let g:SuperTabDefaultCompletionType = "<c-n>"

" rustfmt on write using autoformat
autocmd BufWrite * :Autoformat

"TODO: clippy on write
autocmd BufWrite * :Autoformat

nnoremap <leader>c :!cargo clippy


"---
"----- language cliente
"

set runtimepath+=~/.vim-plugins/LanguageClient-neovim



"--- configuracoes do language cliente
"
let g:LanguageClient_serverCommands = {
			\ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
			\ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
			\ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
			\ 'python': ['/usr/local/bin/pyls'],
			\ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
			\ }



