rendering
renderVideoOverlayOn: html
	html script: 'const introVideo = document.getElementById("', videoId, '");'.


	html div
		class: 'videoControlOverlay';
"				onClick: 'if (event.target.classList.contains(""videoControlOverlay"")) { introVideo.paused ? introVideo.play() : introVideo.pause(); }';"
		onClick: 'introVideo.paused ? introVideo.play() : introVideo.pause();';
		with: [
"				html clickAnchor: ((((html jQuery id: videoId) get: 0) property: 'currentTime') assign: 0) with: 'Video wiederholen'.
		html clickAnchor: (((html jQuery id: videoId) get: 0) call: 'play') with: 'Video weiterfahren'."

			html anchor
				class: 'closeAnchor';
				onClick: 'event.stopPropagation();';
				callback: [ self close ];
				with: [ 
"					html sT: 'introduction:skip'."
					html iconClose.
				].
			html div class: 'dynamicPart'; with: [

				html logoKlaroNegative.
				html svgImage: 'klara_winkend'.
				html svgImage: 'video_ende_rosa_screen'.
				
"				(html clickButton: 'event.stopPropagation(); introVideo.play();')
					class: 'continueButton';
					with: [
						html sT: 'introduction:continue' ]."
				(html clickButton: 'event.stopPropagation(); introVideo.currentTime = 0; introVideo.play();')
					class: 'playButton';
					with: [
						html span class: 'start'; sT: 'introduction:start'.
						html span class: 'start'; with: [ html iconRight ].
						html span class: 'repeat'; sT: 'introduction:repeat'.
						html span class: 'repeat'; with: [ html iconRepeat ].
					].
				html anchorButton
					class: 'exitButton';
					onClick: 'event.stopPropagation();';
					callback: [ self close ];
					with: [
						html sT: 'introduction:exit'.
						html iconRight ].

				html div class: 'videoControls'; with: [
					(html clickButton: 'event.stopPropagation(); introVideo.currentTime = introVideo.currentTime - 30;')
						class: 'skipLeft';
						with: [ html iconLeft; space; sT: 'introduction:skipLeft' ].

	"				(html clickAnchor: 'event.stopPropagation(); introVideo.play();')
						class: 'play';
						with: [
							html imgSignPlayGross ]."
					html imgSignPlayGross.

					(html clickButton: 'event.stopPropagation(); introVideo.currentTime = introVideo.currentTime + 30;')
						class: 'skipRight';
						with: [
							html sT: 'introduction:skipRight'; space; iconRight ].
				].


	"			(html clickAnchor: 'event.stopPropagation(); introVideo.currentTime = 0; introVideo.play();')
					class: 'repeatAnchor';
					with: [
						html iconLeft.
						html sT: 'introduction:repeat'.
					]."

				html anchor
					class: 'skipAnchor';
					onClick: 'event.stopPropagation();';
					callback: [ self close ];
					with: [ 
						html sT: 'introduction:skip'.
						html space.
						html iconRight.
					].
				]
			]