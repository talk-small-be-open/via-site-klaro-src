as yet unclassified
equalityArray
	"GemStone: Hashes of nil, true and false, are numbers next to each other. Dont use
	them directly, because of combined hash could be the same"
	^ {
		taskBrick.
		self isDoneManual asString.
		self isDoneAutomatic asString.
	}