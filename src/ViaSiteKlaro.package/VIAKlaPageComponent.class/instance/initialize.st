initialization
initialize
	super initialize.
	self addContainerDiv.

	self hasMenu ifTrue: [
		self initializePageMenu ]