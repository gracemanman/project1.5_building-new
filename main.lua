--[[ 

Poetics of Mobile
Project 1.5
25 February 2014

Code for building with lights
Man Zhu
CCT, Georgetown University

--]]



display.setStatusBar(display.HiddenStatusBar)

local screenWidth = display.contentWidth
local screenHeight = display.contentHeight

local screenCenterX = display.contentCenterX
local screenCenterY = display.contentCenterY


local bldgHeight = screenHeight * 0.8
local bldgWidth = bldgHeight * 0.6

local bldgCenterX = bldgWidth  * 0.5
local bldgCenterY = bldgHeight * 0.5


print( "Bldg: " .. bldgWidth .. " x " .. bldgHeight )

---------

-- Now:  Let's gather our consumables.

-- A Paint object, in Cool Grey (as a table):

local paintCoolGrey = { 145/256, 150/256, 147/256 }

local paintWarmGrey = { 0.5, 0.4, 0.45, 0.5 }

local paintGrassInACan = 
{ 
	type = "image",
	filename = "greenGrassWithAlpha.png"
}

local paintSkyInABox =
{
	type = "image",
	filename = "cleanSkyWide.jpg"
}

-- local light = 
-- {
-- 	type = "image",
-- 	filename = "buildinglight.png"}

local function whereTheX( xRange, bldgModifier )
	-- Returns an xPosition for the building.

	local maxX = xRange - bldgModifier
	local xPosition = math.random(bldgModifier, maxX)

	-- That's it.  Return that value
	-- and we're Audi 5000.

	return xPosition
end

local backgroundWidth = screenWidth * 3.0
local theSky = display.newRect( 0, 0, backgroundWidth, screenHeight )
theSky.fill = paintSkyInABox
theSky.x = screenCenterX
theSky.y = screenCenterY

-- Drop in our simple building

local myBuilding = display.newRect( 0, 0, bldgWidth, bldgHeight)
myBuilding.x = whereTheX( screenWidth, bldgCenterX )
myBuilding.y = screenHeight - bldgCenterY

myBuilding.fill = paintCoolGrey

local windowY = screenHeight - bldgHeight + 30
local windowX = myBuilding.x - bldgCenterX

local winWidth = bldgWidth*0.15
local winHeight = bldgHeight*0.15


-- local myGroundcover = display.newRect(screenCenterX,screenHeight-100, screenWidth, screenHeight*0.3)
-- myGroundcover.fill = paintGrassInACan
--To draw the windows

for j = 1, 4 do
	for i = 1, 6 do
	

	local drawRect = display.newRect(j*winWidth+windowX, i*winHeight+windowY, bldgWidth*0.1, bldgHeight*0.05)
	
	
end

end

--local myWindow = {
	-- local myWindow1 = display.newRect(1*70*windowX, 1*100*windowY,bldgWidth*0.3, bldgHeight*0.1 )
	-- --local myWindow2 = display.newRect(2*70*windowX, 1*100*windowY,bldgWidth*0.3, bldgHeight*0.1 )
	-- transition.fadeOut( myWindow1, { time=4000 } )
         -- transition.fadeOut(myWindow2, {time= 2000})

local windownumberj = math.random(1,2)
local windownumberi = math.random(1,3)

local Time = os.date( "*t" )    -- returns table of date & time values
--print( date.year, date.month )  -- print year and month
print( Time.hour )    -- print hour and minutes
local h = Time.hour

print( os.date( "%c" ) )        -- print out time/date string: e.g., "Thu Oct 23 14:55:02 2010"

 


--create a button
local widget = require( "widget" )

--Function to handle button events
local function handleButtonEvent( event )

    if ( "began" == event.phase ) then
    if h % 4 == 0 then
 	for j = 1, 4 do
 		for i = 1, math.floor(h/4) do
 			myWindow = display.newRect(j*winWidth+windowX, i*winHeight+windowY, bldgWidth*0.1, bldgHeight*0.05)
 			myWindow: setFillColor(0.953, 0.941, 0.031,1)

 		end
 	end
 end

 	if h % 4 ~= 0 then
 		for j = 1, 4 do
 			for i = 1, math.floor(h/4) do 
 			myWindow = display.newRect(j*winWidth+windowX, i*winHeight+windowY, bldgWidth*0.1, bldgHeight*0.05)
 			myWindow: setFillColor(0.953, 0.941, 0.031,1)

 			end
 		end

 		for j = 1, math.fmod(h, 4) do 
 			for i =1, (math.floor(h/4)+1) do
 			myWindow = display.newRect(j*winWidth+windowX, i*winHeight+windowY, bldgWidth*0.1, bldgHeight*0.05)
 			myWindow: setFillColor(0.953, 0.941, 0.031,1)
 		end
 	end
 end

          --transition.fadeOut(Turnonlight, {time= 2000})
          --transition.blink(drawRect, {time = 5000})
    --if ("ended" == event.phase ) then


     end  

end

local button1 = widget.newButton
{   
	x = windowX + 100,
	y = windowY - 50,
    width = 200,
    height = 100,
    defaultFile = "button.png",
    overFile = "buttonpressed.png",
    label = "What Time",
    labelColor = { default={1,1,1}, over={0,0,0}},
    font = "Calibri",
    fontSize = 40,
    onEvent = handleButtonEvent
}

-- local function handleButtonEvent( event )

--     if ( "ended" == event.phase ) then
   
--     for j = 1, 2 do
-- 	for i = 1, 3 do
	

-- 	local drawRect = display.newRect(j*70+windowX, i*100+windowY, bldgWidth*0.3, bldgHeight*0.1)
-- 	drawRect: setFillColor(1,1,1,1)
	
-- end

-- end
--     --if ("ended" == event.phase ) then


--      end  

-- end

-- local button2 = widget.newButton
-- {
-- 	x = windowX - 20,
-- 	y = windowY +250,
-- 	width = 200,
-- 	height = 100,
-- 	defaultFile = "button.png",
-- 	overFile = "buttonpressed.png",
-- 	label = "Stop it",
-- 	labelColor = { default={1,1,1}, over={0,0,0}},
-- 	font = "Calibri",
-- 	fontSize = 40,
-- 	onEvent = handeButtonEvent
-- }

-- animation element

local function aeolianHarp(event)
	-- this function actually just slides the background to the right.
	-- when it goes too far, it resets it.  Very jarring.
	theSky.x = theSky.x + 1.125
	if ( theSky.x + screenWidth ) > ( theSky.width - ( screenWidth * 0.5 )) then
		theSky.x = screenWidth * 0.5
	end
end

-- This timer activates the aeolianHarp function 10 times
-- a second.  Again, not the best way to do this,
-- but it works in this case.

local myWind = timer.performWithDelay(100, aeolianHarp, 0)


