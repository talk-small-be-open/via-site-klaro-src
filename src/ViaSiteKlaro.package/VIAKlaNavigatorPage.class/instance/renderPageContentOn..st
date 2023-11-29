rendering
renderPageContentOn: html
	| updateScript stage |
	
"	html heading: 'NAVIGATOR/PFAD'."
	
	self renderTopbarOn: html.

	updateScript := self jsUpdateStageOn: html.	

	html script: (updateScript asFunction assignLocalTo: 'updateNavigatorStage').

"	html image url: '/site/images/hexenweg.svg'."

	"Lazy load inline SVG, see library see https://github.com/shubhamjain/svg-loader"
	stage := html svg
		class: 'navigatorStage';
		attributeAt: 'preserveAspectRatio' put: 'xMidYMin slice'; "cut off the invisible stuff in x-Axis"
		attributeAt: 'data-js' put: 'enabled'; "have no JS anway, but disable removing, better performance maybe"
		attributeAt: 'data-cache' put: 'disabled'; "or 21600 for 6h"
		attributeAt: 'data-unique-ids' put: 'disabled';
		attributeAt: 'data-css-scoping' put: 'disabled';
"		attributeAt: 'data-src' put: '/site/images/hexenweg_optimized.svg';"
		attributeAt: 'data-src' put: '/site/images/hexenweg.svg';
		attributeAt: 'oniconload' put: 'updateNavigatorStage();';
		attributeAt: 'width' put: 'auto';
		attributeAt: 'height' put: 'auto';
		yourself.

	"768 breit = Zeichnungsgrund, ab x=300 "
	"Pseudo-Responsive. Crop the image to the middle column"
	self ifViewportSmall: [
		stage attributeAt: 'viewBox' put: '500 0 367.41 2823.44'.
	] else: [
		stage attributeAt: 'viewBox' put: '0 0 1367.41 2823.44'.
	].


"	html break; break; break."
"	self renderLottieTestOn: html."
	
	self renderBetatestOn: html with: [
		"TODO, wegnehmen, nur DEV"
		moduleExercises do: [ :each |
			(self canGotoModuleExercise: each) ifTrue: [
				self
					renderGotoPage: 'station'
					callback: [ :page | page gotoModuleExercise: each ]
					on: html
					with: 'Zu Station ', each module indexCodeString, ' ...'.
			] ifFalse: [
				html span: 'Station '.
				html span: each module indexCodeString.
				html span: ' gesperrt'.
			].
				
			html break.
		].


		html anchor
			callback: [ self resetAllExercises ];
			with: 'BETATEST: Clear portfolio' ]