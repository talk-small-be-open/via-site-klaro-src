rendering
renderButtonListenOn: html

	html span
		class: 'mainButton listen normalPlay';
"		class: 'active' if: self isStepListen;"
"		onClick: self jsPlayCurrentText;"
		with: [ 
			html imgSignListen: self isStepListen ]