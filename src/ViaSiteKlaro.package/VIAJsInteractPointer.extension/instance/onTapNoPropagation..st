*ViaSiteKlaro
onTapNoPropagation: aJavascript
	self onTap: ('event.stopPropagation();' asJsStream, aJavascript)