rendering
renderButtonListenReplayOn: html

	html span
		class: 'mainButton listen replay';
"		class: 'active' if: self isStepListen;"
		onClickNoPropagation: self jsPlayCurrentText;
		with: [ 
			html imgSignListenReplay ]