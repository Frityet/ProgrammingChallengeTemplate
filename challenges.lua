---@alias Challenge.Difficulty
---| "Easy"
---| "Medium"
---| "Difficult"
---| "Fuck You"

---@type { [Challenge.Difficulty] : integer }
local DIFFICULITY_POINTS = {
    ["Easy"]        = 100,
    ["Medium"]      = 250,
    ["Difficult"]   = 500,
    ["Fuck You"]    = 1000
}

---@class Challenge
---@field difficulty Challenge.Difficulty
---@field requirements string[]
---@field bonuses { [string] : integer }?
---@field note string?

---@type { [string] : Challenge }
local CHALLENGES = {
    --#region Column 1
    ["Download Manager"] = {
        difficulty = "Medium",

        requirements = {
            "Can download large files (2GB+)"
        },

        bonuses = {
            ["Multi-threading"] = 50,
        }
    },

    ["Elastic producer/consumer task queue"] = {
        difficulty = "Medium",
        requirements = {

        }
    },

    ["IRC Client"] = {
        difficulty = "Medium",
        note = "IRC is a chat protocol, old boomer stuff",
        requirements = {
            "Bare minimum protocol compatability"
        }
    },

    ["Markov Chain Sentence Generator"] = {
        difficulty = "Easy",
        bonuses = {
            ["Shitposting Capabilities"] = 35, --extra points
        },
        requirements = {},
        note = [[Markov chain or Markov process is a stochastic model describing a sequence of possible events in which the probability of each event depends only on the state attained in the previous event
https://en.wikipedia.org/wiki/Markov_chain]]
    },

    ["English sentence parser"] = {
        difficulty = "Medium",
        requirements = {
            "Can parse simple sentences"
        },
        bonuses = {
            ["Points to the context of a sentence"] = 50,
            ["Parse the entire Bee Movie script"] = 100
        }
    },

    ["MIDI Player + Editor"] = {
        difficulty = "Medium",
        requirements = {
            "Can play and edit MIDI files"
        },

        bonuses = {
            ["Real-time"] = 150,
            ["GUI"] = 250
        }
    },

    ["Stock Market Simulator"] = {
        difficulty = "Medium",
        requirements = {

        },

        bonuses = {
            ["GUI"] = 150
        }
    },

    ["Parametric/Graphic Equalizer"] = {
        difficulty = "Difficult",
        requirements = {

        },

        bonuses = {
            ["Real-time"] = 200
        }
    },

    ["Graphing Calculator"] = {
        difficulty = "Medium",
        requirements = {
            "Can graph simple functions"
        },

        bonuses = {
            ["Graph the function's derivitives"] = 50,
            ["Make it 3D"] = 100
        },
    },

    ["Todo List Application"] = {
        difficulty = "Easy",
        requirements = {
            "Can add, remove, and edit tasks",
            "Tasks are serialised"
        },
    },

    ["Verlet Integration"] = {
        difficulty = "Difficult",
        requirements = {
            "Can simulate a ball bouncing on a surface (???)"
        },
        note = "Verlet integration is a numerical method used to integrate Newton's equations of motion. It is frequently used to calculate trajectories of particles in molecular dynamics simulations and computer graphics."
    },

    ["TCP/UDP Chat Server + Client"] = {
        difficulty = "Medium",
        requirements = {
            "Can send and receive messages of infinite length"
        },

        bonuses = {
            ["Encryption"] = 100,
        }
    },

    ["Music Streaming"] = {
        difficulty = "Difficult",

        requirements = {
            "Can stream music in real-time"
        },
    },

    ["Shazam"] = {
        difficulty = "Medium",
        requirements = {
            "Can identify a song from a 10 second clip"
        },
        note = "The music thingy, where it can detect music and tell you the name"
    },

    ["Chatbot"] = {
        difficulty = "Easy",
        requirements = {
            "Can respond to simple questions"
        },
        bonuses = {
            ["Conversation retention"] = 25,
            ["Turing test"] = 1000
        }
    },

    ["Curses Text Editor"] = {
        difficulty = "Medium",
        requirements = {
            "Can open, edit, and save files"
        },
        bonuses = {
            ["Syntax Highlighting"] = 50,
            ["Emacs/Vim keybindings"] = 50
        }
    },

    ["Paint clone"] = {
        difficulty = "Medium",
        requirements = {
            "Can draw pixels, lines, rectangles, and circles"
        },
        bonuses = {
            ["Layers"] = 50,
            ["Filters"] = 75,
            ["Export to PNG"] = 150
        }
    },

    ["Image to ASCII"] = {
        difficulty = "Easy", --wtf why
        requirements = {
            "Can convert an image (BMP) to ASCII art"
        },
        bonuses = {
            ["Color"] = 25,
            ["Unicode"] = 50,
            ["Other image formats"] = 100
        }
    },

    ["Booru Image Downloader"] = {
        difficulty = "Medium",
        requirements = {

        },
        note = "Booru is an image board (https://booru.org/top)"
    },

    ["Image Converter"] = {
        difficulty = "Medium",
        requirements = {
            "Can convert between BMP, PNG, and JPEG"
        },

        bonuses = {
            ["Other formats"] = 50
        }
    },

    ["ID3 Reader"] = {
        difficulty = "Medium",
        requirements = {
        },
        note = "I *think* this means the ID3 algorithm which is used to generate a decision tree"
    },

    ["Sound Synthesis"] = {
        difficulty = "Difficult",
        requirements = {
            "Can generate a simple sound"
        },
        bonuses = {
            ["Realtime MIDI playback with custom instruments"] = DIFFICULITY_POINTS["Fuck You"]
        }
    },

    ["C++ IDE Plugin"] = {
        difficulty = "Medium",
        requirements = {
            "Auto Complete",
            "Go-To symbol declaration",
            "Syntax Highlighting"
        },

        bonuses = {
            ["Diagnostics"] = 100,
            ["Full language server"] = 250
        }
    },

    ["Version Control"] = {
        difficulty = "Medium",
        requirements = {
            "Checkout",
            "Commit (with message)",
            "Unlocking",
            "Per-file configuration of number of revisions kept"
        },
    },

    ["Imageboard"] = {
        difficulty = "Easy",
        requirements = {
            "Posting images",
        }
    },

    ["Password Manager"] = {
        difficulty = "Medium",
        requirements = {

        },

        bonuses = {
            ["Encryption"] = 150
        }
    },

    ["Torrent Client"] = {
        difficulty = "Difficult",
        requirements = {

        },
        bonuses = {
            ["GUI"] = 150,
            ["Encryption"] = 200
        }
    },

    ["Booru Client"] = {
        difficulty = "Difficult",
        requirements = {
            "Posting",
            "Reading",
            "Commenting",
            "Tagging",
            "Searching"
        }
    },

    ["Key Press Bot"] = {
        difficulty = "Medium",
        requirements = {
        }
    },

    ["IP/URL Obsucrification"] = {
        difficulty = "Medium",
        note = "http://www.pc-help.org/obscure.htm",
        requirements = {
        }
    },

    ["Radix Base Converter"] = {
        difficulty = "Medium",
        requirements = {
            "Given a radix base, convert it to a decimal"
        }
    },

    ["Chan aggregator"] = {
        difficulty = "Difficult",
        requirements = {
            "Can read posts from multiple chans"
        },
        bonuses = {
            ["4ChanX"] = 150,
            ["Archiving"] = 100
        }
    },

    ["File encryptor"] = {
        difficulty = "Medium",
        requirements = {
            "Can encrypt and decrypt files",
            "Can upload online"
        },
    },

    ["Text editor"] = {
        difficulty = "Difficult",
        requirements = {
            "Can open, edit, and save files",
            "Auotsaves and includes the date in the filename"
        },
    },

    ["HSV Colour Representation"] = {
        difficulty = "Easy",
        requirements = {}
    },

    ["Window Manager"] = {
        difficulty = "Medium",
        requirements = {
            "Can move and resize windows",
            "Can tile windows"
        },
    },

    ["Relational Database"] = {
        difficulty = "Fuck You",
        requirements = {
            "Efficent",
            "SQL support",
            "Handle relationships"
        }
    },

    ["Pixel Editor"] = {
        difficulty = "Medium",
        requirements = {

        }
    },

    ["Trivial File Transfer Protocol"] = {
        difficulty = "Medium",
        requirements = {
            "Client can put file on remote host"
        }
    },

    ["Markdown Editor"] = {
        difficulty = "Medium",
        requirements = {
            "Export to HTML"
        }
    },

    ["IP Tracking Visualization"] = {
        difficulty = "Medium",
        requirements = {

        }
    },

    ["Port Scanner"] = {
        difficulty = "Easy",
        requirements = {}
    },

    ["Old School Demo"] = {
        difficulty = "Easy",
        requirements = {
            "Plasma",
            "Tunnel",
            "Scrollers",
            "Zoomers"
        }
    },

    ["FizzBuzz"] = {
        difficulty = "Easy",
        requirements = {},
        bonuses = {
            ["Assembly"] = 100,
            ["SIMD"] = 150
        }
    },

    ["RPN Calculator"] = {
        difficulty = "Easy",
        requirements = {
            "Can add, subtract, multiply, and divide"
        },
        bonuses = {
            ["Trig functions"] = 50,
            ["Exponents"] = 50,
            ["Logarithms"] = 50,
            ["Factorials"] = 50,
            ["Complex numbers"] = 100
        }
    },

    ["Character counter"] = {
        difficulty = "Easy",
        requirements = {
            "Can count characters in a given string"
        },
        bonuses = {
            ["Unicode"] = 25
        }
    },

    --#endregion

    --#region Column 2

    ["Tower of Hanoi"] = {
        difficulty = "Easy",
        requirements = {

        },
        note = "https://en.wikipedia.org/wiki/Tower_of_Hanoi"
    },

    ["Music Visualiser"] = {
        difficulty = "Medium",
        requirements = {
            "Can visualise music"
        },
        bonuses = {
            ["3D"] = 150
        }
    },

    ["Unicode Converter"] = {
        difficulty = "Medium",
        requirements = {
            "UTF-8",
            "UTF-16LE + BE",
            "UTF-32LE + BE"
        }
    },

    ["First n digits of pi"] = {
        difficulty = "Easy",
        requirements = {
        },
    },

    ["Least Squares Fitting Algorithm"] = {
        difficulty = "Medium",
        requirements = {
            "Can fit a line to a set of points"
        },
        note = "https://en.wikipedia.org/wiki/Least_squares"
    },

    ["Stock Peak Value finder"] = {
        difficulty = "Easy",
        requirements = {
            "Given a list of stock prices over time, find the period of time where the socks could have made the most money"
        },
        bonuses = {
            ["Shorting"] = 50,
            ["Automatic scanning of the internet for stock prices"] = 100
        }
    },

    ["Highest Prime factor calculator"] = {
        difficulty = "Easy",
        requirements = {
            "Given a number, find the highest prime factor"
        },
    },

    ["Image data hide"] = {
        difficulty = "Medium",
        requirements = {
            "Can hide data in images",
            "Can extract data from images"
        },
        bonuses = {
            [".gif support"] = 100
        },

        note = "Basic steganography"
    },

    ["Web Page Crawler"] = {
        difficulty = "Medium",
        requirements = {
            "Can crawl a given web page and find all links"
        },
        bonuses = {
            ["Multithreaded"] = 100
        }
    },

    ["Password Generator"] = {
        difficulty = "Easy",
        requirements = {
            "Must generate a password from the user's specifications"
        }
    },

    ["Vinére cipher"] = {
        difficulty = "Medium",
        requirements = {
            "Encryption",
            "Decryption"
        },
    },

    ["Game of life"] = {
        difficulty = "Medium",
        requirements = {
        },
        note = "Not the board game! https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life"
    },

    ["Caesar cipher"] = {
        difficulty = "Easy",
        requirements = {
            "Encryption",
            "Decryption"
        },
        note = "Caesar cipher is a type of substitution cipher in which each letter in the plaintext is replaced by a letter some fixed number of positions down the alphabet.\nhttps://en.wikipedia.org/wiki/Caesar_cipher"
    },

    ["Dijktra's Algorithm"] = {
        difficulty = "Medium",
        requirements = {
            "Can find the shortest path between two points"
        },
        bonuses = {
            ["Multithreaded"] = 100,
            ["Visualisation"] = 150
        },
        note = "Dijkstra's Algorithm is a graph search algorithm that solves the single-source shortest path problem for a graph with non-negative edge path costs, producing a shortest path tree.\nhttps://en.wikipedia.org/wiki/Dijkstra%27s_algorithm"
    },

    ["ROT 13"] = {
        difficulty = "Easy",
        requirements = {
            "Encryption",
            "Decryption"
        },
        note = "Rot13 is a simple letter substitution cipher that replaces a letter with the 13th letter after it, in the alphabet.\nhttps://en.wikipedia.org/wiki/ROT13"
    },

    ["Master Boot Record Contents"] = {
        difficulty = "Medium",
        requirements = {
            "Can read the contents of the MBR and show it"
        },
    },

    ["Random Name Picker"] = {
        difficulty = "Medium",
        requirements = {
            "Can pick a random name from a list"
        },
    },

    ["Text Encryption"] = {
        difficulty = "Easy",
        requirements = {
            "Encryption",
            "Decryption"
        },
        note = "Pick one from http://rumkin.com/tools/cipher/collection"
    },

    ["Youtube to MP3"] = {
        difficulty = "Easy",
        requirements = {
            "Can download a youtube video and convert it to MP3"
        },
        bonuses = {
            ["Multithreaded"] = 100,
            ["Can download a playlist"] = 75,
            ["Full videos (MP4)"] = 150
        }
    },

    ["Text to hexadecimal"] = {
        difficulty = "Easy",
        requirements = {
            "Do not use built in language/library (i.e sprintf)",
            "Hexadecimal",
            "Binary"
        }
    },

    ["Caluclate the first 1000 digits of pi"] = {
        difficulty = "Medium",
        requirements = {
            "Must be done iteravley"
        }
    },

    ["Sierpinski Triangle"] = {
        difficulty = "Easy",
        requirements = {},
        note = "TODO" -- TODO
    },

    ["Mandlebrot"] = {
        difficulty = "Medium",
        requirements = {}
    },

    ["OpenAI Gym"] = {
        difficulty = "Difficult",
        requirements = {

        },
        note = "https://openai.com/research/openai-gym-beta"
    },

    ["AI for Roguelikes"] = {
        difficulty = "Medium",
        requirements = {}
    },

    ["Sudoku solver"] = {
        difficulty = "Medium",
        requirements = {
            "Use the A* algorithm"
        }
    },

    ["Connext 4 AI"] = {
        difficulty = "Medium",
        requirements = {
            "Alpha-Beta pruning"
        }
    },

    ["Basic Neural Network"] = {
        difficulty = "Easy",
        requirements = {
            "Simulate individual neurons and their connections"
        }
    },

    ["Real Neural Network"] = {
        difficulty = "Medium",
        requirements = {
            "Feed forward neural network using matrices for entire layers",
            "Matrix operations for computations"
        }
    },

    ["Convolutional Neural Network"] = {
        difficulty = "Medium",
        requirements = {
            "Convolutional N.N for handwritten digit correction",
            "Test on MNIST dataset"
        },

        bonuses = {
            ["No tensorflow"] = 150
        }
    },

    ["Virtual Machine"] = {
        difficulty = "Medium",
        requirements = {
            "Script that writes \"Hello, World\""
        }
    },

    ["Bootloader"] = {
        difficulty = "Fuck You",
        requirements = {
            "GDT",
            "Basic FS",
            "VGA",
            "Paging"
        },

        bonuses = {
            ["Extended file system"] = 250
        }
    },

    ["Shell"] = {
        difficulty = "Medium",
        requirements = {
            "Execute binaries",
            "Pipes",
            "Redirection",
            "History"
        },

        bonuses = {
            ["GUI"] = 150
        }
    },

    ["HTML + JS debugger"] = {
        difficulty = "Medium",
        requirements = {

        },
    },

    ["LISP"] = {
        difficulty = "Medium",
        requirements = {
            "Interpreter for a lisp-like language"
        },

        bonuses = {
            ["JIT"] = 250
        }
    },

    ["Filesystem mounter"] = {
        difficulty = "Difficult",
        requirements = {
            "Mount filesystems from other OSes using the FUSE model"
        }
    },

    ["Universal Asynchronous Receiver/Transmitter Game"] = {
        difficulty = "Medium",
        requirements = {},
        bonuses = {
            ["Assembly"] = 150
        }
    },

    ["UEFI Pong"] = {
        difficulty = "Difficult",
        requirements = {
            "Pong running as a UEFI application with colour"
        },
        note = "http://www.rodsbooks.com/efi-programming/index.html"
    },

    ["Esoteric Language"] = {
        difficulty = "Difficult",
        requirements = {
            "Be unique!"
        }
    },

    ["C Compiler"] = {
        difficulty = "Difficult",
        requirements = {
            "Fully C89 (ANSI) compliant"
        },

        bonuses = {
            ["C2x (or whatever is the most modern C version)"] = 100
        }
    },

    --Extension
    ["C++ Compiler"] = {
        difficulty = "Fuck You",
        requirements = {
            "C++98 compliant"
        },

        bonuses = {
            ["C++23 (or whatever is the latest)"] = 250
        }
    },

    ["Turing Machine Simulator"] = {
        difficulty = "Difficult",
        requirements = {}
    },

    ["Compiled Language REPL"] = {
        difficulty = "Difficult",
        requirements = {
            "Read",
            "Eval",
            "Print",
            "Loop"
        }
    },

    ["Static Website Generator"] = {
        difficulty = "Medium",
        requirements = {
            "Scriptable templates"
        },

    },

    ["Chip-8 Emulator"] = {
        difficulty = "Medium",
        requirements = {
            "Can run Chip-8 programs"
        },

        bonuses = {
            ["Cached Interpreter"] = 200,
            ["Dynamic Recompiler"] = 350
        }
    },

    ["Double Pendulum Simulation"] = {
        difficulty = "Medium",
        requirements = {

        }
    },

    --#endregion

    --#region Column 3

    ["Constructive Solid Geometry"] = {
        difficulty = "Medium",
        requirements = {}
    },

    ["Raytracer"] = {
        difficulty = "Difficult",
        requirements = {
            "Can raytrace a shiny ball with colour"
        },

        bonuses = {
            ["Real time"] = 200
        }
    },

    ["Complimentary Colour generator"] = {
        difficulty = "Easy",
        requirements = {}
    },

    ["5-Colour Scheme Generator"] = {
        difficulty = "Medium",
        requirements = {
            "Can generate 5-Colour scheme from the most domiant tones in any image"
        }
    },

    ["Genearl Labert's Problem Solver"] = {
        difficulty = "Fuck You",
        requirements = {},
        note = "At least it's not rocket science... Oh wait, it actually is"
    },

    ["TI-86 Emulator"] = {
        difficulty = "Difficult",
        requirements = {

        },
        bonuses = {
            ["Program Creation"] = 150
        }
    },

    ["N-Body Simulator"] = {
        difficulty = "Medium",
        requirements = {
            "Particles must have a certain mass and radius depending on the mass that merge if they collide"
        },
        bonuses = {
            ["GUI"] = 150
        }
    },

    ["Eulerian Path"] = {
        difficulty = "Easy",
        requirements = {

        },

    },

    ["Spinning 3D Cube"] = {
        difficulty = "Easy",
        requirements = {

        }
    },

    ["Cellular Textures"] = {
        difficulty = "Easy",
        requirements = {}
    },

    ["Knight's Tour"] = {
        difficulty = "Medium",
        requirements = {}
    },

    ["Monster Raising Simulator"] = {
        difficulty = "Difficult",
        requirements = {
            "Raising",
            "Breeding"
        },

        bonuses = {
            ["GUI"] = 150
        },
        note = "What the fuck lmao"
    },

    ["Tetris"] = {
        difficulty = "Medium",
        requirements = {

        },

        bonuses = {
            ["Bootloader tetris"] = 300
        }
    },

    ["Snake"] = {
        difficulty = "Easy",
        requirements = {},

        bonuses = {
            ["Bootloader snake"] = 200
        }
    },

    ["Pipe Dreams"] = {
        difficulty = "Medium",
        requirements = {}
    },

    ["Pac Man"] = {
        difficulty = "Medium",
        requirements = {
            "Different behaviours for each ghost"
        }
    },

    ["RPG Engine"] = {
        difficulty = "Difficult",
        requirements = {}
    },

    ["Rock Ppaer Scissors"] = {
        difficulty = "Easy",
        requirements = {
            "Rock",
            "Paper",
            "Scissors!"
        }
    },

    ["First Person Engine"] = {
        difficulty = "Difficult",
        requirements = {
            "Walking",
            "Looking Around",
            "Jumping on Obstacles"
        },

        bonuses = {
            ["VR"] = 400
        }
    },

    ["Shuffle a deck of cards"] = {
        difficulty = "Medium",
        requirements = {
            "Visualisation"
        }
    },

    ["Tag simulation"] = {
        difficulty = "Medium",
        requirements = {
            "Use a multi-agent system"
        }
    },

    ["Wolfenstine Clone"] = {
        difficulty = "Difficult",
        requirements = {
            "Two-dimensional map that appears to be 3D"
        }
    },

    ["Scorched Earth"] = {
        difficulty = "Medium",
        requirements = {}
    },

    ["Minesweeper"] = {
        difficulty = "Medium",
        requirements = {}
    },

    ["Auto-Visual 64KB Demonstration"] = {
        difficulty = "Medium",
        requirements = {}
    },

    ["Sudoku"] = {
        difficulty = "Medium",
        requirements = {}
    },

    ["Danmaku (Bullet Hell)"] = {
        difficulty = "Difficult",
        requirements = {}
    },

    ["Roguelike Engine"] = {
        difficulty = "Difficult",
        requirements = {
            "Dungeon generation"
        }
    },

    ["Game Engine"] = {
        difficulty = "Difficult",
        requirements = {

        },


    },

    ["Yahtzee"] = {
        difficulty = "Easy",
        requirements = {}
    },

    ["Oil Panic"] = {
        difficulty = "Easy",
        requirements = {}
    },

    ["Chess"] = {
        difficulty = "Medium",
        requirements = {

        }
    },

    ["Go (game)"] = {
        difficulty = "Difficult",
        requirements = {

        },

        bonuses = {
            ["AI"] = 200
        }
    },

    ["Connect 4"] = {
        difficulty = "Easy",
        requirements = {}
    },

    ["Mastermind"] = {
        difficulty = "Medium",
        requirements = {}
    },

    ["Missile Command"] = {
        difficulty = "Medium",
        requirements = {}
    },

    ["Tron"] = {
        difficulty = "Medium",
        requirements = {}
    },

    ["Breakout"] = {
        difficulty = "Medium",
        requirements = {}
    },

    ["Simon"] = {
        difficulty = "Easy",
        requirements = {}
    },

    ["Ulam Spiral"] = {
        difficulty = "Easy",
        requirements = {}
    },

    ["Bellman-Ford simulator"] = {
        difficulty = "Medium",
        requirements = {
            "At least 5 vertices"
        }
    },

    ["Matrix Arithmetic"] = {
        difficulty = "Medium",
        requirements = {
            "Add",
            "Subtract",
            "Multiply (Dot)"
        }
    },

    ["File Compressor"] = {
        difficulty = "Medium",
        requirements = {

        },

        bonuses = {
            ["GUI"] = 150
        }
    },

    ["PDF Tagger"] = {
        difficulty = "Easy",
        requirements = {}
    },

    ["Nonogram Generator and Solver"] = {
        difficulty = "Difficult",
        requirements = {}
    },

    ["Vector Arithmetic"] = {
        difficulty = "Medium",
        requirements = {
            "Dot",
            "Cross"
        }
    },

    ["Bismuth Fractal"] = {
        difficulty = "Medium",
        requirements = {}
    },

    ["Seam Carving"] = {
        difficulty = "Medium",
        requirements = {}
    },

    ["Bayesian Filter"] = {
        difficulty = "Medium",
        requirements = {}
    },

    ["WMS viewer"] = {
        difficulty = "Difficult",
        requirements = {
            "NOT web based"
        }
    },

    ["ASCII Digital Clock"] = {
        difficulty = "Easy",
        requirements = {
            "12 Hour time",
            "24 Hour time"
        }
    }

    --#endregion
}

return {
    difficulty_points = DIFFICULITY_POINTS,
    challenges = CHALLENGES
}
