testing
isCouponCodeSyntaxValid
	| code |
	code := self couponCode.
	
	code ifBlank: [ ^ false ].
	
	"..."
	
	^ true