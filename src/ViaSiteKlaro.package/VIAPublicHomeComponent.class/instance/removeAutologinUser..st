removing
removeAutologinUser: aUser

	aUser deleteRememberCookie: self requestContext website: self website.
	self session removeAutologinUser: aUser