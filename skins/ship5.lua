
local ship5Skin
local ship5Frames = {}
local ship5ActiveFrame
local ship5CurrentFrame = 1

ship5 = love.graphics.newImage("/resources/ship5.png")
ship5Frames[1] =  love.graphics.newQuad(0, 0, 24, 24, ship5:getDimensions())
ship5Frames[2] =  love.graphics.newQuad(24, 0, 24, 24, ship5:getDimensions())
ship5Frames[3] =  love.graphics.newQuad(48, 0, 24, 24, ship5:getDimensions())
ship5Frames[4] =  love.graphics.newQuad(72, 0, 24, 24, ship5:getDimensions())

ship5ActiveFrame = ship5Frames[ship5CurrentFrame]

love.graphics.print("ship5 lua",200,200)
playerChangeSkin(ship5,ship5Frames, ship5ActiveFrame)
