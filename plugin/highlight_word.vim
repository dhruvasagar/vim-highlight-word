if exists('g:loaded_highlight_word')
  finish
endif
let g:loaded_highlight_word = 1

hi Highlight term=underline ctermbg=237 guibg=#3a3a3a

nnoremap <silent> <Plug>(highlight-nword) :<C-U>call highlight_word#highlight_nword()<CR>
nnoremap <silent> <Plug>(highlight-clear) :<C-U>call highlight_word#highlight_clear()<CR>
xnoremap <silent> <Plug>(highlight-vword) :call highlight_word#highlight_vword()<CR>

if !hasmapto('<Plug>(highlight-nword)')
  nmap <Enter> <Plug>(highlight-nword)
endif
if !hasmapto('<Plug>(highlight-vword)')
  xmap <Enter> <Plug>(highlight-vword)
endif
if !hasmapto('<Plug>(highlight-clear)')
  nmap <Leader><Enter> <Plug>(highlight-clear)
endif

if !exists('g:highlight_cursor')
  let g:highlight_cursor = 0
endif

if exists('g:highlight_cursor') && g:highlight_cursor
  augroup highlight
    au!

    autocmd CursorMoved * call highlight_word#highlight_nword()
  augroup END
endif
