local Array = require "../src/array"

describe("Array", function()

    describe("#shift", function()
        
        it("should remove the first element and return it alongside with the shifted array", function()
            local inputArray = { 1, 2, 3 }
            local expectedArray = { 2, 3 }
            local expectedElement = 1
            local shiftedArray, firstElement = Array.shift(inputArray)
            assert.are.same(expectedArray, shiftedArray)
            assert.are.equal(expectedElement, firstElement)
        end)
    
    end)

    describe("#flatten", function()
        
        it("should flatten the hierarchy", function()
            local inputArray = {
                { 1, 2, 3 },
                { 4, 5 },
                { 6 }
            }
            local expectedArray = { 1, 2, 3, 4, 5, 6 }
            local flattenedArray = Array.flatten(inputArray)
            assert.are.same(expectedArray, flattenedArray)
        end)
    
    end)

end)