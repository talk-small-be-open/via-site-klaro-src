as yet unclassified
autologinUser: aUser

	"Early detection of deleted user. Might be a customer support case,
	where we delete the user, to relogin with an initial user object."
	( self wd users includes: aUser ) ifFalse: [ self removeAutologinUser: aUser. ^ self ].

	self session
		loginUser: aUser remember: true;
		loginMethod: 'autologin-cookie-switchuser';
		externalUser: nil.

	"The parent component will then do the steps for reload the app and login, if this component answers"
	self answer