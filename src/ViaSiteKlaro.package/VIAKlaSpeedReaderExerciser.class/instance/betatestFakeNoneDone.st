as yet unclassified
betatestFakeNoneDone
	self allTexts do: [ :each |
		| answerOfText |

		answerOfText := (self exercise answerOf: each) value.
		answerOfText clear.
		
	].

	self implicitCheckTask.
	
	self restart.
