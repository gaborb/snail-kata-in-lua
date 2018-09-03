local Array = require "../src/array"

local Matrix = {}

function Matrix.create(m, n, sequence)
    local ret = {}
    for i = 1, m do
        ret[i] = {}
        for j = 1, n do
            ret[i][j] = sequence[(i - 1) * n + j]
        end
    end
    ret.m = m
    ret.n = n
    return ret
end

function Matrix.transpose(matrix)
    local ret = {}
    for i = 1, matrix.n do
        ret[i] = {}
        for j = 1, matrix.m do
            ret[i][j] = matrix[j][i]
        end
    end
    ret.m = matrix.n
    ret.n = matrix.m
    return ret
end

function Matrix.reverse(matrix)
    local ret = {}
    for i = 1, matrix.m do
        ret[i] = matrix[matrix.m + 1 - i]
    end
    ret.m = matrix.m
    ret.n = matrix.n
    return ret
end

function Matrix.shift(matrix)
    local ret, row = Array.shift(matrix)
    ret.m = matrix.m - 1
    ret.n = matrix.n
    return ret, row
end

function Matrix.rotate(matrix, delta)
    local ret, delta = {}, delta or 1
    if delta > 0 then
        ret = Matrix.transpose(Matrix.reverse(matrix))
    else
        ret = Matrix.reverse(Matrix.transpose(matrix))
    end
    return ret
end

return Matrix