set ts=2 sw=2
set autoindent
filetype plugin indent on

"-----General Binds-----
inoremap ( ()<Left>
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

inoremap [ []<Left>
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

inoremap ' ''<Left>
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "'" ? "\<Right>" : "'"

inoremap " ""<Left>
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == '"' ? "\<Right>" : '"'

"-----------------------

"-----C and C++ Binds-----
"
autocmd FileType c,cpp inoremap <buffer> nl; \n

"-------------------------


"-----HTML Binds-----
"
function! EmmetEnter()
	let l:part = strpart(getline('.'), col('.')-1, 1)
	if l:part == "<"
		return "\<CR>\<Esc>O" 
	else
		return "\<CR>"
	endfunction

	autocmd FileType htm,html,css setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
	autocmd FileType htm,html inoremap <buffer> <expr> <CR> EmmetEnter() 

	"--------------------

	set nocompatible

	" Plugins
	call plug#begin()
	Plug 'mattn/emmet-vim'
	Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
	Plug 'dense-analysis/ale'
	Plug 'sheerun/vim-polyglot'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'junegunn/limelight.vim'
	Plug 'preservim/nerdtree'
	Plug 'itchyny/lightline.vim'
	Plug 'terryma/vim-smooth-scroll'
	Plug 'mg979/vim-visual-multi', {'branch': 'master'}
	Plug 'tpope/vim-commentary'
	Plug 'neovim/nvim-lspconfig'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-fugitive'
	Plug 'morhetz/gruvbox'
	call plug#end()

	set noshowmode

	set splitbelow
	set splitright

	set so=7

	set backspace=indent,eol,start
	set whichwrap+=<,>,h,l
	set wrap
	set history=500
	set showcmd
	set showmode
	set autoread
	set hidden

	set updatetime=300

	set shortmess+=c

	set signcolumn=yes

	set smartindent

	set noerrorbells

	set cmdheight=2

	set showmatch

	set magic

	set lazyredraw

	set confirm
	set laststatus=2
	set ruler
	set wildmenu
	set tabpagemax=40
	set number relativenumber
	set mouse=a
	set background=dark
	set title

	set incsearch
	set ignorecase
	set smartcase
	set nohlsearch

	"set notimeout
	"set ttimeout
	set timeoutlen=1000
	set ttimeoutlen=0

	set encoding=utf-8
	set linebreak
	set scrolloff=8
	set sidescrolloff=5

	syntax on
	colorscheme gruvbox

	set nomodeline
	set nrformats-=octal

	let mapleader = "/"

	set smarttab

	set showtabline=2
	map <leader>tn :tabnew<cr>
	map <leader>t<leader> :tabnext
	map <leader>tm :tabmove
	map <leader>tc :tabclose<cr>
	map <leader>to :tabonly<cr>

	set guicursor=i:block

	noremap <space> /

	map <C-j> <C-W>j
	map <C-k> <C-W>k
	map <C-h> <C-W>h
	map <C-l> <C-W>l

	vnoremap §1 <esc>`>a)<esc>`<i(<esc>
	vnoremap §2 <esc>`>a]<esc>`<i[<esc>
	vnoremap §3 <esc>`>a}<esc>`<i{<esc>
	vnoremap §q <esc>`>a"<esc>`<i"<esc>
	vnoremap §w <esc>`>a'<esc>`<i'<esc>
	vnoremap §e <esc>`>a`<esc>`<i`<esc>

	inoremap §1 ()<esc>i
	inoremap §2 []<esc>i
	inoremap §3 {}<esc>i
	inoremap §4 {<esc>o}<esc>O
	inoremap §q ""<esc>i
	inoremap §w ''<esc>i

	inoremap §r return<esc>a

	map <silent> <leader><cr> :noh<cr>

	"Save with leader->w 
	nmap <leader>w :w!<cr>

	map <leader>q :wq<cr>
	map <leader>Q :q<cr>

	"Start of line NON-BLANK
	map 0 ^

	"Alt-J and Alt-K to move line up or down (visual: multi-lines)
	nmap ∆ mz:m+<cr>`z
	nmap ˚ mz:m-2<cr>`z
	vmap ∆ :m'>+<cr>`<my`>mzgv`yo`z
	vmap ˚ :m'<-2<cr>`>my`<mzgv`yo`z

	vnoremap <silent> * :call VisualSelection('f')<CR>
	vnoremap <silent> # :call VisualSelection('b')<CR>
	vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

	nnoremap <leader>n :NERDTreeFocus<CR>

	nnoremap <leader>fj gg=G'.

	nnoremap <expr> j v:count ? 'j' : 'gj'
	nnoremap <expr> k v:count ? 'k' : 'gk'

	nnoremap S :%s//g<Left><Left>

	nnoremap ciq ci"
	nnoremap caq ca"
	vnoremap viq vi"
	vnoremap vaq va"
	nnoremap diq di"
	nnoremap daq da"

	nnoremap ciQ ci'
	nnoremap caQ ca'
	vnoremap viQ vi'
	vnoremap vaQ va'
	nnoremap diQ di'
	nnoremap daQ da'

	nmap <leader>s <Plug>(Prettier)

	xnoremap <leader>p "_dP

	" Copy into clipboard
	nnoremap <leader>y "+y
	vnoremap <leader>y "+y
	nmap <leader>Y "+Y

	nnoremap <leader>d "_d
	vnoremap <leader>d "_d

	nnoremap <leader>ff <cmd>Telescope find_files<cr>
	nnoremap <leader>fg <cmd>Telescope live_grep<cr>
	nnoremap <leader>fb <cmd>Telescope buffers<cr>
	nnoremap <leader>fh <cmd>Telescope help_tags<cr>

	noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
	noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
	noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
	noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

	let $BASH_ENV = "~/.bash_alises"

	let g:user_emmet_leader_key='<Tab>'
	let g:netrw_liststyle = 3
	let g:netrw_browse_split = 4
	let g:netrw_winsize = 15

	let g:lightline = { 'colorscheme': 'wombat', }

	if executable('rg')
		let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
	endif

	let g:ale_sign_error = '❌'
	let g:ale_sign_warning = '⚠️'
	let g:ale_lint_on_enter = 0
	let g:ale_lint_on_text_changed = 'never'
	highlight ALEErrorSign ctermbg=NONE ctermfg=red
	highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
	let g:ale_fixers = {   'javascript': [      'eslint',      'prettier'   ]}

	let g:ale_lint_on_save = 1
	let g:ale_fix_on_save = 1
	let g:ale_javascript_prettier_options = '--no-semi --single-quote --trailing-comma none'

	" Color name (:help cterm-colors) or ANSI code
	let g:limelight_conceal_ctermfg = 'gray'
	let g:limelight_conceal_ctermfg = 240

	" Color name (:help gui-colors) or RGB color
	let g:limelight_conceal_guifg = 'DarkGray'
	let g:limelight_conceal_guifg = '#777777'

	let @p = "i \<Esc>p"
	let @i = "vit\<Esc>\<Esc>i"
	let @l = "vat\<Esc>\<Esc>l"

	" Ignore compiled files
	set wildignore=*.o,*~,*.pyc
	if has("win16") || has("win32")
		set wildignore+=.git\*,.hg\*,.svn\*
	else
		set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
	endif

	"set backupdir=~/.vim/_backup/,~/tmp,.
	"set directory=~/.vim/_swap//

	au FileType css setl ofu=csscomplete#CompleteCSS

	function! CmdLine(str)
		call feedkeys(":" . a:str)
	endfunction

	function! VisualSelection(direction, extra_filter) range
		let l:saved_reg = @"
		execute "normal! vgvy"

		let l:pattern = escape(@", "\\/.*'$^~[]")

		let l:pattern = substitute(l:pattern, "\n$", "", "")

		if a:direction == 'gv'
			call CmdLine("Ack '" . l:pattern . "' " )
		elseif a:direction == 'replace'
			call CmdLine("%s" . '/'. l:pattern . '/')
		endif

		let @/ = l:pattern
		let @" = l:saved_reg
	endfunction

	map <F5> :call CompileRun()<CR>
	imap <F5> <Esc>:call CompileRun()<CR>
	vmap <F5> <Esc>:call CompileRun()<CR>

	func! CompileRun()
		exec "w"
		if &filetype == 'c'
			exec "!gcc % -o %<"
			exec "!leaks -atExit -- ./%< | grep LEAK:"
			exec "!time ./%<"
		elseif &filetype == 'cpp'
			exec "!g++ % -o %<"
			exec "!leaks -atExit -- ./%< | grep LEAK:"
			exec "!time ./%<"
		elseif &filetype == 'java'
			exec "!javac %"
			exec "!time java %"
		elseif &filetype == 'sh'
			exec "!time bash %"
		elseif &filetype == 'python'
			exec "!time python3 %"
		elseif &filetype == 'html'
			exec "!google-chrome % &"
		elseif &filetype == 'go'
			exec "!go build %<"
			exec "!time go run %"
		elseif &filetype == 'matlab'
			exec "!time octave %"
		endif
	endfunc


	fun! CPPFormatSettings()
		setlocal equalprg=clang-format\ -style=google
	endfunction

	autocmd FileType c,cpp call CPPFormatSettings()







