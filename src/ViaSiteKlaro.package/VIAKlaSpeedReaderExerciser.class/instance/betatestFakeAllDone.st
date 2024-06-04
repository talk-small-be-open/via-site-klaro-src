as yet unclassified
betatestFakeAllDone

	self allTexts do: [ :each |
		| answerOfText |

		answerOfText := (self exercise answerOf: each) value.
		answerOfText beDoneManual.
		answerOfText beDoneAutomatic.
		
	].

	self implicitCheckTask.
	self finish