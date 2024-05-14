testing
isCouponCodeSyntaxValid
	| code regexp |
	code := self couponCode.
	
	code ifBlank: [ ^ false ].

"	code1 ifBlank: [ ^ false ].
	code2 ifBlank: [ ^ false ].
	code3 ifBlank: [ ^ false ]."
	
	regexp := (self db propertyAt: #hep:klaro:couponRegex).
	
	regexp ifNotBlank: [
		(code matchesRegexIgnoringCase: regexp) ifFalse: [ ^ false ].
	].

	"TODO more? ..."
	
	^ true