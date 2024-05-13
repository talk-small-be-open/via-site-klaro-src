as yet unclassified
showLottieTestWebComponent

	self show: (VIAPluggableComponent new
"		titleText: (anAsset displayName);"
		content: [:html :me |
"			html div: 'Lottie-Animation Test:'."
			html lottiePlayerWc
				src: '/site/animations/backend-lottie-test.json';
"				src: 'https://assets10.lottiefiles.com/packages/lf20_fwykef3x.json';"
				style: 'width: 50%';
				loop: true;
				autoplay: true.		
		];
		onUpdateRoot: [ :htmlRoot |
			htmlRoot javascript
				url: 'https://unpkg.com/@lottiefiles/dotlottie-wc@latest/dist/dotlottie-wc.js';
				type: 'module'.
		];
		showCloseButton: true;
		yourself)