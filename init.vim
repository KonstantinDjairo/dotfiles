call plug#begin()

"-- OBS: TEM Q INSTALAR O LANGUAGE CLIENT:
"       mkdir -p ~/.vim-plugins
"	cd ~/.vim-plugins
"	git clone --depth 1 https://github.com/autozimu/LanguageClient-neovim.git
"	cd LanguageClient-neovim
"	bash install.sh
"-----------------------




"------- defx
if has('nvim')
	Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/defx.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif

"---- vim airline

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'




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
autocmd vimenter * NERDTree

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


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



" Use release branch (recommend)
Plug 'neoclide/coc.nvim'
Plug 'neovim/nvim-lsp'


Plug 'ervandew/supertab'
Plug 'Chiel92/vim-autoformat'
Plug 'rust-lang/rust.vim'
"---- tema
Plugin 'dracula/vim', { 'name': 'dracula' }


call plug#end()


"---- airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'




"--- tecla de atalho pra compilar
nnoremap <F5> :w <CR> :terminal rs % && ./%< <CR>


"---- tema



colorscheme dracula
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

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'



