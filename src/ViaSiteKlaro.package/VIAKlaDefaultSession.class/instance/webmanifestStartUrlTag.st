as yet unclassified
webmanifestStartUrlTag
	
	"Klaro uses it to autologin the very first time you start it as standalone"
	
	self isLoggedIn ifFalse: [ ^ nil ].
	
	"If already running as installed PWA, then we do not need to add that tag
	to the start url of the manifest. The newly updated manifest will then replace
	the installed one, and there will be no remember token anymore in the start-url"
	self isStandalonePwa ifTrue: [ ^ nil ].
	
	^ self user rememberToken.