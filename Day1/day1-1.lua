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
  
  ---
  
  local file = 'data.txt'
  local lines = lines_from(file)
  
  local currentAmount = 0
  local mostAmount = 0

  for k, v in pairs(lines) do
    if v == '' then 
      currentAmount = 0
    else
      currentAmount = currentAmount + v;
      if mostAmount < currentAmount then
        mostAmount = currentAmount
      end
    end
  end
  
  print (mostAmount)