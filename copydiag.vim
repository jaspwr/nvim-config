nnoremap <silent> <leader>diag :call StatusDiagnosticToClipboard()<CR>
function! StatusDiagnosticToClipboard() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif

  call setreg('+', join(msgs, ' ') . ' ' . get(g:, 'coc_status', ''))

endfunction
