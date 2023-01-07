-- Importing the Operating System library for file manuipulation
require"os"

print("PREPROCESSING")

-- Path to the intermediate directory that will be modified
local distDir = "../dist"

-- List of unnecessary files to clean up before building
local blacklist = {
    ".vscode",
    "preprocessor.lua"
}

-- Cleanup loop
for _, item in pairs(blacklist) do
    print("Removing "..item.."...")
    -- Removing the file/directory with "rm" system command
    os.execute("rm -r "..distDir.."/"..item)
end
