local M = {}

M.recipes = {
  {
    exp1 = "fire",
    exp2 = "fire",
    result = "steam"
  },
  {
    exp1 = "water",
    exp2 = "earth",
    result = "swamp"
  }
}

function M.checkRecipes( ele1, ele2 )
  for i = 1, #M.recipes do
    if ( ( ele1 == M.recipes[i].exp1 and ele2 == M.recipes[i].exp2 )
      or ( ele2 == M.recipes[i].exp1 and ele1  == M.recipes[i].exp2 ) ) then
        return M.recipes[i].result
    end
  end
  return "nil"
end

return M
