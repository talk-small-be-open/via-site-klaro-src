initialization
initialize
	super initialize.
	gameBoardId := UUID new asString36.

	self beSpeedNormal.
	
	self start