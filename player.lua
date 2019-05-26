
local Player = {
 Skin,
 Frames = {},
 ActiveFrame = 1,
 CurrentFrame = 1,
 Position = {X = 1,
 Y = 1 },
 Speed = 120,
 Height = 1,
 Width = 1,
}

function Player:new(pram1,speed)
  self = Player

  self.Position.X = pram1.X
  self.Position.Y = pram1.Y
  self.Speed = speed
  self.Skin = love.graphics.newImage('resources/ship5.png')
  self.Frames = {love.graphics.newQuad(0, 0, 24, 24,  Player.Skin:getDimensions()),
                  love.graphics.newQuad(24, 0, 24, 24, Player.Skin:getDimensions()),
                  love.graphics.newQuad(48, 0, 24, 24, Player.Skin:getDimensions()),
                  love.graphics.newQuad(72, 0, 24, 24, Player.Skin:getDimensions())}
  self.ActiveFrame = Player.Frames[1]
  return self
end

function loadPlayer(path)
  love.filesystem.load(path)()
end

function Player:changeSkin(skin, frames)
  Player.Skin = skin
  Player.Frames = frames
  Player.ActiveFrame = frames[1]
end

function getFrames()
  return Player.Frames
end

function getActiveFrame()
  return Player.ActiveFrame
end

function setActiveFrame(p)
  Player.ActiveFrame = Player.Frames[p]
end

function getCurrentFrame()
  return Player.CurrentFrame
end

function setCurrentFrame(frame)
  Player.CurrentFrame = frame
end
function Player:drawPlayer()
  love.graphics.draw(Player.Skin, Player.ActiveFrame, Player.X, Player.Y, 0, Player.Height, Player.Width)
end

return Player
