as yet unclassified
loginWithCode
	| success user |

	success := true.
	
	antibot isOk ifFalse: [ success := false ].

	success := success and: [ self isCouponCodeSyntaxValid ].
	
	success := success and: [VIAKlaHepUser checkCouponValid: self couponCode].
	
	success ifTrue: [
		"Search user which is associated with that coupon code"
		user := self findOrCreateUserByCoupon.
		
		"Implicit accept terms"
		user beTermsAccepted.
		
"		user presetAutologinFromSession: self session."
		"Always use autologin"
		user useAutologin: true.
		
		self session
			loginUser: user remember: true;
			externalUser: nil.

		"The parent component will then do the steps for reload the app and login, if this component answers"
		self answer
	] ifFalse: [ loginErrorMessage := 'publicHome:codeInvalid't ]
