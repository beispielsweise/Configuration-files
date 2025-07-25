# Debugging setup
For debugging setup ```codelldb``` needs to be installed under .local/bin<br>
```lldb gdb``` are required

## Lsp/mason
```npm node python3-pip cargo``` should be installed for it to work

## Telescope.nvim
This plugin needs to be compiled manually <br>
```gcc clang make``` are required <br>
Navigate to ```~/.local/share/nvim/lazy/telescope-fzf-native.nvim``` and run ```make``` <br>
If make doesn't work, you may also try ```cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build``` <br>

## VsCode integration:
This setup has a separate directory to manage vscode keybinds. To improver user experience in vscode, the following additional settings may be used:
Additional keybinds: <br>
```
    {
      "key": "space e",
      "command": "workbench.action.focusActiveEditorGroup",
      "when": "!editorFocus"
    }
```
Additional settings: <br>
```
{
  "extensions.experimental.affinity": {
    "asvetliakov.vscode-neovim": 1
  },
  "vscode-neovim.neovimExecutablePaths.linux": "/usr/bin/nvim",
  "zenMode.centerLayout": false,
  "zenMode.hideLineNumbers": false,
  "zenMode.showTabs": "single",
  "zenMode.fullScreen": false,
  "editor.lineNumbers": "relative",
  "editor.cursorSurroundingLines": 35,
  "editor.cursorSurroundingLinesStyle": "all",
}
```
