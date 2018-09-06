local Sequence = require "../src/sequence"

describe("Sequence", function()

    describe("#create", function()
        local snapshot

        before_each(function()
          snapshot = assert:snapshot()
        end)

        after_each(function()
          snapshot:revert()
        end)

        it("should create a new sequence by calling the passed in callback n times", function()
            local count = 3
            local callback
            callback = function(n)
                return n
            end
            local callbackToSpyOn = spy.new(callback)
            local expectedSequence = { 1, 2, 3, n = 3 }
            local sequence = Sequence.create(count, callbackToSpyOn)
            assert.spy(callbackToSpyOn).was.called(count)
            assert.are.same(expectedSequence, sequence)
        end)
    end)

end)