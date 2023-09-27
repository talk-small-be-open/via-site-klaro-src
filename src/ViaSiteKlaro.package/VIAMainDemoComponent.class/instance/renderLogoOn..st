rendering
renderLogoOn: html
	html anchor class: 'uk-logo aureaLogo'; callback: [self gotoHome]; with: [
		html logoKlaro.
		html demoLabel.
	].
