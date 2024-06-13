as yet unclassified
jsStopAllAnimationsOn: js
	
	"Stopp all dotlottie players, anime animations, pixi sounds on this page"
	^ (((js jQuery id: htmlId) find: 'dotlottie-player') each: (
		"Should be this.destroy() on newer players!"
		'this.stop();' asFunction
	)),
	('_.each(anime.running, e => {e.pause()});' asJsStream),
	('PIXI.sound.stopAll();' asJsStream)