
if !exists('g:ArrowKeyRepurp_settings')
	let g:ArrowKeyRepurp_settings = {}
endif

if !exists('g:ArrowKeyRepurp_settings.do_map_arrows')
	let g:ArrowKeyRepurp_settings.do_map_arrows = 1
endif

if !exists('g:ArrowKeyRepurp_settings.do_map_shift_updown')
	let g:ArrowKeyRepurp_settings.do_map_shift_updown = 1
endif

if !exists('g:ArrowKeyRepurp_settings.do_map_shift_leftright')
	let g:ArrowKeyRepurp_settings.do_map_shift_leftright = 1
endif


if g:ArrowKeyRepurp_settings.do_map_arrows
	call ArrowKeyRepurpose#SetArrowKeysAsTextShifters()
endif

if g:ArrowKeyRepurp_settings.do_map_shift_updown
	call ArrowKeyRepurpose#SetShiftUpDownAsTextShifters()
endif

if g:ArrowKeyRepurp_settings.do_map_shift_leftright
	call ArrowKeyRepurpose#SetShiftLeftRightAsWindowResize()
endif

" -v-1 modeline
" vim: set fmr=-v-,-^- fdm=marker list noet ts=4 sw=4 sts=4 :

