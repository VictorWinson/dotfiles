call plug#begin('~/.nvim/plugged')

"tagbar
	Plug 'majutsushi/tagbar'	
	let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Chapter',
        \ 'i:Section',
        \ 'k:Paragraph',
        \ 'j:Subparagraph'
    \ ]
\ }

"fzf
	Plug 'junegunn/fzf'

"markdown	
"	Plug 'JamshedVesuna/vim-markdown-preview'
"	let vim_markdown_preview_perl=1
"	let vim_markdown_preview_toggle=3
"	Plug 'godlygeek/tabular'
"	Plug 'plasticboy/vim-markdown'
"	let g:vim_markdown_math = 1

"coc
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	let g:coc_global_extensions = [
	\ 'coc-vimlsp',
	\ 'coc-clangd',
	\ 'coc-spell-checker',
	\ 'coc-vimlsp',
	\ 'coc-go',
	\ 'coc-html',
	\ 'coc-json',
	\ 'coc-pairs',
	\ 'coc-pyls',
	\ 'coc-highlight',
	\ 'coc-sql']
"	\ 'coc-python',
"	\ 'coc-phpls',

	" highlight where cursor lies 
	autocmd CursorHold * silent call CocActionAsync('highlight')

	" let coc auto-completion work with <TAB>
		inoremap <silent><expr> <TAB>
    	  \ pumvisible() ? "\<C-n>" :
    	  \ <SID>check_back_space() ? "\<TAB>" :
    	  \ coc#refresh()
		inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

		function! s:check_back_space() abort
		  let col = col('.') - 1
		  return !col || getline('.')[col - 1]  =~# '\s'
		endfunction
	" use <ENTER> to confirm auto-completion
		if exists('*complete_info')
		  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
		else
		  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
		endif
	" Highlight the symbol and its references when holding the cursor.
		autocmd CursorHold * silent call CocActionAsync('highlight')

"spacevim
"	Plug 'liuchengxu/space-vim'
"	Plug 'liuchengxu/space-vim-dark'
"	Plug 'liuchengxu/vim-which-key'
"	let g:spacevim_enable_true_color = 1

"air-line
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	let g:airline_theme='luna'
	let g:airline_powerline_fonts = 1

"NERDtree
	Plug 'preservim/nerdtree'
call plug#end()

"mapping
	nmap <F7> :NERDTree<CR>
	nmap <F8> :TagbarToggle<CR>

" highlight line
	set cursorline
	highlight CursorLine cterm=NONE ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE

set guifont="MesloLGS NF Regular"\ 20
set shiftwidth=4
set softtabstop=4
set tabstop=4
set nu! " line number
set nocompatible " avoid bug
set autoindent " set auto indent
set hidden
set updatetime=100
set relativenumber
set signcolumn=yes " merge line number and grammar error sign
autocmd TextChanged,TextChangedI <buffer> silent write " auto save

"au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

inoremap <F2> <Esc>:%s/\r//g<cr> gg
nnoremap <F2> :%s/\r//g<cr> gg

"""""""""""""""
" custom func 
"""""""""""""""

noremap <A-r> :call CompileRun()<CR>
" language compile and run
func! CompileRun()
	exec "w"
	if &filetype == 'python'
		set splitbelow
		:10sp " height 10
		:term python3 '%'
	endif

	if &filetype == 'c'
		set splitbelow
		:10sp " height 10
		:term gcc '%' && ./a.out && rm a.out
	endif

	if &filetype == 'cpp'
		set splitbelow
		:10sp " height 10
		:term g++ '%' && ./a.out && rm a.out
	endif

	if &filetype == 'go'
		set splitbelow
		:10sp " height 10
		:term go run '%'
	endif
endfunc
