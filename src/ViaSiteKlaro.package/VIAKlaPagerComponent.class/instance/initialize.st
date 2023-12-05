initialization
initialize
	super initialize.
	pages := Dictionary new.
	htmlId := 'klaroPager'.
	
	self addContainerDiv.
	
"	self add: VIAKlaIntroductionPage new named: 'introduction'."
	self add: VIAKlaNavigatorPage new named: 'navigator'.
	self add: VIAKlaTransientAnimationPage new named: 'animation'.
	self add: VIAKlaStationPage new named: 'station'.
	self add: VIAKlaExercisePage new named: 'exercise'.
	self add: VIAKlaRewardPage new named: 'reward'.
	
	self gotoPageNamed: 'navigator'