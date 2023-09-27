rendering
renderContentOn: html

	html lottiePlayer
		src: ('/site/animations/', animationName, '.lottie');
		class: 'lottieAnimation';
		autoplay: true;
		onComplete: (html jsPagerAction: [ self close ])