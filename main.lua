--require 'map_functions'
require 'gamestate'
require 'tiledmap'
--local Player = require 'player'
local Camera = require 'camera'
local GameState = gamestate.new()

function love.load()
  --loadMap('maps/map2.lua')
  --love.keyboard.setKeyRepeat(true)
  --Player = Player:new(WIDTH/2, HEIGHT/2, 150)
  _G.map = loadTiledMap('maps/town')
  GameState.load()
  Camera:new()
end


function love.draw()
  love.graphics.setBackgroundColor(255, 255, 255, 255)
  --drawMap()
  _G.map:draw()
  --camera:draw()
  Camera:set()
  Camera:unset()
  --love.graphics.draw(Player.Skin, Player.ActiveFrame, Player.Position.X, Player.Position.Y, 0, Player.Height, Player.Width)
  GameState.draw()


  love.graphics.print(_VERSION, 20, 10)
end

function love.update(dt)
  _G.map:update(dt)
  GameState.update(dt)
  Camera:setScale(love.mouse.getX(), love.mouse.getY())
end
