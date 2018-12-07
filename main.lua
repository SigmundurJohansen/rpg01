--require 'map_functions'
require 'gamestate'
require 'tiledmap'
require 'camera'
--local Player = require 'player'
local GameState = gamestate.new()

function love.load()
  --loadMap('maps/map2.lua')
  --love.keyboard.setKeyRepeat(true)
  --Player = Player:new(WIDTH/2, HEIGHT/2, 150)
  _G.map = loadTiledMap('maps/town')
  GameState.load()
end


function love.draw()
  love.graphics.setBackgroundColor(255, 255, 255, 255)
  --drawMap()
  _G.map:draw()
  --camera:draw()
  --love.graphics.draw(Player.Skin, Player.ActiveFrame, Player.Position.X, Player.Position.Y, 0, Player.Height, Player.Width)
  GameState.draw()


  love.graphics.print(_VERSION, 20, 10)
end

function love.update(dt)
  _G.map:update(dt)
  GameState.update(dt)
  --camera:setPosition(love.mouse.getX() * 2, love.mouse.getY() * 2)
end
