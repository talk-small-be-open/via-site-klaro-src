rendering
renderLottieTestOn: html

	html div: 'Lottie-Animation Test:'.
	html lottiePlayer
		src: '/site/animations/lottie-test.lottie';
		style: 'width: 300px; height: 300px';
		loop: true;
		intermission: 3000;
		autoplay: true.