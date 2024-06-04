rendering
jsUpdateStageOn: js
	| updateScript number id |
	
	updateScript := JSScript new.

	"Test add circle"
	updateScript addLiteral: '
var station, kreis, svgPath;
'.
	
	"Place the witch to station number"
	lastInWorkExercise ifNotNil: [
		number := lastInWorkExercise module indexCode firstNumber asTwoCharacterString.
		updateScript addLiteral: ('svgPath = SVG("#Pfad_zu_', number, '");').
		updateScript << ((js animeJs set: '#Hexe_Klara')
			translateX: (JSStream on: 'svgPath.pointAt(svgPath.length()).x');
			translateY: (JSStream on: 'svgPath.pointAt(svgPath.length()).y')
		).
"		updateScript << (((html jQuery id: 'Hexe_Klara') get: 0) call: 'scrollIntoView' with: {#block->'center'} aD )."
"		updateScript << ((html jQuery id: htmlId) scrollTop: (((html jQuery id: 'Hexe_Klara') position access: 'top') + 20))."
	] ifNil: [
		"Place the witch to start"
		updateScript addLiteral: ('svgPath = SVG("#Pfad_zu_01");').
		updateScript << ((js animeJs set: '#Hexe_Klara')
			translateX: (JSStream on: 'svgPath.pointAt(0).x');
			translateY: (JSStream on: 'svgPath.pointAt(0).y')
		).
	
	].

	"Draw every station"
	moduleExercises do: [ :each |
		| num pathId houseClass |
		num := each module indexCode firstNumber asTwoCharacterString.
		id := 'Station_', num.
		pathId := 'Pfad_zu_', num.
		(self canGotoModuleExercise: each) ifTrue: [
			| jsGotoStation jsOnClick jsUnlockSoundApi isNewExercise jsStationUpdater jsStoreScrollPosition |

			isNewExercise := (each = currentExercise and: [ lastInWorkExercise ~= currentExercise ]).
			
			"Build JS to get to station, either with animated witch or directly"
			
			jsUnlockSoundApi := JSStream new. "js pixiSoundPlay id: 'button-click'."
			jsStoreScrollPosition := 'saveScroll("klaroNavigatorPage")' asJsStream.
			jsGotoStation := (self pager jsGotoPage: 'station' callback: [ :page | page gotoModuleExercise: each ] on: js).
			
			isNewExercise ifTrue: [
				"The witch flying animation"
				jsOnClick := jsUnlockSoundApi, jsStoreScrollPosition, (js animeJs
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
				"Without witch animation"
				jsOnClick := jsUnlockSoundApi, jsStoreScrollPosition, jsGotoStation
			].
			
			jsStationUpdater := (js jQuery id: id)
				addClass: 'enabled';
				removeClass: 'isNewExercise';
				off: 'click';
				onClick: jsOnClick.
			
			isNewExercise ifTrue: [ jsStationUpdater addClass: 'isNewExercise' ].
			
			updateScript << jsStationUpdater.
			
			"Status of tasks, add css classes"
			each taskExercises withIndexDo: [ :eachTaskEx :index |
				| kreisId |
				
				eachTaskEx isFinished ifTrue: [
					kreisId := 'Kreis_klein_', num, '_', index asTwoCharacterString.
					updateScript addLiteral: ('kreis=SVG("#', kreisId, '");').
					updateScript addLiteral: 'kreis.addClass("done");' ].
			]
			
			
		] ifFalse: [ 
			"do nothing with the station. not clickable"
		].
	
		"Hide/show the house partials"
		houseClass := each isFinished ifTrue: [ 'moduleFinished' ]. "ifFalse: [ 'moduleNotFinished' ]"
		houseClass ifNotBlank: [
			updateScript << ((js jQuery id: ('Haus_', num)) addClass: houseClass) ].
	
	].

	^ updateScript