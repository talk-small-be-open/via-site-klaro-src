hooks
initialRequest: aRequest
	super initialRequest: aRequest.
		
	"The tag in the star_url of the webmanifest is used in Klaro for first time login with a rememberToken. If not already logged in, we try that."
	self isLoggedIn ifFalse: [
		aRequest at: 'tag' ifPresent: [ :tag |
			user := self wd findUserByRememberToken: tag.
			user ifNotNil: [
	"			user useAutologin ifTrue: ["
				self loginUser: user remember: true ]]]