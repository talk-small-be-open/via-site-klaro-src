as yet unclassified
findOrCreateViaUserWebsite: aWebsite
	| socialId viaUser |
	socialId := 'hep_id_', self hepId asString.
	
	viaUser := aWebsite data findOrCreateUserBySocialId: socialId email: email.

	viaUser
		firstName: firstName;
		lastName: lastName.

	"Klaro defaults to autologin, thats very much easier for kids"
	viaUser presetAutologin: true.
		
	^ viaUser