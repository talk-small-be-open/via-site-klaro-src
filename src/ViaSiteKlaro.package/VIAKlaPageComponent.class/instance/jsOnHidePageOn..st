as yet unclassified
jsOnHidePageOn: js
	"subclasses do more stuff"
	
	"Stopp all dotlottie players on this page"
	^ (((js jQuery id: htmlId) find: 'dotlottie-player') each: (
		'this.stop();' asFunction
	)),
	('_.each(anime.running, e => {e.pause()});' asJsStream)