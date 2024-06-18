as yet unclassified
initialize
	super initialize.

	optionsCollection := OrderedCollection new.
	paths := OrderedCollection new.
	timelineOptions := Dictionary new.
	
	self timelineNext.