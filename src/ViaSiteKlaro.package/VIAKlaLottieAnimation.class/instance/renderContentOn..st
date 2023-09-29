rendering
renderContentOn: html

	html lottiePlayer
		src: ('/site/animations/', animationName, '.lottie');
		class: 'lottieAnimation';
		class: animationName;
		class: cssClass;
		autoplay: true;
		onComplete: (html jsPagerAction: [ self close ])