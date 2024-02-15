rendering
renderPageContentOn: html
	| updateScript stage |
	
"	html heading: 'NAVIGATOR/PFAD'."
	
	self renderTopbarOn: html.

	updateScript := JSScript new
		add: ((self jsPrepareStageOn: html) asInvokedFunction);
		add: ((self jsUpdateStageOn: html) asInvokedFunction);
		yourself.

	html script: (updateScript asFunction assignLocalTo: 'prepareNavigatorStageOnce').

"	html image url: '/site/images/hexenweg.svg'."

	"Lazy load inline SVG, see library see https://github.com/shubhamjain/svg-loader"
	stage := html svg
		class: 'navigatorStage';
		id: 'navigatorStage';
		attributeAt: 'preserveAspectRatio' put: 'xMidYMin slice'; "cut off the invisible stuff in x-Axis"
		attributeAt: 'data-svgloader-src' put: '/site/images/hexenweg.svg';
		attributeAt: 'width' put: 'auto'; "auto is not allowed says Firefox, but without it will not scroll vertically?!"
		attributeAt: 'height' put: 'auto';
		yourself.

	stage script: 'svgLoadInline("navigatorStage", prepareNavigatorStageOnce)' asJsStream.


	"768 breit = Zeichnungsgrund, ab x=300 "
	"Pseudo-Responsive. Crop the image to the middle column"
	self ifViewportSmall: [
		stage attributeAt: 'viewBox' put: '500 0 367.41 2823.44'.
	] else: [
		stage attributeAt: 'viewBox' put: '0 0 1367.41 2823.44'.
	].


	html scriptDefer: 'PIXI.sound.add("button-click", "/site/sounds/button-click.wav");' asJsStream.

"	html break; break; break."
"	self renderLottieTestOn: html."
	
	self renderBetatestOn: html with: [
		"TODO, wegnehmen, nur DEV"
		moduleExercises do: [ :each |
			self
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
			with: 'BETATEST: Clear portfolio' ]