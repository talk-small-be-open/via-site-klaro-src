as yet unclassified
taskIsFinished

	"Check if we have just finished the whole module"
	| stationPage animation |
	((moduleWasFinished = false) and: [ moduleExercise isFinished ]) ifTrue: [
		self moduleIsFinishedForFirstTime.
		^ self
	].

	stationPage := (self pager pageNamed: 'station').
	animation := (VIAKlaAnimation named: '01-HW-Uebergang-Bravo' css: 'finish').
	self pager uiGotoPage: stationPage showAnimation: animation in: 'appear' out: 'slide'.


"	self uiGotoPageNamed: 'station'."