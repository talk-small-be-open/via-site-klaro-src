accessing
updateCaches

	| words |
	plainText := textPillar pillarDocument text.
	
	words := (plainText findTokens: ' .!?').
	
	wordsCount := words size.
	
	longestWordSize := words ifEmpty: [ 0 ] ifNotEmpty: [
		(words collect: [ :each | each size ]) max ]