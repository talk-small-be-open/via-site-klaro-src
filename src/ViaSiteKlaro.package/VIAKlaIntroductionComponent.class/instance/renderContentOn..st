rendering
renderContentOn: html

	containerId := html nextId.
	videoId := html nextId.

	html scriptDefer: ('screenWake_on();' asJsStream).

	html div
		class: 'videoContainer';
		class: 'readyToStart';
		class: 'playing' if: autoPlay;
		id: containerId;
		with: [

			"	self renderIntroVideoWithMePlayerOn: html."
			self renderIntroVideoOn: html.
			self renderVideoOverlayOn: html.
			
	]