*ViaSiteKlaro
onFastPointer: aJavascript
	| script |
	script := (
		'event.stopPropagation()' asJsStream,
		aJavascript
	) asFunction: #(event).
	
	self document scriptGenerator
		event: 'pointerdown'
		do: script
		on: self
		
