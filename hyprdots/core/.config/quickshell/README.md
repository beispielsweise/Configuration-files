# Quickshell Integration

## Known Issues/plans

__Notification__ No notification system, for now they are handeled by scripts (e.g. scripts/CaptureScreenshot.sh) with notify_send<br>
This will obviously be replaced at some point, the probem is, it requires an understanding of the system notification retrieving logic, not a priority for now. swaync is the last thing i'll change<br>
__Bar__ Placeholder implemented, will be expanded later.
__Custom themes__ Template and outline exists allready, not a priority. Hopefully i won't need to rewrite this :)<br>
__Window navigation__ Example implemented for ScreenshotWindow using Shortcut and CustomButton<br>

## Tree explained below

### Appearance

#### Themes

Contains templates for themes, a feature to load those will be added later, when the palette and properties are defined

#### Theme.qml

Holds all color properties, module properties etc. that will be added to a .json theme

#### ThemeManager.qml

Responsible for loading and parsing .json themes (Template)

### Modules

Contains reusable modules, such as custom buttons, lables, pages, sliders etc (will be expanded)<br>
General-use items that are _not_ Window or Component specific are kept in the main directory, window-specific pages will be kept in subdirectories

### Services

### QS

General Quickshell services, that do not interact with the system

#### Bootstrap

__IPCRouter__ Contains a IPC handler for functions* that are exposed for the user to bind via ```qs ipc call <component> <function>```<br> Will be expended in the future. <br>
__InitializeWindowInstance__ Initiizes Bar instance(required for lazy loader to work), LazyLoads every other window to free up RAM<br><br>

#### States

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
1. Mason install ```qmlls```
2. Add: 
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
3. Optionally add this block before mason_lspconfig.setup()
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
3. create .qmlls.ini file if not exists
4. Autocomplete should work now. Sometimes it refreshes rather funky, a nvim restart may be needed
