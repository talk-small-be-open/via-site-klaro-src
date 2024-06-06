as yet unclassified
jsOnShowPageOn: js
	| script number promiseScript |
	script := JSScript new.

	"Scroll landscape smart, to the third last station.
	OPTIMIZE: Does not really work stable. Maybe good enough?"
	number := self currentExerciseNumber - 2.
	number > 0 ifTrue: [
		| id |
		id := 'Station_', number asTwoCharacterString.
"		script << (((js jQuery id: id) get: 0) call: 'scrollIntoView' with: { #block->'center' } aD)."
		script addLiteral: 'loadScroll("klaroNavigatorPage")'.
	].

	"Start melody, if enabled"
	self session soundMusicEnabled ifTrue: [
		script << ((js pixiSoundPlay soundFile: 'klaro-musik'; volume: 0.2; loop: true) setTimeout: 1000). ].

	promiseScript := JSStream new.
	promiseScript
		<< 'navigatorStageLoader.then';
		argument: script asFunction.

	^ promiseScript