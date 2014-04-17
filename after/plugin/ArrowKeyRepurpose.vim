
if !exists('g:ArrowKeyRepurpose_do_mappings')
	let g:ArrowKeyRepurpose_do_mappings = 1
endif

if g:ArrowKeyRepurpose_do_mappings
	" normal mode -v-
	nmap <silent> <Left> <<
	nmap <silent> <Right> >>
	nnoremap <silent> <Up> <Esc>:call ArrowKeyRepurpose#DelEmptyLineAbove()<CR>
	nnoremap <silent> <Down> <Esc>:call ArrowKeyRepurpose#AddEmptyLineAbove()<CR>
	nnoremap <silent> <S-Up> <Esc>:call ArrowKeyRepurpose#DelEmptyLineBelow()<CR>
	nnoremap <silent> <S-Down> <Esc>:call ArrowKeyRepurpose#AddEmptyLineBelow()<CR>
	"-^-
	" visual mode"-v-
	vmap <silent> <Left> <
	vmap <silent> <Right> >
	vnoremap <silent> <Up> <Esc>:call ArrowKeyRepurpose#DelEmptyLineAbove()<CR>gv
	vnoremap <silent> <Down>  <Esc>:call ArrowKeyRepurpose#AddEmptyLineAbove()<CR>gv
	vnoremap <silent> <S-Up> <Esc>:call ArrowKeyRepurpose#DelEmptyLineBelow()<CR>gv
	vnoremap <silent> <S-Down> <Esc>:call ArrowKeyRepurpose#AddEmptyLineBelow()<CR>gv
	"-^-
	" insert mode -v-
	imap <silent> <Left> <C-D>
	imap <silent> <Right> <C-T>
	inoremap <silent> <Up> <Esc>:call ArrowKeyRepurpose#DelEmptyLineAbove()<CR>a
	inoremap <silent> <Down> <Esc>:call ArrowKeyRepurpose#AddEmptyLineAbove()<CR>a
	inoremap <silent> <S-Up> <Esc>:call ArrowKeyRepurpose#DelEmptyLineBelow()<CR>a
	inoremap <silent> <S-Down> <Esc>:call ArrowKeyRepurpose#AddEmptyLineBelow()<CR>a
	"-^-
endif

" -v-1 modeline
" vim: set fmr=-v-,-^- fdm=marker list noet ts=4 sw=4 sts=4 :

