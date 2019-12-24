if &compatible
	set compatible
endif
"Add the dein installation directory into runtime"
let s:dein_dir = expand('~/.cache/dein/repos/github.com')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein install check"
if &runtimepath !~# '/dein.vim'
	if !isdirectory(s:dein_repo_dir)
		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
	endif
	execute 'set runtimepath^=' . s:dein_repo_dir
endif

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

	" .toml file"
	let s:rc_dir = expand('~/.vim')
	if !isdirectory(s:rc_dir)
		call mkdir(s:rc_dir, 'p')
	endif
	let s:toml = s:rc_dir . '/dein.toml'
	let s:lazy_toml = s:rc_dir . '/dein_lazy.toml'

	"read toml and cache"
	call dein#load_toml(s:toml, {'lazy': 0})
	call dein#load_toml(s:lazy_toml, {'lazy': 1})

	"end setting"
	call dein#end()
	call dein#save_state()
endif

if dein#check_install()
	call dein#install()
endif

let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
	call map(s:removed_plugins, "delete(v:val, 'rf')")
	call dein#recache_runtimepath()
endif

set virtualedit=onemore
set cursorline
set number
set showmatch
set smartindent
set shiftwidth=4
set wildmenu
set history=100
set laststatus=2
syntax enable
colorscheme darkblue

if has('persistent_undo')
	let undo_path = expand('~/.vim/undo')
	exe 'set undodir=' . undo_path
	set undofile
endif

"keymap "
"normal mord"
nnoremap <C-e> :e ~/.vimrc<CR>

"insert mord"

"Complement in insert mord"
" Brackets "
inoremap ( ()<ESC>i
inoremap <expr> ) ClosePair(')')
inoremap { {}<ESC>i
inoremap <expr> } ClosePair('}')
inoremap [ []<ESC>i
inoremap <expr> ] ClosePair(']')

function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
	    return "\<Right>"
	else
	    return a:char
	endif
endf

"Options for vim-clang"
let g:clang_c_options='-std=c11'
let g:clang_cpp_options='-std=c++1z -stdlib=libc++'
let g:clang_format_auto=1
let g:clang_format_style='Google'
let g:clang_check_syntax_auto=1

"molokai color scheme"
syntax on
colorscheme molokai
