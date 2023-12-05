rendering
renderContentOn: html
	html div class: 'klaroLogo'; with: [
		html logoKlaro ].
	
	html div class: 'klaroBanner'; with: [
		html image class: 'bannerImage'; url: '/site/images/public_banner.png'].

	html div class: 'info'; pT: 'publicHome:info'.

	html div class: 'loginSection'; with: [
		VIAKlaHepUser isOauthEnabled ifTrue: [
			html form class: 'codeInput'; with: [
				html textInput placeholder: 'XXX-XXXX-XXX'.
				html submitButton sT: 'publicHome:loginWithCode' ].
			
			html anchorButton
"				callback: [ self app openLoginDialog ];"
				url: self oauthAuthorizeUrl;
				target: '_self';
				with: [
					html span: [
						html sT: 'publicHome:login' ] ]
		] ifFalse: [
			html div pT: 'publicHome:loginDisabled'
		].

		self ifDevelopment: [
			html div class: 'topBuffer'; with: [
				html anchor
					callback: [ self app openLoginDialog ];
					with: 'DEVELOPMENT Login ...' ]].
	]