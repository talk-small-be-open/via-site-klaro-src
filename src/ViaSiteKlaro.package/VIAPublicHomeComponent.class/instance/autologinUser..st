as yet unclassified
autologinUser: aUser

	self session
		loginUser: aUser remember: true;
		loginMethod: 'autologin-cookie-switchuser';
		externalUser: nil.

	"The parent component will then do the steps for reload the app and login, if this component answers"
	self answer