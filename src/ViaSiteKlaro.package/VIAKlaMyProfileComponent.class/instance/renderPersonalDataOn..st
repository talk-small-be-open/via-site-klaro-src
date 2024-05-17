rendering
renderPersonalDataOn: html
"	html heading t: 'myProfile:title'."
"	html heading level3; t: 'myProfile:personalData'."


	"Will only be one in practice"
	user properties at: 'hepCouponCode' ifPresent: [ :code |
		html div class: 'topBuffer'; with: [
			html sT: 'myProfile:coupon'.
			html space.
"			html html: '&hellip;'."
"			html span: (code lastAtMost: 5)."
			html span: code.
		] ]