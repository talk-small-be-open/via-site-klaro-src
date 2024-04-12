actions
openLoginDialogEmail: aString local: aBoolean
	| login |
	login := self am loginComponentClass new.

	login email: aString.

	aBoolean ifTrue: [ login beLocalEnabled ].
	
	self coreComponent: login onAnswer: [:answer |
		answer = true ifTrue: [self login]
	]