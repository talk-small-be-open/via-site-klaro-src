printing
javascriptContentOn: aStream
	| args |
"	args := { id. { #url->{ url }. #preload->true. #singleInstance->true } aD. }."

	"Wir geben nur 1 URL nicht als Array, weil pixi sonst wegen flac als unsupported format motzt.
	pixi hat eine fest verbaute Liste von browserunterstützten Formaten, tztz ..."
	args := { id. { #url->url. #preload->true. #singleInstance->true } aD. }.
	
	aStream nextPutAll: 'if (!PIXI.sound.exists'.
	JSStream encodeArguments: { id } on: aStream.
	aStream
		nextPutAll: ') {';
		nextPutAll: 'PIXI.sound.add'.

	JSStream encodeArguments: args on: aStream.

	aStream nextPutAll: '}'