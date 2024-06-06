as yet unclassified
betatestFake99Done

	self allTexts allButLast do: [ :each |
		| answerOfText |

		answerOfText := (self exercise answerOf: each) value.
		answerOfText beDoneManual.
		answerOfText beDoneAutomatic.
		
	].

	currentTextNumber := self maxTextNumber - 1.
	self gotoStepListen.

	self gotoNext
