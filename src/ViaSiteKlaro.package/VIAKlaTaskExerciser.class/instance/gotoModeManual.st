rendering
gotoModeManual
	"Put the only (or main) speed reader into manual mode. For quick jumps from outside."
	mainSpeedReader ifNotNil: [
		mainSpeedReader gotoModeManual ]