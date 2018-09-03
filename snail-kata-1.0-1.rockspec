package = "SnailKata"
version = "1.0-1"
source = {
   url = "git@github.com:gaborb/snail-kata-in-lua.git",
   tag = "v1.0",
}
description = {
   summary = "Snail kata",
   detailed = [[
      Given an n x n array, return the array elements arranged from outermost elements to the middle element, traveling clockwise.
   ]],
   homepage = "https://github.com/gaborb/snail-kata-in-lua",
   license = "MIT/X11"
}
dependencies = {
   "lua >= 5.3",
   "busted >= 2.0.rc12"
}
build = {
   type = "builtin",
   modules = {
      snail_kata = "src/snail_kata.lua",
      matrix = "src/matrix.lua",
      sequence = "src/sequence.lua",
      array = "src/array.lua",
   }
}