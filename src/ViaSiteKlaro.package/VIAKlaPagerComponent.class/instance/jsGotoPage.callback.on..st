rendering
jsGotoPage: aNameString callback: anActionBlock on: html
	| page |
	page := self pageNamed: aNameString.
	
"	^ ((html jQuery ajax)
		callback: [
			self currentPage: page.
			anActionBlock ifNotNil: [
				anActionBlock cull: page ].
		];
		onSuccess: (((html jQuery id: page htmlId) load)
			html: [ :h | self renderPage: page contentOn: h ];
			onComplete: ((JSStream on: 'window') call: 'pager_gotoPage' with: ('#', htmlId) with: ('#', page htmlId))
		)
	)"
	
	^ html jQuery ajax
		script: [ :js |
"			self currentPage: page."

			self uiGotoPage: page.

			anActionBlock ifNotNil: [
				anActionBlock cull: page ].
			self session jsUiInstructionsOn: js.
"			js << ((self jsReloadPage: aNameString on: js)
				onComplete: ((JSStream on: 'window') call: 'pager_gotoPage' with: ('#', htmlId) with: ('#', page htmlId)))"
		]