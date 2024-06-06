as yet unclassified
jsUpdatePageOn: js
	| promiseScript |
	"Get the JS-object to reload myself.
	We already have the big SVG, and just reload the JS instructions to update it
	
	BUT all update has to deal with a promise, since the build of the SVG
	is async
	"
	
	promiseScript := JSStream new.
	promiseScript
		<< 'navigatorStageLoader.then';
		argument: (self jsUpdateStageOn: js) asFunction.

	^ promiseScript