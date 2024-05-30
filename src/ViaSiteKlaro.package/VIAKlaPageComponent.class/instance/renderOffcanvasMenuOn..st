rendering
renderOffcanvasMenuOn: html
	| id |
	"Answers the id of the container div"

	html div
		class: 'offcanvasMenu';
		id: (id := html nextId);
		with: [
			html div with: [
				(html clickSpan: ((html jQuery id: id) removeClass: 'slideIn'))
					class: 'offcanvasClose';
					with: [ html iconClose ].

				html div class: 'pageMenuContainer'; with: [
					html div
						class: 'pageMenuItems';
						with: [
							pageMenu acceptRender: menuRenderer on: html
					].

				"uk-position-bottom"
				html div class: 'pageMenuFooter'; with: [
					html logoHepClaim.
					
					self ifBetatest: [ 
						html div class: 'betatestInfo'; with: [
							html span: 'Betatest Infos:'; break.
							html div: self session browserType.
							html div: (self session isStandalonePwa ifTrue: ['PWA standalone']).
						]
					].
				].

			].

		]].

	^ id