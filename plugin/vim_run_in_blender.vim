function! Run_In_Blender()
	let tmpfile=tempname()
	exe 'w ' . tmpfile
	call writefile([tmpfile], '/tmp/bpy_external.io')
	echo tmpfile
endfunction

function! Run_Selection_In_Blender() range
	let tmpfile=tempname()
	let data=split(getreg('*'),"\n")
	call writefile(data, tmpfile)
	call writefile([tmpfile], '/tmp/bpy_external.io')
	echo tmpfile
endfunction

command! RunInBlender call Run_In_Blender()
command! -range RunSelectionInBlender call Run_Selection_In_Blender() 

