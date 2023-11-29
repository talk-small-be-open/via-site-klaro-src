rendering
renderOffcanvasMenuOn: html
	| id |
	"Answers the id of the container div"

	html div
		class: 'offcanvasMenu';
		id: (id := html nextId);
		with: [
			html div with: [
				html div
					class: 'offcanvasClose';
					onClick: ((html jQuery id: id) removeClass: 'slideIn');
					with: [ html iconClose ].

				html div class: 'pageMenuContainer'; with: [
					html div
						class: 'pageMenuItems';
						with: [
							pageMenu acceptRender: menuRenderer on: html
					].

				"uk-position-bottom"
				html div class: 'pageMenuFooter'; with: [
					html logoHepClaimInv
				].

			].

		]].

	^ id