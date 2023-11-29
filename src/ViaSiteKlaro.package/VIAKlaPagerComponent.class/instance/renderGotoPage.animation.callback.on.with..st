rendering
renderGotoPage: aNameString animation: anAnimationNameString callback: anActionBlock on: html with: aRenderBlock

	| callback |
	
	"Shortcut, if no animation"
	anAnimationNameString ifBlank: [ ^ self renderGotoPage: aNameString callback: anActionBlock on: html with: aRenderBlock ].
	
	"Go indirectly to a page, via an anmiation page"
	
	callback := [ :page |
		page
			animationName: anAnimationNameString;
			nextPageName: aNameString callback: anActionBlock.
	].

	self renderGotoPage: 'animation' callback: callback on: html with: aRenderBlock