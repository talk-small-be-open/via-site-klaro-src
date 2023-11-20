rendering
jsUpdateStageOn: html
	| updateScript number |
	
	updateScript := JSScript new.
	
	"Place the witch to station number"
	lastInWorkExercise ifNotNil: [
		number := lastInWorkExercise module indexCode firstNumber asTwoCharacterString.
		updateScript addLiteral: ('svgPath = SVG("#Pfad_zu_', number, '");').
		updateScript << ((html animeJs set: '#Hexe_Klara')
			translateX: (JSStream on: 'svgPath.pointAt(svgPath.length()).x');
			translateY: (JSStream on: 'svgPath.pointAt(svgPath.length()).y')
		).
		updateScript << (((html jQuery id: 'Hexe_Klara') get: 0) call: 'scrollIntoView' with: {#block->'center'} aD ).
	].

	"Test add circle"
	updateScript addLiteral: '
var station, kreis, kreisX;
const kreisTemplate = SVG("#Kreis_klein_01");
'.



	"Animate witch floating"
	"High CPU!"
"	updateScript << (html animeJs
		targets: '#Hexe_Klara';
		duration: 1000;
		translateY: '+=20';
		loop: true;
		easing: 'easeInOutSine';
		direction: 'alternate'
	)."
	

	moduleExercises do: [ :each |
		| num id pathId |
		num := each module indexCode firstNumber asTwoCharacterString.
		id := 'Station_', num.
		pathId := 'Pfad_zu_', num.
		(self canGotoModuleExercise: each) ifTrue: [
			| jsGotoStation jsOnClick |
			jsGotoStation := (self jsGotoPage: 'station' callback: [ :page | page gotoModuleExercise: each ] on: html).
			
			(each = currentExercise and: [ lastInWorkExercise ~= currentExercise ]) ifTrue: [
				jsOnClick := (html animeJs
					targets: '#Hexe_Klara';
					motionPath: ('svg.navigatorStage #', pathId);
					duration: ( JSStream on: ('SVG("#', pathId, '").length()*3' ) );
					timelineNext;
					targets: '#Hexe_Klara';
					rotate: 0;
					endDelay: 300;
					complete: jsGotoStation
				)
			] ifFalse: [ 
				jsOnClick := jsGotoStation
			].
			
			updateScript << ((html jQuery id: id)
				addClass: 'enabled';
				off: 'click';
				onClick: jsOnClick
			).
			
			"Status of tasks, add css classes"
			each taskExercises withIndexDo: [ :eachTaskEx :index |
				| taskId |
"				taskId := 'Uebung_', num, '_', index asString."

				updateScript addLiteral: ('station = SVG("#Kreis_gross_', num, '");').
				updateScript addLiteral: ('kreisX = station.x() + station.width() + 4 + (', (index-1) asString,' * (kreisTemplate.width()+4));').
				updateScript addLiteral: ('kreis = station.parent().put(kreisTemplate.clone()).x(kreisX).cy(station.cy());').
				eachTaskEx isFinished ifTrue: [
					updateScript addLiteral: 'kreis.addClass("done");' ].
			]
			
			
		] ifFalse: [ 
			"do nothing with the station. not clickable"
		]
	
	].

	^ updateScript