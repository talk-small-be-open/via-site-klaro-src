as yet unclassified
jsPreparePageOn: html
	"Do not set page=ready here, will be done at the end of prepareNavigatorStageOnce"

	| prepareScript |
	prepareScript := JSScript new
		add: ((self jsPrepareStageOn: html) asInvokedFunction);
"will be done in onShow		add: ((self jsUpdateStageOn: html) asInvokedFunction);"
		add: (self jsPageIsReadyOn: html);
		yourself.


"was callback: prepareNavigatorStageOnce"

	^ JSStream new
		<< 'navigatorStageLoader = svgLoadInline("navigatorStage");';
		<< 'navigatorStageLoader.then';
		argument: prepareScript asFunction;
		yourself