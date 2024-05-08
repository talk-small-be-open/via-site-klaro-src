rendering
renderContentOn: html

	containerId := html nextId.
	videoId := html nextId.

	html div
		class: 'videoContainer';
		id: containerId;
		with: [

			"	self renderIntroVideoWithMePlayerOn: html."
			self renderIntroVideoOn: html.
			
			html script: 'const introVideo = document.getElementById("', videoId, '");'.


			html div
				class: 'videoControlOverlay';
"				onClick: 'if (event.target.classList.contains(""videoControlOverlay"")) { introVideo.paused ? introVideo.play() : introVideo.pause(); }';"
				onClick: 'introVideo.paused ? introVideo.play() : introVideo.pause();';
				with: [ 
"				html clickAnchor: ((((html jQuery id: videoId) get: 0) property: 'currentTime') assign: 0) with: 'Video wiederholen'.
				html clickAnchor: (((html jQuery id: videoId) get: 0) call: 'play') with: 'Video weiterfahren'."
					html logoKlaro.
					(html clickButton: 'event.stopPropagation();introVideo.play();')
						class: 'continueButton';
						with: 'Video weiterfahren'.
					(html clickButton: 'event.stopPropagation(); introVideo.currentTime = 0; introVideo.play();')
						class: 'playButton';
						with: 'Video starten'.

					html anchorButton
						class: 'exitButton';
						onClick: 'event.stopPropagation();';
						callback: [ self close ];
						with: 'Weiter zur App ...'			]
		].

