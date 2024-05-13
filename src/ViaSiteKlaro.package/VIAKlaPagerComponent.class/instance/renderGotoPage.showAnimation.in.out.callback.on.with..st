rendering
renderGotoPage: aNameString showAnimation: aKlaAnimation in: inTransition out: outTransition callback: anActionBlock on: html with: aRenderBlock

	| callback |
	
	"Shortcut, if no animation"
	aKlaAnimation ifNil: [ ^ self renderGotoPage: aNameString callback: anActionBlock transition: inTransition on: html with: aRenderBlock ].
	
	"Go indirectly to a page, via an anmiation page"
	
	"Configure transient animation page"
	callback := [ :animationPage |
		animationPage
			animation: aKlaAnimation;
			nextPageName: aNameString transition: outTransition callback: anActionBlock.
	].

	self renderGotoPage: 'animation' callback: callback on: html with: aRenderBlock