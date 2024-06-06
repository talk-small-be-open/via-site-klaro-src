rendering
jsUpdateStageOn: js
	| updateScript1 updateScript2 promiseScript |
	updateScript1 := super jsUpdateStageOn: js.

	updateScript2 := JSScript new.
	updateScript2 << (JSStream on: 'const demoRibbon = SVG') argument: self demoSvg.
	updateScript2 addLiteral: 'SVG.find(".station.enabled").each(function(i, children) {
this.parent().put(demoRibbon.clone()).x(this.x() + demoRibbon.width()).cy(this.cy()).rotate(-15)
})'.

	promiseScript := JSStream new.
	promiseScript
		<< 'navigatorStageLoader.then';
		argument: updateScript2 asFunction.

	^ updateScript1, promiseScript