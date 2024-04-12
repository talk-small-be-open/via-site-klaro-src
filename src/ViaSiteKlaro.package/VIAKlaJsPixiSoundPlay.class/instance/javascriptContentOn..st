printing
javascriptContentOn: aStream
	| args options |
		
	"See https://pixijs.io/sound/docs/PlayOptions.html"
	options := { #loop->loop. #singleInstance->true } aD.
		
	onComplete ifNotBlank: [ options at: #complete put: onComplete asFunction ].
	
	args := { id. options. }.
	
	aStream nextPutAll: 'if (PIXI.sound.exists'.
	JSStream encodeArguments: { id } on: aStream.
	aStream
		nextPutAll: ') {';
		nextPutAll: 'PIXI.sound.play'.

	JSStream encodeArguments: args on: aStream.

	aStream nextPutAll: '}'.
