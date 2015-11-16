# vim-run-in-blender

If you use Python and pby in Blender to develop addon's and like to use Vim as
script editor.

## Requirements

You need Blender of course. https://www.blender.org

In Blender install the add-on bpy_externall, activate it and start the listener
See https://github.com/zeffii/bpy_externall

For now you need a posix machine e.g. OSX or Linux.

## Installation

See https://github.com/zeffii/bpy_externall for instructions how to
install bpy_externall.

Use your plugin manager of choice.

- [Pathogen](https://github.com/tpope/vim-pathogen)
  - `git clone https://github.com/mipmip/vim-run-in-blender ~/.vim/bundle/vim-run-in-blender`
- [Vundle](https://github.com/gmarik/vundle)
  - Add `Bundle 'https://github.com/mipmip/vim-run-in-blender'` to .vimrc
  - Run `:BundleInstall`
- [NeoBundle](https://github.com/Shougo/neobundle.vim)
  - Add `NeoBundle 'https://github.com/mipmip/vim-run-in-blender'` to .vimrc
  - Run `:NeoBundleInstall`
- [vim-plug](https://github.com/junegunn/vim-plug)
  - Add `Plug 'https://github.com/mipmip/vim-run-in-blender'` to .vimrc
  - Run `:PlugInstall`

## Usage

Map the functions below.

```:RunInBlender``` to run the complete buffer contents in Blender.

```:'<,'>RunSelectionInBlender``` to run the current visual selection

## TODO

- testing
- improve output
