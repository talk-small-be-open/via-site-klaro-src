rendering
renderAnimationOn: html
	| js |

	animation ifNil: [ ^ self ].

	js := (pager jsGotoPage: nextPageName callback: nextPageCallback transition: nextPageTransition on: html).
	
	"TODO: Stopp lottie player, if interrupted before end"
	
	html div
		onClick: js;
		class: 'lottieAnimation';
		class: ('animationName-', animation animationName);
		with: [
			| player |
			player := animation createLottiePlayerOn: html.
			
			player
				class: 'transientAnimation';
"				loop: false;"
				autoplay: true;
				onComplete: js
		]