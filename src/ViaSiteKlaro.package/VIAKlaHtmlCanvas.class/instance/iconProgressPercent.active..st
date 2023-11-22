icons
iconProgressPercent: anInteger active: aBoolean
	| progressClass css |
"	anInteger = 0 ifTrue: [ progressClass := 'progress0' ]."
	progressClass := ''.
	anInteger >= 50 ifTrue: [ progressClass := 'progress50' ].
	anInteger = 100 ifTrue: [ progressClass := 'progress100' ].

	css := ('iconProgress ', progressClass).
	aBoolean ifTrue: [ css := css, ' active' ].

	self svgCss: css style: '' viewBox: '0 0 18.07 18.06' with: '
<path class="bottom" d="m9.035 17.255c4.54 0 8.23-3.68 8.23-8.23h-16.46c0 4.54 3.68 8.23 8.23 8.23z" />
<path class="top" d="m9.035 0.805c-4.54 0-8.23 3.68-8.23 8.23h16.46c0-4.54-3.68-8.23-8.23-8.23z" />
'