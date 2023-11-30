rendering
gotoModeAutomatic
	"Put the only (or main) speed reader into automatic mode. For quick jumps from outside."
	mainSpeedReader ifNotNil: [
		mainSpeedReader gotoModeAutomatic ]