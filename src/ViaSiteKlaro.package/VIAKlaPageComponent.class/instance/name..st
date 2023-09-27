accessing
name: anObject

	name := anObject.
	
	htmlId ifNil: [ htmlId := 'page-', anObject ]