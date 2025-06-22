## Debugging setup
For debugging setup ```codelldb``` needs to be installed under .local/bin
```lldb, codelldb, gdb``` are required

## Lsp/mason
```npm node python3-pip cargo``` should be installed for it to work

## Telescope.nvim
This plugin needs to be compiled manually 
```gcc, clang, make``` are required
Navigate to ```~/.local/share/nvim/lazy/telescope-fzf-native.nvim``` and run ```make``` 
If make doesn't work, you may also try ```cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build```
