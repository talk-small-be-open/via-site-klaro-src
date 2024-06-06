as yet unclassified
jsPreparePageOn: html

	| prepareScript |
	prepareScript := JSScript new
		add: ((self jsPrepareStageOn: html) asInvokedFunction);
		add: (self jsPageIsReadyOn: html);
		yourself.


	^ JSStream new
		<< 'navigatorStageLoader = svgLoadInline("navigatorStage");';
		<< 'navigatorStageLoader.then';
		argument: prepareScript asFunction;
		yourself