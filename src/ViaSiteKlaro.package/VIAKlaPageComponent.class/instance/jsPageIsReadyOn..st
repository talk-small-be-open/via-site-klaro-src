as yet unclassified
jsPageIsReadyOn: html
	^ (html jQuery id: self htmlId)
		addClass: 'ready';
		yourself