-- pa2.lua
-- Corey Gray
-- 07 February 2018
-- Source for pa2 module for CS 331: Assignment 2B

local pa2 = {}

-- function mapArray
-- Returns a table containing "func(item)" for each item in "array".
-- Preconditions:
--      "func" is a one-parameter function that will accept any item in table "array".
--      "array" is a table object of key, value pairs with keys that are consecutive integers.
function pa2.mapArray(func, array)
  for key, value in ipairs(array) do
    array[key] = func(value)
  end
  return array
end

-- function concatMax
-- Returns a string which is a concatenation of as many copies of "inputString" as possible,
-- without exceeding the length exceeding "maxLength".
-- Returns an empty string if "maxLength" is less than the length of "inputString".
-- Preconditions:
--      "inputString" is a valid string object.
--      "maxLength" is a valid number object with no decimal portion.
function pa2.concatMax(inputString, maxLength)
  local repetitions = math.floor( maxLength / inputString:len() )
  local outputString = inputString:rep(repetitions)
  return outputString
end

-- function calculateNextCollatz(integer)
-- Returns the number following the given number in the Collatz sequence.
-- Preconditions:
--      "integer" is a valid, positive number object with no decimal portion.
local function calculateNextCollatz(integer)
  if integer % 2 == 1 then
    integer = 3 * integer + 1 
  else
    integer = integer / 2
  end
  return integer
end

-- coroutine yieldArray
-- Yields the value of each item in the table.
-- Preconditions:
--      "array" is a table object of key, value pairs with keys that are consecutive integers.
local function yieldArray(array)
    for key, value in ipairs(array) do
      coroutine.yield(array[key])
    end
end
 
-- coroutine collatz
-- Yields one or more numbers that are entries in the Collatz sequences starting at "integer".
-- Preconditions:
--      "integer" is a valid, positive number object with no decimal portion.
function pa2.collatz(integer)
  local results = { integer }
  
  while integer ~= 1 do
    integer = calculateNextCollatz(integer)
    table.insert(results, integer)
  end
  
  yieldArray(results)
end

return pa2
