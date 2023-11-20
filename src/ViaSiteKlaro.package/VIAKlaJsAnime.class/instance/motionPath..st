as yet unclassified
motionPath: aCssSelector

	| name |
	
	name := self createPath: aCssSelector.
	
	self translateX: (JSStream on: name, '("x")').
	self translateY: (JSStream on: name, '("y")').
	self rotate: (JSStream on: name, '("angle")').

	self easing: 'linear'.