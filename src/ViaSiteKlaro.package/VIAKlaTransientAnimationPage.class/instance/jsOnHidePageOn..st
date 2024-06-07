as yet unclassified
jsOnHidePageOn: js
	^ (self jsStopAllAnimationsOn: js),
	((js jQuery id: htmlId) empty)