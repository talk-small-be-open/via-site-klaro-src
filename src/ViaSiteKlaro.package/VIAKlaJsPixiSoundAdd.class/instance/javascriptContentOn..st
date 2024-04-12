printing
javascriptContentOn: aStream
	| args |
	
	args := { id. { #url->{ url }. #preload->true. #singleInstance->true } aD. }.
	
	aStream nextPutAll: 'if (!PIXI.sound.exists'.
	JSStream encodeArguments: { id } on: aStream.
	aStream
		nextPutAll: ') {';
		nextPutAll: 'PIXI.sound.add'.

	JSStream encodeArguments: args on: aStream.

	aStream nextPutAll: '}'