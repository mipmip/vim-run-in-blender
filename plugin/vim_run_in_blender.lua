function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

function directory_exists(path)
  local f = os.execute("cd '" .. path .. "'")
  return f == 0
end

local is_wsl = vim.fn.has('win32') ~= true and directory_exists('/mnt/c/Users')

local tmp_folder = '/tmp'
if vim.fn.has('win32') == true then
  tmp_folder = vim.fn.expand('$TEMP')
elseif is_wsl then
  local userpath = io.popen('wslpath $(cmd.exe /C "echo %USERPROFILE%")')
  tmp_folder = vim.fn.trim(userpath:read()) ..'/AppData/Local/Temp'
end

local bpy_file = tmp_folder .. '/bpy_external.io'

function Run_In_Blender()
	local tf = vim.fn.tempname()
	local tmpfile = tmp_folder .. '/' .. string.gsub(string.gsub(tf, '\\', '_'), '/', '_')
	vim.api.nvim_command('w ' .. tmpfile)
	if is_wsl then
		tmpfile = string.gsub(string.gsub(tmpfile, '/mnt/c/', 'C:\\'), '/', '\\')
	end
	vim.fn.writefile({ tmpfile }, bpy_file)
	print(tmpfile)
end

function Run_Selection_In_Blender()
	local tmpfile=vim.fn.tempname()
	local data=vim.fn.split(vim.fn.getreg('*'),"\n")
	vim.fn.writefile(data, tmpfile)
	vim.fn.writefile({ tmpfile }, bpy_file)
	print(tmpfile)
end


vim.api.nvim_create_user_command('RunInBlender', function() Run_In_Blender() end, {})
vim.api.nvim_create_user_command('RunSelectionInBlender', function() Run_Selection_In_Blender() end, { range = true })
