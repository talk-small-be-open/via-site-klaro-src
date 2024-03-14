as yet unclassified
renderInfoPanel: aButtonString on: html with: aRenderable
	| id |
	
	id := html nextId.
	
	html clickSpan: ((html jQuery id: id) show) with: aButtonString.

	html div
		id: id;
		class: 'infoPanel';
		style: 'display:none';
		with: [
			html div
				class: 'infoPanelContent';
				with: [
					html clickSpan: ((html jQuery id: id) hide) with: [
						html iconClose; space; text: 'Schliessen' ].
					html break; break.
					html render: aRenderable ] ]