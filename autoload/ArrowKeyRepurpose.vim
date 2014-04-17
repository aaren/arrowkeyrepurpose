
"│-v-1 │ Main functionality
"└─────┴────────────────────

function! ArrowKeyRepurpose#DelEmptyLineAbove() "-v-
	if line(".") == 1
		return
	endif
	let l:line = getline(line(".") - 1)
	if l:line =~ '^\s*$'
		let l:colsave = col(".")
		.-1d
		silent normal! <C-y>
		call cursor(line("."), l:colsave)
	endif
endfunction "-^-

function! ArrowKeyRepurpose#AddEmptyLineAbove() "-v-
	let l:scrolloffsave = &scrolloff
	" Avoid jerky scrolling with ^E at top of window
	set scrolloff=0
	call append(line(".") - 1, "")
	if winline() != winheight(0)
		silent normal! <C-e>
	endif
	let &scrolloff = l:scrolloffsave
endfunction "-^-

function! ArrowKeyRepurpose#DelEmptyLineBelow() "-v-
	if line(".") == line("$")
		return
	endif
	let l:line = getline(line(".") + 1)
	if l:line =~ '^\s*$'
		let l:colsave = col(".")
		.+1d
		''
		call cursor(line("."), l:colsave)
	endif
endfunction "-^-

function! ArrowKeyRepurpose#AddEmptyLineBelow() "-v-
	call append(line("."), "")
endfunction "-^-

" Arrow key remapping: Up/Dn = move line up/dn; Left/Right = indent/unindent
function! ArrowKeyRepurpose#SetArrowKeysAsTextShifters() "-v-
	" normal mode -v-
	nmap <silent> <Left> <<
	nmap <silent> <Right> >>
	nnoremap <silent> <Up> <Esc>:call ArrowKeyRepurpose#DelEmptyLineAbove()<CR>
	nnoremap <silent> <Down>  <Esc>:call ArrowKeyRepurpose#AddEmptyLineAbove()<CR>
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
"-^-
endfunction "-^-

" -v-1 modeline
" vim: set fmr=-v-,-^- fdm=marker list noet ts=4 sw=4 sts=4 :

