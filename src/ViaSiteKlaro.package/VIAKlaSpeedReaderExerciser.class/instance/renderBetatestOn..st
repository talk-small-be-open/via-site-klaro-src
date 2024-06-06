rendering
renderBetatestOn: html
	self renderBetatestOn: html with: [
		html span: 'BETATEST SPEED READER: '.
		html anchor callback: [ self restart ]; with: 'Restart'.
		html space.
		html anchor callback: [ self gotoModeAutomatic ]; with: 'Goto-Auto'.
		html space.
		html anchor callback: [ self betatestFakeAllDone ]; with: 'All-Done'.
		html space.
		html anchor callback: [ self betatestFake99Done ]; with: '99%-Done'.
	].
