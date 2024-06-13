rendering
jsRenderCurrentPageContentOn: js

	js << ((js jQuery id: currentPage htmlId) html: [ :h | self renderCurrentPageContentOn: h ]).
	js << (((JSStream on: 'window') call: 'processHtmlDocument' with: ('#', currentPage htmlId))).
