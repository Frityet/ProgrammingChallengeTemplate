-- Copyright (C) 2023 Amrit Bhogal
--
-- This file is part of Pro-g-rammingChallenges.
--
-- Pro-g-rammingChallenges is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- Pro-g-rammingChallenges is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Pro-g-rammingChallenges.  If not, see <http://www.gnu.org/licenses/>.

---@param prompt string
---@return string
local function prompt(prompt)
    io.write("\x1b[33m"..prompt.."\x1b[0m ")
    return io.read("l")
end

---@param prog string
---@parma ... string
local function exec(prog, ...)
    local cmd = prog
    for _, v in ipairs({...}) do
        cmd = cmd.." "..v
    end
    print("$ \x1b[36m"..cmd.."\x1b[0m")
    if prompt("Are you sure you want to execute this command? [y/N]"):sub(1, 1):lower() ~= "y" then
        print("\x1b[32mAborting!\x1b[0m")
        return
    end
    if not os.execute(cmd) then
        print("\x1b[31mFailed to execute command!\x1b[0m")
        return exec(prompt("Please enter the correct command\n> "))
    end
end

---@type { [string] : fun(name: string) }
local LANGUAGES = {
    ["C"] = function()
        exec("xmake", "create", "-l", "c", "-P", ".")
    end,
    ["C++"] = function()
        exec("xmake", "create", "-l", "c++", "-P", ".")
    end,
    ["Objective-C"] = function()
        exec("xmake", "create", "-l", "c++", "-P", ".")
    end,
    ["Java"] = function()
        exec("gradle", "init", "--type", "java-application")
    end,
    ["Python"] = function()
        exec("python3", "-m", "venv", "venv")
    end,
    ["Ruby"] = function()
        exec("bundle", "init")
    end,
    ["Perl"] = function()
        exec("cpanm", "--init")
    end,
    ["PHP"] = function()
        exec("composer", "init", "--type", "project")
    end,
    ["JavaScript"] = function()
        exec("npm", "init")
    end,
    ["Typescript"] = function()
        exec("npm", "init")
        exec("npm", "install", "--save-dev", "typescript")
        exec("npx", "tsc", "--init")
    end,
    ["C#"] = function()
        exec("dotnet", "new", "console")
    end,
    ["Go"] = function()
        exec("go", "mod", "init")
    end,
    ["Rust"] = function(name)
        exec("cargo", "init", "--name", name)
    end,
    ["Haskell"] = function()
        exec("cabal", "init")
    end,
    ["Scala"] = function()
        exec("sbt", "new", "scala/scala-seed.g8")
    end,
    ["Erlang"] = function()
        exec("rebar3", "new", "app", "name=.")
    end,
    ["Elixir"] = function()
        exec("mix", "new", ".")
    end,
    ["Lua"] = function(name)
        local lua_ver = prompt("Lua version [5.1/5.2/5.3/5.4]:")
        if lua_ver ~= "5.1" and lua_ver ~= "5.2" and lua_ver ~= "5.3" and lua_ver ~= "5.4" then
            error("\x1b[31mInvalid Lua version \""..lua_ver.."\"\x1b[0m")
        end

        exec("luarocks", "init", "--lua-version", lua_ver, "--lua-version", lua_ver, "--license=\"GNU GPLv3\"", name)
    end,
    ["Teal"] = function (name)
        local lua_ver = prompt("Lua version [5.1/5.2/5.3/5.4]:")
        if lua_ver ~= "5.1" and lua_ver ~= "5.2" and lua_ver ~= "5.3" and lua_ver ~= "5.4" then
            error("\x1b[31mInvalid Lua version \""..lua_ver.."\"\x1b[0m")
        end

        exec("luarocks", "--lua-version", lua_ver, "init", "--lua-version", lua_ver, "--license=\"GNU GPLv3\"", name)
        exec("./luarocks", "install", "cyan")
        exec("./lua_modules/bin/cyan", "init")
    end,
    ["OCaml"] = function()
        exec("opam", "init", "--bare")
    end,
    ["F#"] = function()
        exec("dotnet", "new", "console", "--language", "F#")
    end,
    ["Swift"] = function()
        exec("swift", "package", "init", "--type", "executable")
    end,
    ["Kotlin"] = function()
        exec("gradle", "init", "--type", "kotlin-application")
    end,
    ["Crystal"] = function()
        exec("crystal", "init", "app")
    end,
    ["Julia"] = function()
        exec("julia", "-e", "using Pkg; Pkg.generate(\".\")")
    end,
    ["Zig"] = function()
        exec("zig", "init-exe")
    end,
    ["Nim"] = function()
        exec("nimble", "init")
    end,
    ["D"] = function()
        exec("dub", "init", "app", "--type", "minimal")
    end,

    ["Pascal"] = function ()

    end,

    ["FORTRAN"] = function (name)
        exec("fpm", "new", name)
    end,


    ["Ada"] = function (name)
        exec("gpr", "create", name)
    end,

    ["COBOL"] = function (name)
        exec("cobc", "-x", "-free", "-o", name, name..".cob")
    end,

    ["Scheme"] = function (name)
        exec("guile", "-c", "(use-modules (ice-9 reporter)) (use-modules (ice-9 ftw)) (mkdir \"src\") (mkdir \"test\") (mkdir \"doc\") (mkdir \"build\") (mkdir \"dist\") (mkdir \"lib\") (mkdir \"bin\") (mkdir \"include\") (mkdir \"share\") (mkdir \"data\") (mkdir \"tmp\") (mkdir \"log\") (mkdir \"conf\") (mkdir \"src/"..name.."\") (mkdir \"test/"..name.."\") (mkdir \"doc/"..name.."\") (mkdir \"build/"..name.."\") (mkdir \"dist/"..name.."\") (mkdir \"lib/"..name.."\") (mkdir \"bin/"..name.."\") (mkdir \"include/"..name.."\") (mkdir \"share/"..name.."\") (mkdir \"data/"..name.."\") (mkdir \"tmp/"..name.."\") (mkdir \"log/"..name.."\") (mkdir \"conf/"..name.."\") (call-with-output-file \"src/"..name.."/main.scm\" (lambda (port) (display \"(display \\\"Hello, World!\\\")\") (newline port)))")
    end,

    ["R"] = function (name)
        exec("Rscript", "-e", "package.skeleton(name = \""..name.."\", code_files = \"main.R\")")
    end,

    ["Prolog"] = function (name)
        exec("swipl", "-g", "initialization(pack_install(http(main)), install), halt", "-t", "halt")
    end,

    ["Lisp"] = function (name)
        exec("sbcl", "--eval", "(ql:quickload :cl-project-template)", "--eval", "(cl-project-template:make-project :name \""..name.."\")", "--eval", "(quit)")
    end,

    ["Clojure"] = function (name)
        exec("lein", "new", "app", name)
    end,

    ["Groovy"] = function()
        exec("gradle", "init", "--type", "groovy-application")
    end,

    ["Dart"] = function()
        exec("dart", "create")
    end,

    ["Elm"] = function()
        exec("elm", "init")
    end,

    ["PureScript"] = function()
        exec("spago", "init")
    end,

    ["Haxe"] = function()
        exec("haxelib", "newrepo")
    end,

    ["CoffeeScript"] = function()
        exec("npm", "init")
        exec("npm", "install", "--save-dev", "coffeescript")
    end,

    ["Shell Scripting (sh, ksh, zsh)"] = function()
        -- Create a new shell script file with executable permissions
        local script_name = "myscript.sh"
        local file = assert(io.open(script_name, "w"))
        file:write("#!/bin/sh\n\n")
        file:close()
        os.execute("chmod +x " .. script_name)
    end,

    ["Tcl"] = function()
        -- Create a new Tcl script file with executable permissions
        local script_name = "myscript.tcl"
        local file = assert(io.open(script_name, "w"))
        file:write("#!/usr/bin/env tclsh\n\n")
        file:close()
        os.execute("chmod +x " .. script_name)
    end,

    ["Vala"] = function()
        exec("meson", "init", "--language", "vala")
    end,

    ["AssemblyScript (WebAssembly)"] = function()
        exec("npm", "init")
        exec("npm", "install", "--save-dev", "assemblyscript")
        exec("npx", "asc", "init")
    end,

}

return LANGUAGES
