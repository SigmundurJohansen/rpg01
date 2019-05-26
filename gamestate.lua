local Player = require 'player'
local Enemy = require 'enemy'

local HEIGHT = love.graphics.getHeight()
local WIDTH = love.graphics.getWidth()
local CENTER = {X = WIDTH / 2, Y = HEIGHT / 2}

local enemySpawnPoint = {X = 150, Y = 150}

gamestate = {

  new = function(params)
    local self = {}

    local elapsedTime = 0

    self.camera = {}
    self.players = {}
    self.neutrals = {}
    self.enemies = {}
    -----------------------LOAD-----------------------
    function self.load()
      world = love.physics.newWorld(0,0,true)
      self.players[1] = Player.new(32, CENTER, 150)
      self.enemies[1] = Enemy.new(23, enemySpawnPoint, 100)
      --self.camera[1] = new Camera.new()
      --print(self.players[1].Height)
      --print(self.players[1].Speed)
    end

    -----------------------DRAW-----------------------
    function self.draw()
      -- players
      for i = 1, #self.players do
        love.graphics.draw(self.players[i].Skin, self.players[i].ActiveFrame,
          self.players[i].Position.X, self.players[i].Position.Y,
        0, self.players[i].Height, self.players[i].Width)
      end
      -- enemies
      for i = 1, #self.enemies do
        love.graphics.draw(self.enemies[i].Skin, self.enemies[i].ActiveFrame,
          self.enemies[i].Position.X, self.enemies[i].Position.Y,
        0, self.enemies[i].Height, self.enemies[i].Width)
      end
    end

    -----------------------Update-----------------------
    function self.update(dt)
      elapsedTime = elapsedTime + dt

      if love.keyboard.isDown('escape') then
        love.event.push('quit')
      end

      ----------------Player Movement---------------
      if love.keyboard.isDown('left', 'a') then
        self.players[1].Position.X = self.players[1].Position.X - dt * self.players[1].Speed
      elseif love.keyboard.isDown('right', 'd') then
        self.players[1].Position.X = self.players[1].Position.X + dt * self.players[1].Speed
      end

      if love.keyboard.isDown('up', 'w') then
        self.players[1].Position.Y = self.players[1].Position.Y - dt * self.players[1].Speed
      elseif love.keyboard.isDown('down', 's') then
        self.players[1].Position.Y = self.players[1].Position.Y + dt * self.players[1].Speed
      end

      -------------------Enemies----------------------

      -------------------Collission-------------------


      -------------------Frames-----------------------
      if(elapsedTime > 1) then
        for i = 1, #self.players do
          if(self.players[1].CurrentFrame < 4) then
            self.players[1].CurrentFrame = self.players[1].CurrentFrame + 1
          else
            self.players[1].CurrentFrame = 1
          end
          self.players[1].ActiveFrame = self.players[1].Frames[self.players[1].CurrentFrame]


          if(self.enemies[i].CurrentFrame < 4) then
            self.enemies[i].CurrentFrame = self.enemies[i].CurrentFrame + 1
          else
            self.enemies[i].CurrentFrame = 1
          end

          self.enemies[i].ActiveFrame = self.enemies[i].Frames[self.enemies[i].CurrentFrame]
          elapsedTime = 0
        end -- for loop
      end -- if
    end  -- update
    return self
  end
}
