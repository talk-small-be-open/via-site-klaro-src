rendering
renderGotoPage: aNameString callback: anActionBlock transition: aTransitionName on: html with: aRenderBlock
	html clickAnchor: (
"		(html pixiSoundPlay id: 'swipe'),"
		(self jsGotoPage: aNameString callback: anActionBlock transition: aTransitionName on: html)
	) with: aRenderBlock