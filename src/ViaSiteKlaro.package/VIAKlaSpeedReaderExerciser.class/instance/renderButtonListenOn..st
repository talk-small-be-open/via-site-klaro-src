rendering
renderButtonListenOn: html

	html span
		class: 'mainButton listen';
		class: 'active' if: self isStepListen;
		onClick: self jsPlayCurrentText;
		with: [ 
			html imgSignListen ]