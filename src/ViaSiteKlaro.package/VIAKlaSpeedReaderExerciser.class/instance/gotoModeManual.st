initialization
gotoModeManual
	gameMode := #manual.
	currentTextNumber := 1.
	self beSpeedNormal.
	self beSequenceNormal.
	self gotoFirstStep.