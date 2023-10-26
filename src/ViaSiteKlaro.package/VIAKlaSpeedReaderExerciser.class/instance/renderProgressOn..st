rendering
renderProgressOn: html
	| percentage counter |
	counter := currentTextNumber - 1.
	
"	self isStepRead ifFalse: [ effectiveCounter := effectiveCounter - 1 ]."
	
	percentage := (VIAHelper percentage: counter of: self maxTextNumber).

"	id := html nextId."
	html div
		class: 'progressbar';
		with: [
			| bar |
			bar := html div
				class: 'filledBar';
				yourself.
				
			(self isStepRead and: [ percentage > 0 ]) ifTrue: [
				| oldPercentage |
				oldPercentage := (VIAHelper percentage: counter-1 of: self maxTextNumber).
				bar
					style: ('width:', oldPercentage greaseString, '%');
					script: (html animeJs easeInOutQuad; duration: 300; optionAt: 'width' put: percentage).
			] ifFalse: [
				bar style: ('min-width:1em;width:', percentage greaseString, '%').
			].
		
			"Show 100% on the last step. Otherwise we would never show that"
			(self isLastText and: [ self isLastStep ]) ifTrue: [ 
				bar script: (html animeJs easeInOutQuad; duration: 300; optionAt: 'width' put: 100).
			]
		]