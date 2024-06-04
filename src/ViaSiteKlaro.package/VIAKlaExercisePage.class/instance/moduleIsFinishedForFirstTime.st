as yet unclassified
moduleIsFinishedForFirstTime
	| reward |
	reward := self pager pageNamed: 'reward'.
	
	reward rewardNumber: self stationNumber. 
	
	self pager uiGotoPage: reward transition: 'appear'.
