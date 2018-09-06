local Sequence = require "../src/sequence"
local Matrix = require "../src/matrix"

describe("Matrix", function()

    describe("#create", function()
        context("when m = n", function()
            it("should create a new m by n matrix from the passed in sequence", function()
                local expectedMatrix = {
                    {1, 2, 3},
                    {4, 5, 6},
                    {7, 8, 9},
                    m = 3,
                    n = 3
                }
                local sequence = Sequence.create(9, function(n) return n end)
                local matrix = Matrix.create(3, 3, sequence)
                assert.are.same(expectedMatrix, matrix)
            end)
        end)

        context("when m < n", function()
            it("should create a new m by n matrix from the passed in sequence", function()
                local expectedMatrix = {
                    {1, 2, 3},
                    {4, 5, 6},
                    m = 2,
                    n = 3
                }
                local sequence = Sequence.create(6, function(n) return n end)
                local matrix = Matrix.create(2, 3, sequence)
                assert.are.same(expectedMatrix, matrix)
            end)
        end)

        context("when m > n", function()
            it("should create a new m by n matrix from the passed in sequence", function()
                local expectedMatrix = {
                    {1, 2},
                    {3, 4},
                    {5, 6},
                    m = 3,
                    n = 2
                }
                local sequence = Sequence.create(6, function(n) return n end)
                local matrix = Matrix.create(3, 2, sequence)
                assert.are.same(expectedMatrix, matrix)
            end)
        end)
    end)

    describe("#transpose", function()
        context("when given an m by n matrix where m = n", function()
            it("should transpose the matrix", function()
                local inputMatrix = {
                    {1, 2, 3},
                    {4, 5, 6},
                    {7, 8, 9},
                    m = 3,
                    n = 3
                }
                local expectedMatrix = {
                    {1, 4, 7},
                    {2, 5, 8},
                    {3, 6, 9},
                    m = 3,
                    n = 3
                }
                local transposedMatrix = Matrix.transpose(inputMatrix)
                assert.are.same(expectedMatrix, transposedMatrix)
            end)
        end)

        context("when given an m by n matrix where m < n", function()
            it("should transpose the matrix", function()
                local inputMatrix = {
                    {1, 2, 3},
                    {4, 5, 6},
                    m = 2,
                    n = 3
                }
                local expectedMatrix = {
                    {1, 4},
                    {2, 5},
                    {3, 6},
                    m = 3,
                    n = 2
                }
                local transposedMatrix = Matrix.transpose(inputMatrix)
                assert.are.same(expectedMatrix, transposedMatrix)
            end)
        end)

        context("when given an m by n matrix where m > n", function()
            it("should transpose the matrix", function()
                local inputMatrix = {
                    {1, 2},
                    {3, 4},
                    {5, 6},
                    m = 3,
                    n = 2
                }
                local expectedMatrix = {
                    {1, 3, 5},
                    {2, 4, 6},
                    m = 2,
                    n = 3
                }
                local transposedMatrix = Matrix.transpose(inputMatrix)
                assert.are.same(expectedMatrix, transposedMatrix)
            end)
        end)
    end)

    describe("#reverse", function()
        it("should return the given matrix's rows in reverse order", function()
            local inputMatrix = {
                {1, 2, 3},
                {4, 5, 6},
                {7, 8, 9},
                m = 3,
                n = 3
            }
            local expectedMatrix = {
                {7, 8, 9},
                {4, 5, 6},
                {1, 2, 3},
                m = 3,
                n = 3
            }
            local reversedMatrix = Matrix.reverse(inputMatrix)
            assert.are.same(expectedMatrix, reversedMatrix)
        end)
    end)

    describe("#shift", function()
        it("should remove the first row and return it alongside with the shifted matrix", function()
            local inputMatrix = {
                {1, 2, 3},
                {4, 5, 6},
                {7, 8, 9},
                m = 3,
                n = 3
            }
            local expectedMatrix = {
                {4, 5, 6},
                {7, 8, 9},
                m = 2,
                n = 3
            }
            local expectedRow = {1, 2, 3}
            local shiftedMatrix, firstRow = Matrix.shift(inputMatrix)
            assert.are.same(expectedMatrix, shiftedMatrix)
            assert.are.same(expectedRow, firstRow)
        end)
    end)

    describe("#rotate", function()
        it("should rotate the given matrix in a clockwise direction", function()
            local inputMatrix = {
                {1, 2, 3},
                {4, 5, 6},
                {7, 8, 9},
                m = 3,
                n = 3
            }
            local expectedMatrix = {
                {7, 4, 1},
                {8, 5, 2},
                {9, 6, 3},
                m = 3,
                n = 3
            }
            local rotatedMatrix = Matrix.rotate(inputMatrix)
            assert.are.same(expectedMatrix, rotatedMatrix)
        end)

        it("should rotate the passed in matrix in a counterclockwise direction", function()
            local inputMatrix = {
                {1, 2, 3},
                {4, 5, 6},
                {7, 8, 9},
                m = 3,
                n = 3
            }
            local expectedMatrix = {
                {3, 6, 9},
                {2, 5, 8},
                {1, 4, 7},
                m = 3,
                n = 3
            }
            local rotatedMatrix = Matrix.rotate(inputMatrix, -1)
            assert.are.same(expectedMatrix, rotatedMatrix)
        end)
    end)

end)