rendering
renderContentOn: html
	| gameBoard |
		
	gameBoard := html div.
	gameBoard
		id: gameBoardId;
		class: 'speedReader';
		class: ('mode', gameMode asString);
		class: ('sequence', gameSequence asString);
		class: step;
		class: taskBrick uiStyle;
"		script: (html jsInteract pointer onTap: ((html jQuery this find: '.gameDefaultButton') triggerClick) );"
"		onClick: ((html jQuery this find: '.gameDefaultButton') triggerClick);" "default action, if clicked in nowhere land"
"		script: (html jQuery this on: 'pointerdown' do: ((html jQuery this find: '.gameDefaultButton') triggerClick));"

"		script: (html jQuery this on: 'pointerdown' do: ('catchPointerAndRetriggerDefaultButton(event)' asFunction: #(event)) );"
		onFastPointer: 'catchPointerAndRetriggerDefaultButton(event)' asJsStream.

	self isModeAutomatic ifTrue: [ 
		gameBoard class: 'playing' if: self isRunning else: 'pausing'.
	].

	gameBoard with: [

		self renderPageLogicOn: html.

		self renderBetatestOn: html with: [
			html span: 'BETATEST: '.
			html anchor callback: [ self restart ]; with: 'RESTART'.
			html space.
			html anchor callback: [ self gotoModeAutomatic ]; with: 'GOTO-AUTO'.
		]
	].

	html scriptDefer: self jsInit