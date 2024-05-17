as yet unclassified
jsOnShowPageOn: js
	| script number |
	script := JSScript new.
	
	script << (self jsUpdatePageOn: js).

	"Scroll landscape smart, to the third last station.
	OPTIMIZE: Does not really work stable. Maybe good enough?"
	number := self currentExerciseNumber - 2.
	number > 0 ifTrue: [
		| id |
		id := 'Station_', number asTwoCharacterString.
		script << (((js jQuery id: id) get: 0) call: 'scrollIntoView' with: { #block->'center' } aD).
	].

	"Start melody"
	script << (js pixiSoundPlay id: 'background-melody'; volume: 0.2; loop: true).

	^ script