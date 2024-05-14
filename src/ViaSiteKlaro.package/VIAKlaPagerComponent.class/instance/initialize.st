initialization
initialize
	| stationPage navigatorPage |
	
	super initialize.
	pages := Dictionary new.
	htmlId := 'klaroPager'.
	
	self addContainerDiv.

	self session isDemo
		ifTrue: [
			stationPage := VIAKlaStationDemoPage new.
			navigatorPage := VIAKlaNavigatorDemoPage new.
		]
		ifFalse: [
			stationPage := VIAKlaStationPage new.
			navigatorPage := VIAKlaNavigatorPage new.
		].

	
"	self add: VIAKlaIntroductionPage new named: 'introduction'."
	self add: navigatorPage named: 'navigator'.
	self add: VIAKlaTransientAnimationPage new named: 'animation'.
	self add: stationPage named: 'station'.
	self add: VIAKlaExercisePage new named: 'exercise'.
	self add: VIAKlaRewardPage new named: 'reward'.
	
	self gotoPageNamed: 'navigator'