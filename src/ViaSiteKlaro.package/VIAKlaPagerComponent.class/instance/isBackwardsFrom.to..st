testing
isBackwardsFrom: aPageOld to: aPageNew
	
	"Quick and dirty!!!"

	"to start is always backwards"
	(aPageNew isKindOf: VIAKlaNavigatorPage) ifTrue: [ ^ true ].

	"to station is only forward if coming from navigator"
	(aPageNew isKindOf: VIAKlaStationPage) ifTrue: [
		^ (aPageOld isKindOf: VIAKlaNavigatorPage) ifFalse: [ ^ true ]
	].

	"default is NOT backwards"
	^ false