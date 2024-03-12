as yet unclassified
preloadTimerAnimeOn: html with: aBlock
	html scriptDefer: (
		'speedReaderTimer' asJsStream call: 'loadAnimation' with: (
			aBlock value: (html animeJs
				autoplay: false;
				duration: (self stepTimerMilliseconds - 300);
"				endDelay: 300"
				yourself) )
	)