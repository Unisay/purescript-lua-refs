local function _new(val) return function() return {value = val} end end
local function newWithSelf(f)
    return function()
      local ref = {value = nil}
      ref.value = f(ref)
      return ref
    end
end
local function read(ref) return function() return ref.value end end
local function modifyImpl(f)
  return function(ref)
    return function()
      local t = f(ref.value)
      ref.value = t.state
      return t.value
    end
  end
end
local function write(val)
  return function(ref) return function() ref.value = val end end
end
return {
  _new = (_new),
  newWithSelf = (newWithSelf),
  read = (read),
  modifyImpl = (modifyImpl),
  write = (write),
}
