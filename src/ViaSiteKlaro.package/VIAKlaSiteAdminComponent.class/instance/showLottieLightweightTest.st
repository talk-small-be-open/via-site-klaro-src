as yet unclassified
showLottieLightweightTest

	self show: (VIAPluggableComponent new
"		titleText: (anAsset displayName);"
		content: [:html :me |
"			html div: 'Lottie-Animation Test:'."
			html lottiePlayerLight: '/site/animations/backend-lottie-test.json'.
"			html lottiePlayerLight: 'https://assets10.lottiefiles.com/packages/lf20_fwykef3x.json'."
"				style: 'width: 50%';
				loop: true;
				autoplay: true.		"
		];
		onUpdateRoot: [ :htmlRoot |
			htmlRoot javascript
				url: '/site/js/lottie/jlottie.min.js'.
		];
		showCloseButton: true;
		yourself)