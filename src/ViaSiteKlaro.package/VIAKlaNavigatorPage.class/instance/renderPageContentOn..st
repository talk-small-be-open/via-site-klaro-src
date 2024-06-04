rendering
renderPageContentOn: html
	| stage |
	
	self renderTopbarOn: html.

	"Declare as global. Hm, is this dirty?"
	html script: 'var navigatorStageLoader;'.

	"Lazy load inline SVG, see library see https://github.com/shubhamjain/svg-loader"
	stage := html svg
		class: 'navigatorStage';
		id: 'navigatorStage';
		attributeAt: 'preserveAspectRatio' put: 'xMidYMin slice'; "cut off the invisible stuff in x-Axis"
		attributeAt: 'data-svgloader-src' put: '/site/images/hexenweg.svg';
		attributeAt: 'width' put: 'auto'; "auto is not allowed says Firefox, but without it will not scroll vertically?!"
		attributeAt: 'height' put: '2823px';  "auto"
		attributeAt: 'viewBox' put: '0 0 1367.41 2823.44';
		yourself.

	"768 breit = Zeichnungsgrund, ab x=300 "
	"Pseudo-Responsive. Crop the image to the middle column"
	self session isViewportSmall ifTrue: [
		stage attributeAt: 'viewBox' put: '500 0 367.41 2823.44' ].
	self session isViewportMedium ifTrue: [
		stage attributeAt: 'viewBox' put: '300 0 767.41 2823.44' ].


	html scriptDefer: (html pixiSoundAdd id: 'background-melody'; url: '/site/sounds/Klaro-Musik_Loop3_lang.m4a').
	
	self renderBetatestOn: html with: [
		"TODO, wegnehmen, nur DEV"
		moduleExercises do: [ :each |
			self pager
				renderGotoPage: 'station'
				callback: [ :page | page gotoModuleExercise: each ]
				on: html
				with: 'Zu Station ', each module indexCodeString, ' ...'.
			(self canGotoModuleExercise: each) ifFalse: [
				html span: ' (eigentlich gesperrt)'.
			].
				
			html break.
		].

		html anchor
			callback: [ self resetAllExercises ];
			with: 'BETATEST: Clear portfolio'
	]