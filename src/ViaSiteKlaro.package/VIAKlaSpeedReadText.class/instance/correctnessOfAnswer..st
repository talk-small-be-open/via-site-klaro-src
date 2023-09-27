as yet unclassified
correctnessOfAnswer: aSpeedReadTextAnswerItem
	"aValue ist VIAKlaSpeedReadTextAnswerItem"
	aSpeedReadTextAnswerItem isDoneAutomatic ifTrue: [ ^ 100 ].
	aSpeedReadTextAnswerItem isDoneManual ifTrue: [ ^ 50 ].
	^ 0