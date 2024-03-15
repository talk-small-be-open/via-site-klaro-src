as yet unclassified
jsUpdatePageOn: js
	"Get the JS-object to reload myself.
	We already have the big SVG, and just reload the JS instructions to update it
	
	asInvokedFunction encapsulates the JS into its own space
	"
"	^ js jQuery ajax
		script: [ :j | j << ((self jsUpdateStageOn: j) asInvokedFunction) ];
		yourself"
	^ self jsUpdateStageOn: js