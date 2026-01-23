# Quickshell Integration

## Tree explained below

### Appearance

A general-purpose directory with appearance-related files (not defined)

### Modules

Contains reusable modules, such as custom buttons, lables, pages, sliders etc (will be expanded)<br>
General-use items that are _not_ Window or Component specific are kept in the main directory, window-specific pages will be kept in subdirectories

### Services

### QS

General Quickshell services, that do not interact with the system

#### IPC

Contains a handler for functions* that are exposed for the user to bind via ```qs ipc call <component> <function>```
Will be expended in the future. 

#### States

__GlobalStates__ tracks current visibility stat of each window/component, as well as defines default visibility
__GlobalStatesController__ defines functions* that are changing data defined in __GlobalStates__. They are normally exposed to the user and are reused in IPCRouter.qml
__InitializeWindowInstance__ will probably be moved, initializes WIndows and components (bars, docks, menus etc) to be used later.

### System

System servicies that launch scripts, retrieve system data and generally are not QS specific

### Windows

Contains files that use abovementioned __Modules__ to piece a window, a bar or a dock together. 

### Shell.qml

Launches the app, initializes IPC and Components

# Autocompletion neovim setup:
1. Mason install ```qmlls```
2. Add: <br>
```
            ["qmlls"] = function()
                lspconfig.qmlls.setup({
                    cmd = {
                        "qmlls",
                        "-E", "/usr/lib/qt6/qml",
                    },

                    root_dir = util.root_pattern(".qmlls.ini", "shell.qml", ".git"),

                    single_file_support = true,
                })
            end,
```
to the lspconfig file. (adjust if needed)
3. create .qmlls.ini file if not exists
4. Autocomplete should work now. SOmetimes it refreshes rather funky, a nvim restart may be needed
