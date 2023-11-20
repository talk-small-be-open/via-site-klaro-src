rendering
renderContentOn: html
	| jsClose |
	
	jsClose := (html jsPagerAction: [ self close ]).
	
	html div class: 'lottieAnimation';
"		class: 'lottieAnimation';"
		class: animationName;
		class: cssClass;
		onClick: jsClose;
		with: [
			html lottiePlayer
				src: ('/site/animations/', animationName, '.lottie');
				autoplay: true;
				onComplete: jsClose ].