rendering
renderInstallPwaInfoOn: html
	| id |
	
	(self session isMobileDevice and: [ self session isStandalonePwa not ]) ifFalse: [ ^ self ].
		
	id := html nextId.

	html div
		id: id;
		class: 'infoPanel installPwa';
		script: (('if (!localStorage.getItem("hidePwaInstallInfo")) { $("#', id, '").show() }') asJsStream);
		style: 'display:none';
		with: [
			html div
				class: 'infoPanelContent';
				with: [
					html div class: 'close'; with: [
						html clickSpan: ((html jQuery id: id) hide )
							with: [ html iconClose ] ] .
					html logoKlaro.
					html div class: 'info'; pT: 'publicHome:pleaseInstallAsPwa'.
					html clickSpanButton: ( 'localStorage.setItem("hidePwaInstallInfo", true);' asJsStream, (html jQuery id: id) hide )
						with: [ html sT: 'publicHome:hidePwaInstallInfo' ].

	] ]