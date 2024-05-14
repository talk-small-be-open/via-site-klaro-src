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
					html logoKlaroNegative.
					(html clickButton: 'event.stopPropagation(); introVideo.play();')
						class: 'continueButton';
						with: [
							html sT: 'introduction:continue' ].
					(html clickButton: 'event.stopPropagation(); introVideo.currentTime = 0; introVideo.play();')
						class: 'playButton';
						with: [
							html span class: 'start'; sT: 'introduction:start'.
							html span class: 'repeat'; sT: 'introduction:repeat'.
						].

					html anchorButton
						class: 'exitButton';
						onClick: 'event.stopPropagation();';
						callback: [ self close ];
						sT: 'introduction:exit'.

					html anchor
						class: 'skipAnchor';
						onClick: 'event.stopPropagation();';
						callback: [ self close ];
						sT: 'introduction:skip'
				]
		]