rendering
renderContentOn: html
	html div class: 'klaroLogo'; with: [
		html logoKlaro ].
	
	html div class: 'klaroBanner'; with: [
		html image class: 'bannerImage'; url: '/site/images/public_banner.png'].

	html div class: 'info'; pT: 'publicHome:info'.

	html div class: 'loginSection'; with: [
		loginErrorMessage ifNotBlank: [ html div class: 'error'; with: loginErrorMessage ].
		VIAKlaHepUser isCouponLoginEnabled ifTrue: [
			html form class: 'codeInput'; with: [
				html textInput
					on: #code1 of: self;
"					pattern: '[a-zA-Z]+';"
					placeholder: 'XXXXX'.
				html html: '&mdash;'.
				html textInput
					on: #code2 of: self;
"					pattern: '[0-9]{2}';"
					placeholder: '00'.
				html html: '&mdash;'.
				html textInput
					on: #code3 of: self;
"					pattern: '[a-zA-Z]+';"
					placeholder: 'XXXXX'.
				
				html submitButton
					callback: [ self loginWithCode ];
					sT: 'publicHome:loginWithCode' ].
		].
		
		VIAKlaHepUser isOauthEnabled ifTrue: [
			html anchorButton
"				callback: [ self app openLoginDialog ];"
				url: self oauthAuthorizeUrl;
				target: '_self';
				with: [
					html span: [
						html sT: 'publicHome:login' ] ]
		].

		self ifDevelopment: [
			html div class: 'topBuffer'; with: [
				html anchor
					callback: [ self app openLoginDialog ];
					with: 'DEVELOPMENT Login ...' ]].
	]