as yet unclassified
loginWithCode
	| success user errorDetail |

	success := true.
	errorDetail := ''.
	
	antibot isOk ifFalse: [ success := false. errorDetail := 'Antibot' ].

	success ifTrue: [
		self isCouponCodeSyntaxValid ifFalse: [ success := false. errorDetail := 'Syntax' ].
	].

	success ifTrue: [
		(VIAKlaHepUser checkCouponValid: self couponCode) ifFalse: [ success := false. errorDetail := nil. "'hep'" ].
	].

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
			loginMethod: 'hep-coupon';
			externalUser: nil.

		"The parent component will then do the steps for reload the app and login, if this component answers"
		self answer
	] ifFalse: [
		loginErrorMessage := String streamContents: [ :s |
			s << ('publicHome:codeInvalid't).
			errorDetail ifNotBlank: [ :d |
				s << ' ('.
				s << d.
				s << ')'.
			]
		]
	]
