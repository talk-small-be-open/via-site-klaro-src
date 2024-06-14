as yet unclassified
betatestFake99Done

	self allTexts allButLast do: [ :each |
		| answerOfText |

		answerOfText := (self exercise answerOf: each) value.
		
		self isModeManual ifTrue: [
			answerOfText beDoneManual ].
		self isModeAutomatic ifTrue: [
			answerOfText beDoneAutomatic ].
	].

	self implicitCheckTask.

	currentTextNumber := self maxTextNumber - 1.
	self gotoStepListen.

	self gotoNext
