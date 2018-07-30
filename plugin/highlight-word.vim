if exists('g:loaded_highlight_word')
  finish
endif
let g:loaded_highlight_word = 1

hi Highlight term=underline ctermbg=237 guibg=#3a3a3a

nnoremap <silent> <Plug>(highlight-nword) :<C-U>call highlight_word#highlight_nword()<CR>
xnoremap <silent> <Plug>(highlight-nword) :call highlight_word#highlight_vword()<CR>

if !hasmapto('<Plug>(highlight-nword)')
  nmap <Enter> <Plug>(highlight-nword)
endif
if !hasmapto('<Plug>(highlight-vword')
  xmap <Enter> <Plug>(highlight-vword)
endif
