as yet unclassified
readDurationSeconds
	^ (self currentText readDurationSeconds * self timeFactor) rounded max: 2