*ViaSiteKlaro
onFastPointer: aJavascript
	| script |
	script := (
		'event.stopPropagation()' asJsStream,
		aJavascript
	) asFunction: #(event).
	
	self document scriptGenerator
		event: VIAKlaHelper fastPointerEvent
		do: script
		on: self
		
