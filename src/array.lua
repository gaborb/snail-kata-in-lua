local Array = {}

function Array.shift(array)
    local ret, row = {}
    row = array[1]
    for i = 2, #array do
        ret[i - 1] = array[i]
    end
    return ret, row
end

function Array.flatten(array)
    local ret = {}
    local flatten
    flatten = function(arr)
        for _, v in ipairs(arr) do
            if type(v) == "table" then
                flatten(v)
            else
                table.insert(ret, v)
            end
        end        
    end
    flatten(array)
    return ret
end

return Array