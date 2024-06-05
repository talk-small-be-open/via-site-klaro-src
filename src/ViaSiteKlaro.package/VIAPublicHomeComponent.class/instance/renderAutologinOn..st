rendering
renderAutologinOn: html
	self session autologinUsers ifNotBlank: [ :users |
		html heading level2; sT: 'publicHome:autologin'.
		html div class: 'autologinUsers'; with: [ 
			(users sortedBy: [ :each | each firstName ]) do: [ :each |
				html spanButton class: 'autologinUser'; with: [
					html anchor
						class: 'autologinUser';
						callback: [ self autologinUser: each ];
						with: each firstName.
					html anchor
						class: 'remove';
						callback: [ self removeAutologinUser: each ];
						with: [ html iconClose ]

				]
			]
		]
	]