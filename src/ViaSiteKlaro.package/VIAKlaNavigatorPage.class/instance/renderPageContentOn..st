rendering
renderPageContentOn: html
	| stage |
	
"	html heading: 'NAVIGATOR/PFAD'."
	
	self renderTopbarOn: html.

"	updateScript := JSScript new
		add: ((self jsPrepareStageOn: html) asInvokedFunction);
""will be done in onShow		add: ((self jsUpdateStageOn: html) asInvokedFunction);""
		add: (self jsPageIsReadyOn: html);
		yourself."

	"We prepare the update script into a function, to run as callback, after the
	big SVG has been imported"
"	html script: (updateScript asFunction assignLocalTo: 'prepareNavigatorStageOnce')."

	"Declare as global. Hm, is this dirty?"
	html script: 'var navigatorStageLoader;'.

"	html image url: '/site/images/hexenweg.svg'."

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

"	stageLoaderScript := JSScript new.
	stageLoaderScript
		addLiteral: 'svgLoadInline(""navigatorStage"", prepareNavigatorStageOnce);'.

	stage script: stageLoaderScript."


	"768 breit = Zeichnungsgrund, ab x=300 "
	"Pseudo-Responsive. Crop the image to the middle column"
	self session isViewportSmall ifTrue: [
		stage attributeAt: 'viewBox' put: '500 0 367.41 2823.44' ].
	self session isViewportMedium ifTrue: [
		stage attributeAt: 'viewBox' put: '300 0 767.41 2823.44' ].


	html scriptDefer: (html pixiSoundAdd id: 'button-click'; url: '/site/sounds/button-click.wav').
	html scriptDefer: (html pixiSoundAdd id: 'background-melody'; url: '/site/sounds/Klaro-Musik_Loop3_lang.m4a').

	
"	html scriptDefer: 'PIXI.sound.add(""button-click"", ""/site/sounds/button-click.wav"");' asJsStream."

"	html break; break; break."
"	self renderLottieTestOn: html."
	
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
			with: 'BETATEST: Clear portfolio' ]