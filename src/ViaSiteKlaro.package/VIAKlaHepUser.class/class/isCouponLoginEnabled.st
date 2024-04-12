testing
isCouponLoginEnabled
	^ (self db propertyAt: #hep:couponauth:enabled default: [ false ]) and: [self oauthId notBlank]