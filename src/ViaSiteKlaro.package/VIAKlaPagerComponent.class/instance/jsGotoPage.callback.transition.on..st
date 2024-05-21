rendering
jsGotoPage: aNameString callback: anActionBlock transition: aTransitionName on: html
	| page |
	page := self pageNamed: aNameString.
	
	^ (html jQuery ajax
		script: [ :js |
			anActionBlock ifNotNil: [
				anActionBlock cull: page ].

			self uiGotoPage: page transition: aTransitionName.
			
			self session jsUiInstructionsOn: js.
		];
		onError: 'javascriptErrorStandardBehaviour();')