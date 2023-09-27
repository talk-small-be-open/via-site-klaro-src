rendering
renderGotoPage: aNameString animation: anAnimationNameString callback: anActionBlock on: html with: aRenderBlock

	| callback |
	
	callback := [ :page |
		page
			animationName: anAnimationNameString;
			nextPageName: aNameString callback: anActionBlock.
	].

	self renderGotoPage: 'animation' callback: callback on: html with: aRenderBlock