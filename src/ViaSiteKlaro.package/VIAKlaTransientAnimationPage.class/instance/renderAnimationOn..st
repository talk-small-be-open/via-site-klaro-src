rendering
renderAnimationOn: html
	| js |

	animationName ifBlank: [ ^ self ].

	js := (pager jsGotoPage: nextPageName callback: nextPageCallback on: html).
	
	"TODO: Stopp lottie player, if interrupted before end"
	
	html div
		onClick: js;
		class: 'lottieAnimation';
		class: ('animationName-', animationName);
		with: [
			html lottiePlayer
				src: ('/site/animations/', animationName, '.', lottieFileType);
				class: 'transientAnimation';
				loop: false;
				autoplay: true;
				onComplete: js ]