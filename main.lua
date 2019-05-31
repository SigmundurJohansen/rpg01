--require 'map_functions'
require 'gamestate'
require 'tiledmap'

--local Player = require 'player'
local GameState = gamestate.new()

local HEIGHT = love.graphics.getHeight()
local WIDTH = love.graphics.getWidth()

function love.load()
  _G.map = loadTiledMap('maps/town2')
  GameState.load()
end


function love.draw()
    camera:set()

  love.graphics.setBackgroundColor(255, 255, 255, 255)
  _G.map:draw()
  GameState.draw()
  love.graphics.print(_VERSION, 20, 10)

    camera:unset()
end

function love.update(dt)
  _G.map:update(dt)
  GameState.update(dt)

  camera:setX(GameState.getX() - (WIDTH/2),WIDTH-10,0)
  camera:setY(GameState.getY() - (HEIGHT/2),HEIGHT-300,0)
end
