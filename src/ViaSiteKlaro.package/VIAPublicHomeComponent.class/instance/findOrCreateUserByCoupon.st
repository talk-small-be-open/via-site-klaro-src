as yet unclassified
findOrCreateUserByCoupon
	| quasiSocialId user coupon |
	
	"We treat the coupon code like a unique ID (which it is) from hep for the local user identification"
	
	coupon := self couponCode.
	
	quasiSocialId := 'hep_coupon_', coupon.
	
	user := self wd findOrCreateUserBySocialId: quasiSocialId email: nil.
	
	"We double store the coupon code, which is in the social-id, but that could change and
	is not in bare format"
	user properties at: 'hepCouponCode' put: coupon.
	
	
	^ user