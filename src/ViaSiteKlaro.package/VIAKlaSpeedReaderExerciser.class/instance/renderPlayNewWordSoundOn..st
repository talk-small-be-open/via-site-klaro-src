rendering
renderPlayNewWordSoundOn: html
	| soundName |
	
	"no sound on first text, if Manual"
	(self isModeManual and: [ self isFirstText ]) ifTrue: [ ^ self ].
	
	soundName := 'new-word'.
	self currentText styleName ifNotBlank: [ :style |
		soundName := soundName, '-', style.
	].

	html scriptDefer: (html pixiSoundPlay id: soundName; volume: 0.5)