as yet unclassified
couponCode
	^ String streamContents: [ :s |
		"Wort"
		s << code1 asUppercase.
		code2 ifNotBlank: [
			s << '-'.
			s << code2 asUppercase ].
		code3 ifNotBlank: [
			s << '-'.
			s << code3 asUppercase ].
	]