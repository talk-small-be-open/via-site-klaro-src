rendering
renderIntroVideoOn: html
	| videoTag |

	videoTag := html video.
	videoTag
		id: videoId;
		width: 720;
		height: 1280;
		preload: 'metadata';
"		poster: appLogo;"
		noTab;
		controls: false;
		autoplay: autoPlay;
		attributeAt: 'controlslist' put: 'nodownload';
		attributeAt: 'disablepictureinpicture' put: true;
		attributeAt: 'playsinline' put: true;
		onPause: ((html jQuery id: containerId) removeClass: 'playing ended'; addClass: 'pausing');
		onPlay: ((html jQuery id: containerId) removeClass: 'pausing ended readyToStart'; addClass: 'playing');
		onPlaying: ((html jQuery id: containerId) removeClass: 'pausing ended readyToStart'; addClass: 'playing');
		onEnded: ((html jQuery id: containerId) addClass: 'ended');
"		onClick: 'introVideo.paused ? introVideo.play() : introVideo.pause();';"
		with: [
			html source
				type: 'video/mp4';
				url: '/site/video/Klaro_Intro_und_Erklaervideo.mp4'.
			html text: 'Your browser does not support the video tag.'].