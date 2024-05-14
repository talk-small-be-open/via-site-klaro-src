rendering
jsUpdateStageOn: js
	| updateScript |
	updateScript := super jsUpdateStageOn: js.

	updateScript << (JSStream on: 'const demoRibbon = SVG') argument: self demoSvg.
	updateScript addLiteral: 'SVG.find(".station.enabled").each(function(i, children) {
this.parent().put(demoRibbon.clone()).x(this.x() + demoRibbon.width()).cy(this.cy()).rotate(-15)
})'.

	^ updateScript