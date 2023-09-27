as yet unclassified
prepareExercise: anExercise
	| answerHolder  |
	answerHolder := anExercise answerOf: self.
	answerHolder presetValue: VIAKlaSpeedReadTextAnswerItem new.