as yet unclassified
gotoNext
	| answerOfText |

	self isStepListen ifTrue: [
		
		"Mark current text as *done*, and check-calculate points"
		answerOfText := (self exercise answerOf: self currentText) value.
		self isModeManual ifTrue: [ answerOfText beDoneManual ].
		self isModeAutomatic ifTrue: [ answerOfText beDoneAutomatic ].

		"At the end of the word, we simulate a check-button click implicitly"
		self implicitCheckTask.
		
		self isLastText ifTrue: [
			self isModeManual ifTrue: [ self gotoAnimationThenModeAutomatic. ^ self ].
			self isModeAutomatic ifTrue: [ self finish. ^ self ]
		] ifFalse: [ self gotoNextText. ^ self ]
	].

	self gotoNextStep