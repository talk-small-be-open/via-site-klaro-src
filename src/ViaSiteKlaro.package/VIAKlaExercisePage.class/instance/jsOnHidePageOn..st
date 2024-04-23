as yet unclassified
jsOnHidePageOn: js
	^ (self jsStopAllAnimationsOn: js),
	('speedReaderTimer.stop();' asJsStream)