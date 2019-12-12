if &compatible
	set compatible
endif
"Add the dein installation directory into runtime"
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
	call dein#begin('~/.cache/dein')

	call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
	call dein#add('Shougo/deoplete.nvim')
	if !has('nvim')
		call dein#add('roxma/nvim-yarp')
		call dein#add('roxma/vim-hug-neovim-rpc')
		"Add the plugin here like below"
		"if plugin exists in github"
		"call dein#add('author/something.vim)"
		"to applicate plugin, run ':call dein#install()'"
		call dein#add('fatih/vim-go')
		call dein#add('justmao945/vim-clang')
		call dein#add('tpope/vim-fugitive')
	endif

	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax enable

set virtualedit=onemore
set cursorline
set number
set showmatch
set smartindent
set wildmenu
syntax on
set laststatus=2

if has('persistent_undo')
	let undo_path = expand('~/.vim/undo')
	exe 'set undodir=' . undo_path
	set undofile
endif

"Key mapping"
nnoremap <C-e> :e ~/.vimrc<CR>

"Options for vim-clang"
let g:clang_c_options='-std=c11'
let g:clang_cpp_options='-std=c++1z -stdlib=libc++'
let g:clang_format_auto=1
let g:clang_format_style='Google'
let g:clang_check_syntax_auto=1

