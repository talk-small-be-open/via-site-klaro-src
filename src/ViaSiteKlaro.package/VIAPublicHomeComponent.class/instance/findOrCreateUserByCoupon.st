as yet unclassified
findOrCreateUserByCoupon
	| quasiSocialId |
	
	"We treat the coupon code like a unique ID (which it is) from hep for the local user identification"
	
	quasiSocialId := 'hep_coupon_', self couponCode.
	
	^ self wd findOrCreateUserBySocialId: quasiSocialId email: nil.