as yet unclassified
renderInfoPanel: aButtonRenderable on: html with: aRenderable
	| id |
	
	id := html nextId.
	
	html clickSpan: ((html jQuery id: id) show) with: aButtonRenderable.

	html div
		id: id;
		class: 'infoPanel';
		style: 'display:none';
		script: (html jQuery this appendTo: (html jQuery id: htmlId)); "Move to top level in DOM inside the container"
		with: [
			html div
				class: 'infoPanelContent';
				with: [
					html clickSpan: ((html jQuery id: id) hide) with: [
						html iconClose; space; text: 'Schliessen' ].
					html break; break.
					html render: aRenderable ] ]