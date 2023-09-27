rendering
renderAnimationOn: html

	animationName ifBlank: [ ^ self ].
	
	html lottiePlayer
		src: ('/site/animations/', animationName, '.lottie');
		class: 'transientAnimation';
		autoplay: true;
		onComplete: (pager jsGotoPage: nextPageName callback: nextPageCallback on: html)