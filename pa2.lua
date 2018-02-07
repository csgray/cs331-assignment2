-- pa2.lua
-- Corey Gray
-- February 06, 2018
-- pa2 module for CS331: Assignment 2B

local pa2 = {}

-- mapArray
-- Takes a function 'f' and an array 't'.
-- Function 'f' is a one-parameter function that will accept any item in array 't'.
-- Returns a table containing f(it) for each item 'it' in array 't'.
function pa2.mapArray(func, array)
  for key, value in ipairs(array) do
    array[key] = func(value)
  end
  return array
end

-- concatMax
-- Takes a string 's' and an integer 'i'.
-- Returns a string which is a concatenation of as many copies of 's' as possible,
-- without exceeding the length exceeding the integer 'i'.
-- Returns an empty string if 'i' is less than the length of 's'.
function pa2.concatMax(inputString, maxLength)
  local repetitions = math.floor( maxLength / inputString:len() )
  local outputString = inputString:rep(repetitions)
  return outputString
end

-- collatz
-- Takes an integer.
-- Yields one or more integers that are entries in the Collatz sequences starting at 'k'.
function pa2.collatz(int)
  local results = { int }
  
  while int ~= 1 do
    if int % 2 == 1 then
      int = 3 * int + 1 
    else
      int = int / 2
    end
    table.insert(results, int)
  end
  
  for key, value in ipairs(results) do
    coroutine.yield(results[key])
  end
end

return pa2