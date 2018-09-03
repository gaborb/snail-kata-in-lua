local Sequence = {}

function Sequence.create(count, callback)
    local ret = {}
    for i = 1, count do
        ret[i] = callback(i)
    end
    ret.n = count
    return ret
end

return Sequence