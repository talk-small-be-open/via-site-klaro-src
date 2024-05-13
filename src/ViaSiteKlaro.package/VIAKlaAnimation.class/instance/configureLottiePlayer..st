as yet unclassified
configureLottiePlayer: aLottiePlayerHtmlTag
	^ aLottiePlayerHtmlTag
		src: ('/site/animations/', self animationName, '.json');
		class: self cssClass;
		loop: self loop;
		autoplay: self autoPlay;
		yourself