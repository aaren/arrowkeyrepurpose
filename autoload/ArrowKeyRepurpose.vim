
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

" -v-1 modeline
" vim: set fmr=-v-,-^- fdm=marker list noet ts=4 sw=4 sts=4 :

