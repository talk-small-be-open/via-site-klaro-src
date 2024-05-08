as yet unclassified
showLottieTestUrl
	| url |
	url := self request: 'URL of .lottie or .json'.

	self show: (VIAPluggableComponent new
"		titleText: (anAsset displayName);"
		content: [:html :me |
"			html div: 'Lottie-Animation Test:'."
			html lottiePlayer
				src: url;
				style: 'width: 50%';
"				loop: true;"
				autoplay: true.		
		];
		onUpdateRoot: [ :htmlRoot |
			htmlRoot javascript
"				defer;"
"				url: '/site/js/lottie/dotlottie-player.mjs';"
				url: 'https://unpkg.com/@dotlottie/player-component@2.7.12/dist/dotlottie-player.mjs';
				type: 'module'.
		];
		showCloseButton: true;
		yourself)