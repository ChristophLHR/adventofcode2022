local function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

local function lines_from(file)
  if not file_exists(file) then return {} end
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

----------------------------------------------

local file = 'data.txt'
local lines = lines_from(file)

local currentAmount = 0
local mostAmount = { 0, 0, 0 }
local foundASlot = false
local total = 0

function AddToMostAmount()
  total = 0;
  for kv, va in pairs(mostAmount) do
    if not foundASlot and va < currentAmount then
      foundASlot = true
      mostAmount[kv] = currentAmount
    end
    total = total + va
  end
end

for k, v in pairs(lines) do
  if v == '' then
    if currentAmount ~= 0 then
      AddToMostAmount()
    end
    foundASlot = false
    currentAmount = 0
  else currentAmount = currentAmount + v
  end
end

AddToMostAmount()

print(total)
