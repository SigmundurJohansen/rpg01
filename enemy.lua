
local Enemy = {
  Name = "Monster",
  Skin,
  Frames = {},
  ActiveFrame = 1,
  CurrentFrame = 1,
  Position = {X = 1, Y = 1},
  Speed = 50,
  Height = 1,
  Width = 1
}

function Enemy:new(pram1, speed)
  self = Enemy
  self.Name = "MonsterOne"
  self.Position.X = pram1.X
  self.Position.Y = pram1.Y
  self.Speed = speed
  self.Skin = love.graphics.newImage('resources/bug.png')
  self.Frames = {love.graphics.newQuad(0, 0, 24, 24,  Enemy.Skin:getDimensions()),
                  love.graphics.newQuad(24, 0, 24, 24, Enemy.Skin:getDimensions()),
                  love.graphics.newQuad(48, 0, 24, 24, Enemy.Skin:getDimensions()),
                  love.graphics.newQuad(72, 0, 24, 24, Enemy.Skin:getDimensions())}
  self.ActiveFrame = Enemy.Frames[1]
  return self
end

return Enemy
