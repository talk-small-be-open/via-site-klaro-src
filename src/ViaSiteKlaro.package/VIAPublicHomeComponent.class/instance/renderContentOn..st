rendering
renderContentOn: html
	html div class: 'klaroBanner'; with: [
		html image class: 'bannerImage'; url: '/site/images/public_banner.png'].

	html div: [
		html div class: 'loginSection'; with: [
			VIAKlaHepUser isOauthEnabled ifTrue: [
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
		].

		html div pT: 'publicHome:info'.

	]