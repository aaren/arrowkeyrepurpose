
if !exists('g:ArrowKeyRepurpose_do_mappings')
	let g:ArrowKeyRepurpose_do_mappings = 1
endif

if g:ArrowKeyRepurpose_do_mappings
	call ArrowKeyRepurpose#SetArrowKeysAsTextShifters()
	call ArrowKeyRepurpose#SetShiftLeftRightAsWindowResize()
endif

" -v-1 modeline
" vim: set fmr=-v-,-^- fdm=marker list noet ts=4 sw=4 sts=4 :

