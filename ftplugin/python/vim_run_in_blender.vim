" --------------------------------
" Add our plugin to the path
" --------------------------------
python3 import sys
python3 import vim
python3 sys.path.append(vim.eval('expand("<sfile>:h")'))

" --------------------------------
"  Function(s)
" --------------------------------

function! Run_In_Blender()
python3 << endOfPython

from vim_run_in_blender import vim_run_in_blender

print(vim_run_in_blender(list(vim.current.buffer)))

endOfPython
endfunction

fun! Run_Selection_In_Blender() range
python3 << endOfPython

buf = vim.current.buffer
(lnum1, col1) = buf.mark('<')
(lnum2, col2) = buf.mark('>')
lines = vim.eval('getline({}, {})'.format(lnum1, lnum2))
lines[0] = lines[0][col1:]
lines[-1] = lines[-1][:col2]

from vim_run_in_blender import vim_run_selected_in_blender
print(vim_run_selected_in_blender("\n".join(lines)))

endOfPython
endfunction

" --------------------------------
"  Expose our commands to the user
" --------------------------------
command! RunInBlender call Run_In_Blender()
command! -range RunSelectionInBlender  <line1>,<line2>call Run_Selection_In_Blender()
