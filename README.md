# lovepotion-3ds-tasks
Visual Studio Code automated tasks for building and deployment to the 3DS.

## Setup
**[IMPORTANT] Make sure you have Lua installed in your system for the preprocessor step to work.**

A typical directory structure when using LÖVEBrew looks like the following:
```
ProjectDirectory
├── GameDirectory
│   ├── conf.lua
│   └── main.lua
└── lovebrew.toml
```
When using Visual Studio Code, open your Game Directory as the project directory. 
After downloading this repo, copy `.vscode` and `preprocessor.lua` into Game Directory.
Then, copy the following settings from `lovebrew.toml` to `.vscode\settings.json`:

| lovebrew.toml | settings.json |
|--|--|
| `name= "SuperGame"` | `"LTasks.gameName" : "SuperGame"` |
| `source = "game"` | `"LTasks.sourceDir" : "game"` |
| `buildDir = "build"` | `"LTasks.buildDir" : "build"` |

Next, configure `LTasks.lua` in `settings.json` to point to the lua executable on your system (e.g. `C:\\Lua\\lua54.exe` on Windows or `/usr/local/bin/lua` on macOS/Linux) or lua command (just `lua` by default).
You can also change the intermediate building directory by changing `LTasks.distDir` (`dist` by default). This is the directory that the files are copied to before preprocessing.

## Preprocessor
**NOTE: Modification of `preprocessor.lua` is NOT fully fool-proof - it gives you freedom to do what you want. You should know what you're doing when modyfiing the file. I am NOT responsible if you clear your hard drive with a badly-written script.**

`preprocessor.lua` allows you to run any preprocessing you want on your project before building. This may include removing unnecessary files, such as Photoshop/GIMP project files, or swapping some code for its platform-specific counterpart. You can do anything as long as you can do it in Lua. Example commented code for removing chosen files is provided.

## Using
You can start using tasks by pressing the `F1` to bring up the global menu and then writing `task <Build:Rebuild:clean:Deploy>`
![image](https://user-images.githubusercontent.com/26334081/211161568-90dcfb99-bd86-47d2-8847-b492568da0f8.png)

| Task Name | Action |
|--|--|
| Build | Runs preprocessing and building of your game |
| clean | Runs `lovebrew clean` |
| Rebuild | Runs `lovebrew clean` and then preprocessing and building of your game |
| Deploy | Sends your built game to your 3DS via Homebrew Menu (more on that [here](https://github.com/devkitPro/3ds-hbmenu#netloader)) |

### Task Buttons
I strongly recommend using the [Task Buttons extension](https://marketplace.visualstudio.com/items?itemName=spencerwmiles.vscode-task-buttons) by spencerwmiles. This gives you four convenient buttons on the bottom of your editor that launch the tasks for you.

![image](https://user-images.githubusercontent.com/26334081/211162008-c60efd83-362f-4b94-94e6-61ff659969a4.png)
