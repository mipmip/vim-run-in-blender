import tempfile

def vim_run_in_blender(buffer_contents):
    run_python_code('\n'.join(buffer_contents))
    return "executed buffer in Blender"

def vim_run_selected_in_blender(selected_text):
    run_python_code('import bpy, os, sys\n' + selected_text)
    return "executed selection in Blender"

def run_python_code(code):
    f = tempfile.NamedTemporaryFile(delete=False)
    f.write(code+'\n')
    f.close()

    print f.name

    with open('/tmp/bpy_external.io', 'w') as io:
        io.write(f.name)
