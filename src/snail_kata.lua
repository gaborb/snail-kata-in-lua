local Array = require "../src/array"
local Matrix = require "../src/matrix"

local SnailKata = {}

function SnailKata.traverse(matrix)
    local ret, row = {}
    while (#matrix > 0) do
        matrix, row = Matrix.shift(matrix)
        table.insert(ret, row)
        if (#matrix > 0) then
            matrix = Matrix.rotate(matrix, -1)
        end
    end
    return Array.flatten(ret)
end

return SnailKata