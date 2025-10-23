--[[

Author: William Steven (Anon-404)
File: keymaps.lua
Description: Run current file (<leader>r) — supports 50+ languages
For: Neovim (Lua configuration)

]]--

local function run_file()
  local file = vim.fn.expand("%:p")
  local ext = vim.fn.expand("%:e")
  local name = vim.fn.expand("%:t:r")
  local cmd = ""

  local runners = {
    py = "python3 " .. file,
    c = string.format("gcc %s -o %s && ./%s", file, name, name),
    cpp = string.format("g++ %s -o %s && ./%s", file, name, name),
    java = string.format("javac %s && java %s", file, name),
    js = "node " .. file,
    ts = "ts-node " .. file,
    php = "php " .. file,
    pl = "perl " .. file,
    p6 = "perl6 " .. file,
    rb = "ruby " .. file,
    go = "go run " .. file,
    lua = "lua " .. file,
    kt = string.format("kotlinc %s -include-runtime -d %s.jar && java -jar %s.jar", file, name, name),
    groovy = "groovy " .. file,
    ps1 = "pwsh " .. file,
    bat = file,
    cmd = file,
    sh = "bash " .. file,
    fsx = "dotnet fsi " .. file,
    fs = string.format("dotnet run --project %s", name),
    csx = "dotnet script " .. file,
    cs = string.format("mcs %s && mono %s.exe", file, name),
    vbs = "cscript //nologo " .. file,
    coffee = "coffee " .. file,
    scala = "scala " .. file,
    swift = "swift " .. file,
    jl = "julia " .. file,
    cr = string.format("crystal run %s", file),
    ml = string.format("ocaml %s", file),
    r = "Rscript " .. file,
    applescript = "osascript " .. file,
    exs = "elixir " .. file,
    vb = string.format("vbc %s && mono %s.exe", file, name),
    clj = "clojure " .. file,
    hx = "haxe " .. file,
    m = "clang %s -o %s && ./%s" .. file,
    rs = string.format("rustc %s -o %s && ./%s", file, name, name),
    rkt = "racket " .. file,
    scm = "scheme --script " .. file,
    ahk = "autohotkey " .. file,
    au3 = "autoit3 " .. file,
    dart = "dart " .. file,
    pas = string.format("fpc %s && ./%s", file, name),
    hs = "runhaskell " .. file,
    nim = "nim compile --run " .. file,
    d = "ldc2 -run " .. file,
    lisp = "sbcl --script " .. file,
    kit = "kitc run " .. file,
    v = "v run " .. file,
    scss = "sass " .. file,
    sass = "sass " .. file,
    cuda = string.format("nvcc %s -o %s && ./%s", file, name, name),
    less = "lessc " .. file,
    f90 = string.format("gfortran %s -o %s && ./%s", file, name, name),
    ring = "ring " .. file,
    sml = "sml " .. file,
    zig = "zig run " .. file,
    mojo = "mojo run " .. file,
    erl = "erl -noshell -s " .. name .. " start -s init stop",
    spwn = "spwn run " .. file,
    pkl = "pkl eval " .. file,
    gleam = "gleam run",
  }

  cmd = runners[ext]

  if not cmd then
    print("❌ Unknown file type: " .. ext)
    return
  end

  vim.cmd("split term://" .. cmd)
end

vim.keymap.set("n", "<leader>r", run_file, { desc = "Run current file" })
