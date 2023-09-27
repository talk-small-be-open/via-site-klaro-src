signalling
signalError: aString
	
	self logError: ('hep user error: ', aString).
	
	VIAKlaHepUserError signal: aString