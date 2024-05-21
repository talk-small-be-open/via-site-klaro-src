rendering
uiGotoPage: aPage showAnimation: aKlaAnimation in: inTransition out: outTransition

	| animationPage |
	
	"Shortcut, if no animation"
	aKlaAnimation ifNil: [ ^ self uiGotoPage: aPage transition: inTransition ].
	
	"Go indirectly to a page, via an anmiation page"
	animationPage := (self pageNamed: 'animation').
	animationPage
		animation: aKlaAnimation;
		nextPageName: aPage name transition: outTransition.

	self uiGotoPage: animationPage transition: inTransition