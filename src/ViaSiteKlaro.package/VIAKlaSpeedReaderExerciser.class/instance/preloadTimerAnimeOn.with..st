as yet unclassified
preloadTimerAnimeOn: html with: aBlock
	html scriptDefer: (
		html jsWindow call: 'countdown_load_animation' with: (
			aBlock value: (html animeJs
				autoplay: false;
				duration: (self currentText readDurationMilliseconds - 300);
"				endDelay: 300"
				yourself) )
	)