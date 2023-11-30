as yet unclassified
showInfoPanel: aString title: aTitle
	self show: (VIAKlaInfoPanelComponent new
		title: aTitle;
		body: aString;
		yourself)