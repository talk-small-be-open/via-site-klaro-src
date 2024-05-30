rendering
renderPlayNewWordSoundOn: html
	| soundName |
	
	"no sound on first text"
	self isFirstText ifTrue: [ ^ self ].
	
	soundName := 'new-word'.
	self currentText styleName ifNotBlank: [ :style |
		soundName := soundName, '-', style.
	].

	html script: (html pixiSoundPlay id: soundName; volume: 0.5)