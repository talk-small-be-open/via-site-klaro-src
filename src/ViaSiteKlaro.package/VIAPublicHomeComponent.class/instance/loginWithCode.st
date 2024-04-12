as yet unclassified
loginWithCode
	| success user |
	success := VIAKlaHepUser checkCouponValid: self couponCode.
	
	success ifTrue: [
		"Search user which is associated with that coupon code"
		user := self findOrCreateUserByCoupon.
		
		"Implicit accept terms"
		user beTermsAccepted.
		
		"Some initializations after registration"
		user presetAutologinFromSession: self session.
		
		self session
			loginUser: user remember: true;
			externalUser: nil.

		"The parent component will then do the steps for reload the app and login, if this component answers"
		self answer
	]