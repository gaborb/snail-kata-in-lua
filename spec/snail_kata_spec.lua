local Sequence = require "../src/sequence"
local Matrix = require "../src/matrix"
local SnailKata = require "../src/snail_kata"

describe("SnailKata", function()

    describe("#traverse", function()

        it("should traverse the matrix in a clockwise snailshell pattern", function()
            local expectedTraverse = { 1, 2, 3, 6, 9, 8, 7, 4, 5 }
            local sequence = Sequence.create(9, function(n) return n end)
            local matrix = Matrix.create(3, 3, sequence)
            local traverse = SnailKata.traverse(matrix)
            assert.are.same(expectedTraverse, traverse)
        end)
    
    end)
    
end)