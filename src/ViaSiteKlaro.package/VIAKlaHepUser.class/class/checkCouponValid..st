as yet unclassified
checkCouponValid: aString
	| token data |
	token := self getClientToken.

	"TODO: Maybe catch VIAHepUserError?"
	
	data := self getCouponData: aString clientToken: token.
	
	data ifNil: [ ^ false ].
	
	"TODO check for klaro app: data at: 'products' includes: 'KLARO...' if not then abort"

	"Check if coupon is active.
	TODO: Is that OK? Can it be non-activated?"
	(data at: 'is_active') = true ifFalse: [ ^ false ].

	"Check if we have to automatically initially redeem the coupon to the Klaro pseudo user. At this point the coupon is valid. But maybe still not initially activated. We do that now
	TODO use correct ID of that user. Maybe store it in DB config?"
	(data at: 'redeemed') = false ifTrue: [ self postRedeemCoupon: aString forUser: '9999999999999999bogus' clientToken: token ].
	
	"All good!"
	^ true