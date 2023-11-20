rendering
renderAnimationOn: html
	| js |

	animationName ifBlank: [ ^ self ].

	js := (pager jsGotoPage: nextPageName callback: nextPageCallback on: html).
	
	"TODO: Stopp lottie player, if interrupted before end"
	
	html div
		onClick: js;
		with: [
			html lottiePlayer
				src: ('/site/animations/', animationName, '.lottie');
				class: 'transientAnimation';
				autoplay: true;
				onComplete: js ]