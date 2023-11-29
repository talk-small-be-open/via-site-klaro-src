as yet unclassified
preloadTimerAnimeOn: html with: aBlock
	html scriptDefer: (
		'speedReaderTimer' asJsStream call: 'load_animation' with: (
			aBlock value: (html animeJs
				autoplay: false;
				duration: (self readDurationMilliseconds - 300);
"				endDelay: 300"
				yourself) )
	)