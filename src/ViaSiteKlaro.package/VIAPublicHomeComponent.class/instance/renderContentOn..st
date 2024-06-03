rendering
renderContentOn: html
	html div class: 'klaroLogo'; with: [
		html logoKlaro ].
	
	html div class: 'klaroBanner'; with: [
"		html lottiePlayer
			src: ('/site/animations/klara.json');
			loop: true;
			intermission: 5000;
			autoplay: true."
		html imgKlaraWaving.
"		html image class: 'bannerImage'; url: '/site/images/public_banner.png'"
	].
	
				
	html div class: 'info'; pT: 'publicHome:info'.

"Feature noch nicht gutgeheissen, evt. erst nach dem Login	(self session isMobileDevice and: [ self session isStandalonePwa not ]) ifTrue: [
		html div class: 'info'; pT: 'publicHome:pleaseInstallAsPwa'.
	]. "

	html div class: 'loginSection'; with: [
		loginErrorMessage ifNotBlank: [ html div class: 'error'; with: loginErrorMessage ].
		VIAKlaHepUser isCouponLoginEnabled ifTrue: [
			html form with: [
				html render: antibot.
	
				html div class: 'info'; pT: 'publicHome:enterLoginCoupon'.

				html div
					class: 'codeInput';
					script: (( html jQuery this find: 'input') call: 'plusAsTab');
					with: [
					html textInput
						on: #code1 of: self;
						class: 'part1';
						script: (html jQuery this triggerFocus);
"						pattern: '[a-zA-Z]+';"
						placeholder: 'abc'.
					html span: [html html: '&mdash;'].
					html textInput
						on: #code2 of: self;
						class: 'part2';
"						pattern: '[0-9]{2}';"
						placeholder: '12'.
					html span: [html html: '&mdash;'].
					html textInput
						class: 'part3';
						on: #code3 of: self;
"						pattern: '[a-zA-Z]+';"
						placeholder: 'def' ].
				
				html submitButton
					class: 'submitCoupon';
					callback: [ self loginWithCode ];
					sT: 'publicHome:loginWithCode' ].
		].
		
		"Enable that only in test environments. We only use coupons on the live system."
		VIAKlaHepUser isOauthEnabled ifTrue: [
			html anchor
				url: self oauthAuthorizeUrl;
				target: '_self';
				with: [
					html span: [
						html text: 'Login mit hep-Account ...'
						"html sT: 'publicHome:login'" ] ]
		].

		self ifDevelopment: [
			html break.
			html anchor
				callback: [ self app openLoginDialog ];
				with: 'DEVELOPMENT Login ...' ].
			html break.
	].

	html div class: 'hepLogo'; with: [
		html logoHepClaim ].
