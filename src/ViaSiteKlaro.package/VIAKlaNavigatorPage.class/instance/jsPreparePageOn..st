as yet unclassified
jsPreparePageOn: html
	^ JSScript new
		addLiteral: 'svgLoadInline("navigatorStage", prepareNavigatorStageOnce);';
		yourself