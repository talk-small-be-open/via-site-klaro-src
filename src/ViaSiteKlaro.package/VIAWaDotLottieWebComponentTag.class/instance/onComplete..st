events
onComplete: anObject
	self document scriptGenerator
		event: 'complete'
		do: anObject
		on: self