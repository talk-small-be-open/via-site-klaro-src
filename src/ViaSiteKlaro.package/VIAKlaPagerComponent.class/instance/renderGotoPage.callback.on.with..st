rendering
renderGotoPage: aNameString callback: anActionBlock on: html with: aRenderBlock
	html anchor
		onMouseDown: 'event.preventDefault();';
		onClick: (self jsGotoPage: aNameString callback: anActionBlock on: html);
		with: aRenderBlock