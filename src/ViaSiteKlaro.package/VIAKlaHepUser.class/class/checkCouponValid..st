as yet unclassified
checkCouponValid: aString
	| token data klaroAppUserId klaroAppId klaroAppPlatform |

	klaroAppUserId := (self db propertyAt: #hep:klaro:shopUserId) asInteger.
	klaroAppId := (self db propertyAt: #hep:klaro:shopAppId) asInteger.
	klaroAppPlatform := (self db propertyAt: #hep:klaro:shopPlatform) asString.

	token := self getClientToken.

	"TODO: Maybe catch VIAHepUserError?"
	
	data := self getCouponData: aString clientToken: token.
	
	data ifNil: [ ^ false ].

"	data inspect."
	
	"check for klaro app:"
	((data at: 'products') first at: 'id') = klaroAppId ifFalse: [ ^ false ].

	"Check if coupon is active.
	TODO: Is that OK? Can it be non-activated?"
	(data at: 'is_active') = true ifFalse: [ ^ false ].


	"TODO Evt. testen auf redeemable_at_platform"

	"Check if we have to automatically initially redeem the coupon to the Klaro pseudo user.
	At this point the coupon is valid. But maybe still not initially activated. We do that now"
	"TODO: Platform 'beook' ist vermutlich falsch"
	(data at: 'redeemed') = false ifTrue: [ self postRedeemCoupon: aString forUser: klaroAppUserId platform: klaroAppPlatform clientToken: token ].
	
	"All good!"
	^ true