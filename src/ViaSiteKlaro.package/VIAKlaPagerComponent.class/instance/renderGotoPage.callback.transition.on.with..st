rendering
renderGotoPage: aNameString callback: anActionBlock transition: aTransitionName on: html with: aRenderBlock
	html clickAnchor: (self jsGotoPage: aNameString callback: anActionBlock transition: aTransitionName on: html) with: aRenderBlock