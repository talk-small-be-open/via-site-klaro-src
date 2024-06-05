uikit
svgIcon: aString x: anX y: anY with: anSvgString
	| x y |
	x := anX asString.
	y := anY asString.
	
	self span class: ('svgIcon icon ', aString); with: [
		self svgCss: ('svgIcon ', aString) style: '' viewBox: ('0 0 ', x, ' ', y) with: anSvgString]