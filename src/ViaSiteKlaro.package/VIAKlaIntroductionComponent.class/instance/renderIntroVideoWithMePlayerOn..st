rendering
renderIntroVideoWithMePlayerOn: html
	| videoTag |

	videoTag := html video.
	videoTag
		id: videoId;
		width: 720;
		height: 1280;
		preload: 'none'; "none = recommended by mediaelement.js"
"				poster: aVideoPlayer posterUrl;"
		noTab;
		controls: true;
		autoplay: false;
		attributeAt: 'playsinline' put: true;
		with: [
			html source
				type: 'video/mp4';
				url: '/site/video/Klaro_Intro_und_Erklaervideo.mp4'.
			html text: 'Your browser does not support the video tag.'].

	html scriptDefer: (self jsForMediaelementVideoPlayerId: videoId).
