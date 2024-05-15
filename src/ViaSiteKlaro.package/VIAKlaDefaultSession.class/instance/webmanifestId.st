as yet unclassified
webmanifestId
	| prefix |
	
	prefix := 'web-app-hep-klaro-'.
	
	self isLoggedIn ifFalse: [ ^ prefix, 'oneforall' ].
"not a good idea. Will change to often	self isLoggedIn ifFalse: [ ^ prefix, UUID new asString36 ]."
	
	"Klaro uses personalized webmanifests, if logged in"
	^ prefix, self user uuidString.