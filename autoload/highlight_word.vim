function! s:Vword()
  return getline('.')[col("'<")-1:col("'>")-1]
endfunction

function! highlight_word#highlight_clear()
  if exists('s:highlight_match_id')
    call matchdelete(s:highlight_match_id)
    unlet s:highlight_match_id
    unlet s:highlight_word
  endif
endfunction

function! highlight_word#highlight_word(word)
  if exists('s:highlight_match_id')
    call matchdelete(s:highlight_match_id)
    unlet s:highlight_match_id
  endif
  if exists('s:highlight_word') && s:highlight_word ==# a:word
    unlet s:highlight_word
  else
    let s:highlight_word = a:word
    let s:highlight_match_id = matchadd('Highlight', '\<'.a:word.'\>')
  endif
endfunction

function! highlight_word#highlight_nword()
  call highlight_word#highlight_word(expand('<cword>'))
endfunction

function! highlight_word#highlight_vword()
  let col = col('.')
  call highlight_word#highlight_word(s:Vword())
  call cursor(line('.'), col)
endfunction
