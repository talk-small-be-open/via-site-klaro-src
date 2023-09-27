rendering
renderTitlePanelContentOn: html
	"partial only. rendered in UI at the top"

	"a bit dirty..., should be done more generic"
	mainSpeedReader ifNotNil: [
		mainSpeedReader renderTitlePanelContentOn: html ].
