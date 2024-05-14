rendering
renderTopbarOn: html

	"Render menu container in advance"
	| menuId |
	self hasMenu ifTrue: [
		menuId := self renderOffcanvasMenuOn: html ].

	html div
		class: 'topbar';
		with: [ "	self renderOffcanvasOn: html."
			html div
				class: 'topbarLeft';
				with: [
					self renderTopbarLeftOn: html ].
			html div
				class: 'topbarCenter';
				with: [
					self renderTopbarCenterOn: html.
				].
			html div
				class: 'topbarRight';
				with: [
					self hasMenu ifTrue: [
						html anchor
							class: 'pageMenuToggler';
							onClick: ((html jQuery id: menuId) addClass: 'slideIn');
							with: [
	"							html text: 'MENU'"
								html iconMenu ] ] ].

		] 