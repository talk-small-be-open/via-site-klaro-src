rendering
renderContentOn: html
	html div
		class: 'infoPanel';
		with: [
			html div
				class: 'infoPanelContent';
				with: [
					html anchor
						callback: [ self close ];
						with: [
							html iconClose; space; text: 'Schliessen' ] .
					html heading level1; pT: title.
					html div pT: body ] ]