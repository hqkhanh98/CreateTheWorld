local M = {}

M.fire =
{
    {
        name = "fire",
        group = "fire",
        path = "images/fire.png",
        active = true
    },
    {
        name = "fire",
        group = "fire",
        path = "images/fire.png",
        active = false
    },
    {
        name = "fire",
        group = "fire",
        path = "images/fire.png",
        active = true
    },
    {
        name = "fire",
        group = "fire",
        path = "images/fire.png",
        active = false
    },
    {
        name = "fire",
        group = "fire",
        path = "images/fire.png",
        active = true
    }
}

M.air = {

  {
     name = "air",
     group = "air",
     path = "images/air.png",
     active = true
  },
  {
    name = "rain",
    group = "air",
    path = "images/rain.png",
    active = false
  },
  {
    name = "rain",
    group = "air",
    path = "images/steam.png",
    active = true
  },
  {
    name = "rain",
    group = "air",
    path = "images/rain.png",
    active = false
  },
  {
    name = "rain",
    group = "air",
    path = "images/cloud.png",
    active = true
  },
  {
    name = "rain",
    group = "air",
    path = "images/storm.png",
    active = true
  }

}

M.earth = {
  {
    name = "rock",
    group = "earth",
    path = "images/rock.png",
    active = true
  }
}

function M.getItemByName( name )

end 

function M.getLen( group )
  local count = 0
  if group == "fire" then
    for i = 1, #M.fire do
      if M.fire[i].active == true then
        count = count + 1
      end
    end
  elseif group == "air" then
    for i = 1, #M.air do
      if M.air[i].active == true then
        count = count + 1
      end
    end
  end
  return count
end

function M.getListActive( group )
  local listActive = {}
  if group == "fire" then
    for i = 1, #M.fire do
      if M.fire[i].active == true then
        table.insert( listActive, M.fire[i] )
      end
    end
  elseif group == "air" then
    for i = 1, #M.air do
      if M.air[i].active == true then
        table.insert( listActive, M.air[i] )
      end
    end
  end
  return listActive
end

return M
