
local bugSkin
local bugFrames = {}
local bugActiveFrame
local bugCurrentFrame = 1

bug = love.graphics.newImage("/resources/bug.png")
bugFrames[1] =  love.graphics.newQuad(0, 0, 24, 24, bug:getDimensions()) -- left
bugFrames[2] =  love.graphics.newQuad(24, 0, 24, 24, bug:getDimensions()) -- up
bugFrames[3] =  love.graphics.newQuad(48, 0, 24, 24, bug:getDimensions()) -- right
bugFrames[4] =  love.graphics.newQuad(72, 0, 24, 24, bug:getDimensions()) -- down

bugActiveFrame = bugFrames[bugCurrentFrame]

love.graphics.print("bug lua",200,200)
playerChangeSkin(bug,bugFrames, bugActiveFrame)
