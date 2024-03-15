as yet unclassified
jsPreparePageOn: html
	"Do not set page=ready here, will be done at the end of prepareNavigatorStageOnce"

	^ JSScript new
		addLiteral: 'svgLoadInline("navigatorStage", prepareNavigatorStageOnce);';
		yourself