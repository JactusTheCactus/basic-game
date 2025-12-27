SCREEN _NEWIMAGE(800, 600, 32)
DIM fps AS SINGLE: fps = 60 'Framerate
DIM dimX AS SINGLE, dimY AS SINGLE: dimX = 800: dimY = 600 'Dimensions
DIM sizeX AS SINGLE, sizeY AS SINGLE: sizeX = 50: sizeY = sizeX 'Player Size
DIM posX AS SINGLE, posY AS SINGLE: posX = dimX / 2: posY = dimY / 2 'Player position
DIM baseSpeed AS SINGLE, speed AS SINGLE, visSpeed AS SINGLE: baseSpeed = 4 'Movement speed
DIM delX AS SINGLE, delY AS SINGLE 'Player delta
DIM colour AS LONG 'Player colour
DO
	CLS
	delX = 0: delY = 0
	'Controls
		'Sprinting or Sneaking
			'Sprint : <SHIFT>
				IF _KEYDOWN(100304) THEN
					speed = baseSpeed * 2: colour = _RGB32(0, 255, 0)
			'Sneak : <CTRL>
				ELSEIF _KEYDOWN(100306) THEN
					speed = baseSpeed / 2: colour = _RGB32(255, 0, 0)
			'Walk
				ELSE
					speed = baseSpeed: colour = _RGB32(255, 255, 255)
			END IF
		'Movment
			'Up : <UP> / <W>
				IF _KEYDOWN(18432) OR _KEYDOWN(119) THEN delY = delY - 1
			'Down : <DOWN> / <S>
				IF _KEYDOWN(20480) OR _KEYDOWN(115) THEN delY = delY + 1
			'Left : <LEFT> / <A>
				IF _KEYDOWN(19200) OR _KEYDOWN(97) THEN delX = delX - 1
			'Right : <RIGHT> / <D>
				IF _KEYDOWN(19712) OR _KEYDOWN(100) THEN delX = delX + 1
	'Diagonal movement
		visSpeed = speed
		IF delX <> 0 AND delY <> 0 THEN
			speed = speed * (1 / SQR(2))
		ELSEIF delX = 0 AND delY = 0 THEN
			visSpeed = 0
		END IF
	posX = posX + (delX * speed)
	posY = posY + (delY * speed)
	'Clamp to the borders
		IF posX < sizeX THEN posX = sizeX
		IF posX > dimX - sizeX THEN posX = dimX - sizeX
		IF posY < sizeY THEN posY = sizeY
		IF posY > dimY - sizeY THEN posY = dimY - sizeY
	'Drawing
		_TITLE "Basic Game"
		LINE (posX - sizeX, posY - sizeY) - (posX + sizeX, posY + sizeY), colour, BF
		PRINT "Speed:"; RTRIM$(STR$(round(visSpeed, 2))); "m/s"
		PRINT "Position:"; getPos(posX, dimX / 2); ","; getPos(dimY - posY, dimY / 2)
		_DISPLAY
		_LIMIT fps
LOOP UNTIL _KEYDOWN(27)
FUNCTION round (n, i)
	round = INT(n * (10^i)) / (10^i)
END FUNCTION
FUNCTION getPos$ (position, dimension)
	getPos$ = STR$(round(position / (dimension * 2), 2) * 100) + "%"
END FUNCTION