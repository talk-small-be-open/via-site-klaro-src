as yet unclassified
javascriptContentOn: aStream
	| timeline id |

	"IIFE Immediately invoked function expression"
	aStream nextPutAll: '(function() {'.
	
	id := UUID new asString36.
	timeline := 'anime_timeline_', id.

	paths do: [ :each |
		aStream
			nextPutAll: 'const ';
			nextPutAll: each first;
			nextPutAll: '=anime.path("';
			nextPutAll: each second;
			nextPutAll: '");'.
	].

	"Per default we always use a timeline"
	aStream nextPutAll: ('const ', timeline, '=anime.timeline(').
	aStream javascript: timelineOptions.
	aStream nextPutAll: (');').

	aStream nextPutAll: timeline.

	optionsCollection do: [ :eachOptions |
		aStream
			nextPutAll: '.add(';
			javascript: eachOptions;
			nextPutAll: ')' ].
		
	aStream nextPutAll: ';'.
	
	aStream nextPutAll: ('return ', timeline, '; }() )').
