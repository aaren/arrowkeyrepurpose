
"│-v-1 │ Main functionality
"└─────┴────────────────────

function! ArrowKeyRepurpose#DelEmptyLineAbove(...) "-v-
	let l:is_visual = a:0 ? a:1 : 0
	
	if l:is_visual
		let l:line_to_del = line("'<") - 1
	elseif foldclosed('.') != -1
		let l:line_to_del = foldclosed('.') - 1
	else
		let l:line_to_del = line('.') - 1
	endif
	
	if (l:line_to_del >= 1) && (getline(l:line_to_del) =~ '^\s*$')
		let l:colsave = col(".")
		exe ":" . l:line_to_del . "delete"
		silent normal! <C-y>
		call cursor(line("."), l:colsave)
	endif
endfunction "-^-
noremap <plug>ArrowKeyRepurp_DelEmptyLineAbove_normal <Esc>:call ArrowKeyRepurpose#DelEmptyLineAbove()<CR>
noremap <plug>ArrowKeyRepurp_DelEmptyLineAbove_visual <Esc>:call ArrowKeyRepurpose#DelEmptyLineAbove(1)<CR>gv
noremap <plug>ArrowKeyRepurp_DelEmptyLineAbove_insert :call ArrowKeyRepurpose#DelEmptyLineAbove()<CR>a

function! ArrowKeyRepurpose#AddEmptyLineAbove(...) "-v-
	let l:is_visual = a:0 ? a:1 : 0
	
	if l:is_visual
		let l:line_to_add = line("'<") - 1
	elseif foldclosed('.') != -1
		let l:line_to_add = foldclosed('.') - 1
	else
		let l:line_to_add = line('.') - 1
	endif
	
	let l:scrolloffsave = &scrolloff
	" Avoid jerky scrolling with ^E at top of window
	set scrolloff=0
	call append(l:line_to_add, "")
	if winline() != winheight(0)
		silent normal! <C-e>
	endif
	let &scrolloff = l:scrolloffsave
endfunction "-^-
noremap <plug>ArrowKeyRepurp_AddEmptyLineAbove_normal <Esc>:call ArrowKeyRepurpose#AddEmptyLineAbove()<CR>
noremap <plug>ArrowKeyRepurp_AddEmptyLineAbove_visual <Esc>:call ArrowKeyRepurpose#AddEmptyLineAbove(1)<CR>gv
noremap <plug>ArrowKeyRepurp_AddEmptyLineAbove_insert :call ArrowKeyRepurpose#AddEmptyLineAbove()<CR>a

function! ArrowKeyRepurpose#DelEmptyLineBelow(...) "-v-
	let l:is_visual = a:0 ? a:1 : 0
	
	if l:is_visual
		let l:line_to_del = line("'>") + 1
	elseif foldclosedend('.') != -1
		let l:line_to_del = foldclosedend('.') + 1
	else
		let l:line_to_del = line('.') + 1
	endif
	
	if (l:line_to_del <= line("$")) && (getline(l:line_to_del) =~ '^\s*$')
		let l:colsave = col(".")
		exe ":" . l:line_to_del . "delete"
		''
		call cursor(line("."), l:colsave)
	endif
endfunction "-^-
noremap <plug>ArrowKeyRepurp_DelEmptyLineBelow_normal <Esc>:call ArrowKeyRepurpose#DelEmptyLineBelow()<CR>
noremap <plug>ArrowKeyRepurp_DelEmptyLineBelow_visual <Esc>:call ArrowKeyRepurpose#DelEmptyLineBelow(1)<CR>gv
noremap <plug>ArrowKeyRepurp_DelEmptyLineBelow_insert :call ArrowKeyRepurpose#DelEmptyLineBelow()<CR>a

function! ArrowKeyRepurpose#AddEmptyLineBelow(...) "-v-
	let l:is_visual = a:0 ? a:1 : 0
	
	if l:is_visual
		let l:line_to_add = line("'>")
	elseif foldclosedend('.') != -1
		let l:line_to_add = foldclosedend('.')
	else
		let l:line_to_add = line('.')
	endif
	
	call append(l:line_to_add, "")
endfunction "-^-
noremap <plug>ArrowKeyRepurp_AddEmptyLineBelow_normal <Esc>:call ArrowKeyRepurpose#AddEmptyLineBelow()<CR>
noremap <plug>ArrowKeyRepurp_AddEmptyLineBelow_visual <Esc>:call ArrowKeyRepurpose#AddEmptyLineBelow(1)<CR>gv
noremap <plug>ArrowKeyRepurp_AddEmptyLineBelow_insert :call ArrowKeyRepurpose#AddEmptyLineBelow()<CR>a

" Arrow key remapping: Up/Dn = move line up/dn; Left/Right = indent/unindent
function! ArrowKeyRepurpose#SetArrowKeysAsTextShifters() "-v-
	" normal mode -v-
	nnoremap <silent> <Left>   <<
	nnoremap <silent> <Right>  >>
	nmap     <silent> <Up>     <plug>ArrowKeyRepurp_DelEmptyLineAbove_normal
	nmap     <silent> <Down>   <plug>ArrowKeyRepurp_AddEmptyLineAbove_normal
	nmap     <silent> <S-Up>   <plug>ArrowKeyRepurp_DelEmptyLineBelow_normal
	nmap     <silent> <S-Down> <plug>ArrowKeyRepurp_AddEmptyLineBelow_normal
	"-^-
	" visual mode"-v-
	vnoremap <silent> <Left>   <gv
	vnoremap <silent> <Right>  >gv
	vmap     <silent> <Up>     <plug>ArrowKeyRepurp_DelEmptyLineAbove_visual
	vmap     <silent> <Down>   <plug>ArrowKeyRepurp_AddEmptyLineAbove_visual
	vmap     <silent> <S-Up>   <plug>ArrowKeyRepurp_DelEmptyLineBelow_visual
	vmap     <silent> <S-Down> <plug>ArrowKeyRepurp_AddEmptyLineBelow_visual
	"-^-
	" insert mode -v-
	inoremap <silent> <Left>   <C-D>
	inoremap <silent> <Right>  <C-T>
	imap     <silent> <Up>     <esc><plug>ArrowKeyRepurp_DelEmptyLineAbove_insert
	imap     <silent> <Down>   <esc><plug>ArrowKeyRepurp_AddEmptyLineAbove_insert
	imap     <silent> <S-Up>   <esc><plug>ArrowKeyRepurp_DelEmptyLineBelow_insert
	imap     <silent> <S-Down> <esc><plug>ArrowKeyRepurp_AddEmptyLineBelow_insert
	"-^-
endfunction "-^-

function! ArrowKeyRepurpose#SetShiftLeftRightAsWindowResize() "-v-
	nnoremap <S-Left> <C-W><
	nnoremap <S-Right> <C-W>>
endfunction "-^-

" -v-1 modeline
" vim: set fmr=-v-,-^- fdm=marker list noet ts=4 sw=4 sts=4 :

