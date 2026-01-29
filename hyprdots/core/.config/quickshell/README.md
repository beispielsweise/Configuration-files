# Quickshell Integration

## Known Issues/plans

__Notification__ No notification system, for now they are handeled by scripts (e.g. scripts/CaptureScreenshot.sh) with notify_send<br>
This will obviously be replaced at some point, the probem is, it requires an understanding of the system notification retrieving logic, not a priority for now. swaync is the last thing i'll change<br>
__Bar__ Placeholder implemented, will be expanded later.
__Custom themes__ Template and outline exists allready, not a priority. Hopefully i won't need to rewrite this :)<br>
__Window navigation__ Example implemented for ScreenshotWindow using Shortcut and CustomButton<br>

## Tree explained below

### Appearance

#### Colothemes

Contains colortheme presets to be loaded into Theme.colors

#### Presets

Contains window settings / hyprland settings? / widget positions for bar etc

#### Theme.qml

Holds all color properties, module properties etc. that will be added to a .json theme

#### ThemeManager.qml

Responsible for loading and parsing .json themes (Template)

### Modules

#### Common

Common reusable single elements (buttons, sliders, lables, etc)<br>
Window-specific ones will be separated into subdirectories

#### Shortcuts

Contains a reusable escape shortcut, probably wont be expanded

#### Windows

Contains templates for windows. Will contain pages for Settings window etc<br>
Example: MenuWindow - a reusable parent component to Suspend/Logout/Sleep/... menus. 

#### Widgets (TBD)

#### Pages (TBD)
 
### Services

### QS

General Quickshell services, that do not interact with the system

#### Bootstrap

__IPCRouter__ Contains a IPC handler for functions* that are exposed for the user to bind via ```qs ipc call <component> <function>```<br> Will be expended in the future. <br>
__InitializeWindowInstance__ Initiizes Bar instance(required for lazy loader to work), LazyLoads every other window to free up RAM<br><br>

#### States

__SystemInformation__ holds system-state variables, readonlys etc
__GlobalStates__ tracks current visibility stat of each window/component, as well as defines default visibility <br>
__GlobalStatesController__ defines functions* that are changing data defined in __GlobalStates__. They are normally exposed to the user and are reused in IPCRouter.qml <br>

### System

System servicies that launch scripts, retrieve system data and generally are not QS specific

### scripts

Bash scripts that are used by services

### Windows

Contains files that use abovementioned __Modules__ to piece a window, a bar or a dock together. 

### Shell.qml

Launches the app, initializes IPC and Components

# Autocompletion neovim setup:
1. Install ```sudo pacman -S --needed unixodbc```
2. Mason install ```qmlls```
3. Add: 
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
4. Optionally add this block before mason_lspconfig.setup()
```
        -- Attempt at supressing [missing-property] qmlls quickshell quirk
        do
            local orig = vim.lsp.handlers["textDocument/publishDiagnostics"]

            vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
                if result and result.diagnostics and ctx and ctx.client_id then
                    local client = vim.lsp.get_client_by_id(ctx.client_id)

                    -- Only filter qmlls
                    if client and client.name == "qmlls" then
                        result.diagnostics = vim.tbl_filter(function(diag)
                            -- This matches qmlls warnings like:
                            -- Member "paddingV" not found on type "QObject"
                            return not diag.message:match("missing%-property")
                        end, result.diagnostics)
                    end
                end

                return orig(err, result, ctx, config)
            end
        end
```
    This will supress the annoying [missing-property] false warning, but beware that now you won't know if you have incorrect variables
5. create .qmlls.ini file if not exists
6. Autocomplete should work now. Sometimes it refreshes rather funky, a nvim restart may be needed
