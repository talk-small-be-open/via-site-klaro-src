printing
javascriptContentOn: aStream
	| args options |
		
	"See https://pixijs.io/sound/docs/PlayOptions.html"
	options := { #loop->loop. "#singleInstance->true." #volume->volume } aD.
		
	onComplete ifNotBlank: [ options at: #complete put: onComplete asFunction ].
	
	args := { id. options. }.
	
	aStream nextPutAll: 'audioPlayer.pixiPlay'.
	JSStream encodeArguments: args on: aStream.
