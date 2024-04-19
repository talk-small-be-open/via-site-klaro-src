as yet unclassified
couponCode
	^ String streamContents: [ :s |
		s << code1.
		code2 ifNotBlank: [
			s << '-'.
			s << code2 ].
		code3 ifNotBlank: [
			s << '-'.
			s << code3 ].
	]