rendering
renderPersonalDataOn: html
"	html heading t: 'myProfile:title'."
"	html heading level3; t: 'myProfile:personalData'."


	"Will only be one in practice"
	user socialIds do: [ :each |
		html div class: 'topBuffer'; with: [
			html sT: 'myProfile:coupon'.
			html space.
			html html: '&hellip;'.
			html span: (each lastAtMost: 5) ] ]