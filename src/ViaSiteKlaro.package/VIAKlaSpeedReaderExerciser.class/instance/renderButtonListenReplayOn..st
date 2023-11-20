rendering
renderButtonListenReplayOn: html

	html span
		class: 'mainButton listen replay';
"		class: 'active' if: self isStepListen;"
		onClick: self jsPlayCurrentText;
		with: [ 
			html imgSignListenReplay ]