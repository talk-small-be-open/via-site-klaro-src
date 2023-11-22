as yet unclassified
showInfoPanel: aString title: aTitle
	self show: (VIAInfoPanelComponent new
		title: aTitle;
		body: aString;
		yourself)