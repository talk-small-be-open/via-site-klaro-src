as yet unclassified
jsOnHidePageOn: js
	^ (self jsStopAllAnimationsOn: js),
	('speedReaderTimer.forceAbort();screenWake_off();' asJsStream),
	(self jsEmptyPageOn: js)
	
"	(((js jQuery id: htmlId) find: 'div.lottieAnimation') cssAt: 'visibility' put: 'hidden'),
	('console.log(""empty exercise page"")' asJsStream),
	('$(""#page-exercise"").find(""div.lottieAnimation"").css(""visibility"", ""hidden"")' asJsStream)

"