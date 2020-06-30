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

"markdown	
"	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
"	let g:mkdp_path_to_chrome="firefox"
"	let g:mkdp_auto_close=0
"	nmap <F9> <Plug>MarkdownPreview
"	nmap <F10> <Plug>StopMarkdownPreview

	Plug 'JamshedVesuna/vim-markdown-preview'
	let vim_markdown_preview_perl=1
	let vim_markdown_preview_toggle=3
	Plug 'godlygeek/tabular'
	Plug 'plasticboy/vim-markdown'
	let g:vim_markdown_math = 1

"coc
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

"spacevim
	Plug 'liuchengxu/space-vim'
	Plug 'liuchengxu/space-vim-dark'
	Plug 'liuchengxu/vim-which-key'
	let g:spacevim_enable_true_color = 1

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
set cmdheight=2
set hidden
set updatetime=300
set relativenumber
autocmd TextChanged,TextChangedI <buffer> silent write

"au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

inoremap <F2> <Esc>:%s/\r//g<cr> gg
nnoremap <F2> :%s/\r//g<cr> gg
