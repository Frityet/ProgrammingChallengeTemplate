#!/usr/bin/env lua

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


local lfs = require("lfs")
local languages = require("languages")
local challenges = require("challenges")

-- TODO
-- local pprint = require("pprint")
-- local db_path = lfs.currentdir().."/db.lua"

-- ---@class Statistics
-- ---@field points integer
-- ---@field completed_projects Challenge[]
-- local stat = {}
-- if lfs.attributes(db_path) then
--     stat = dofile(db_path)
-- else
--     local f, msg = io.open(db_path)
--     if not f then
--         print("\x1b[31mCannot create database file at \""..db_path.."\"! Reason: "..msg)
--     else
--         f:write("return ", pprint.pformat {})
--         f:close()
--     end
-- end

math.randomseed(os.time())


---@param prompt string
---@return string
local function prompt(prompt)
    io.write("\x1b[33m"..prompt.."\x1b[0m ")
    return io.read("l")
end

---@param diff Challenge.Difficulty
---@return string
local function diff_to_str(diff)
    if diff == "Easy" then return "\x1b[32m"..diff.."\x1b[0m"
    elseif diff == "Medium" then return "\x1b[33m"..diff.."\x1b[0m"
    elseif diff == "Difficult" then return "\x1b[31m"..diff.."\x1b[0m"
    else return "\x1b[35m"..diff.."\x1b[0m" end
end

---@type string[]
local langnames do
    langnames = {}
    for l in pairs(languages) do langnames[#langnames+1] = l end
end

---@type string[]
local challengenames do
    challengenames = {}

    for c in pairs(challenges.challenges) do challengenames[#challengenames+1] = c end
end

repeat
    local challenge = challengenames[math.random(1, #challengenames)]
    local language = langnames[math.random(1, #langnames)]

    local cinfo = challenges.challenges[challenge]

    print("Project \x1b[34m"..challenge.." \x1b[0min \x1b[35m"..language.."\x1b[0m")
    print("Difficulty: "..diff_to_str(cinfo.difficulty))

    if #cinfo.requirements ~= 0 then
        print("Requirements:\x1b[0m")
        for _, req in ipairs(cinfo.requirements) do
            print("\t- \x1b[34m"..req.."\x1b[0m")
        end
    end

    local pointc = challenges.difficulty_points[cinfo.difficulty]
    if cinfo.bonuses ~= nil then
        print("\x1b[32mBonuses:\x1b[0m")
        for name, points in pairs(cinfo.bonuses) do
            print(string.format("\t- \x1b[34m\"%s\" \x1b[0mfor \x1b[32m%d points!\x1b[0m", name, points))
            pointc = pointc + points
        end
    end

    if cinfo.note ~= nil then
        print("\x1b[33mNote: "..cinfo.note.."\x1b[0m")
    end

    print("In total, \x1b[32m"..pointc.." points \x1b[0mcan be gained!")

    local answer = prompt("Create project? [Y/n/l (different language)]"):sub(1, 1):lower()

    if answer == "l" then
        repeat
            ::start::
            local newl = prompt("New language/random/list:")
            if newl == "list" then
                print("Languages:")
                for _, lang in ipairs(langnames) do
                    print("\t- \x1b[34m"..lang.."\x1b[0m")
                end

                goto start
            end
            if newl == "random" then
                language = langnames[math.random(1, #langnames)]
                local ok = prompt("New language: \x1b[35m"..language.."\x1b[0m. \x1b[33mOK? [Y/n]\x1b[0m"):sub(1, 1):lower()
                if ok == "n" then goto start end

                answer = "y"
                break
            elseif languages[newl] then
                language = newl
                break
            else print("\x1b[31mInvalid language \""..newl.."\"\x1b[0m") end
        until false
    end

    if answer == "y" or answer == "" then
        ---@type string
        local name = challenge

        local cwd = lfs.currentdir()
        local dirname = string.format("%s/%s/", cwd, name)
        lfs.mkdir(dirname)
        do
            lfs.chdir(dirname)

            languages[language](name)

            lfs.chdir(cwd)
        end

        print("\x1b[32mProject created at \x1b[35m"..dirname.."\x1b[0m")
        break
    else print(string.rep('-', 80)) end
until false
