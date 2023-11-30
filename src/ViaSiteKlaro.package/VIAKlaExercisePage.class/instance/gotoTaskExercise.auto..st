actions
gotoTaskExercise: aTaskExercise auto: aBoolean

	moduleExercise := aTaskExercise moduleExercise.

"	(aModule canView: self currentUser) ifFalse: [ self inform: 'main:accessDenied'. ^ self ]."

	"Suche ein Module, welches schon im Portfolio ist, auch wenn veraltet"
"	myModuleInWork := (self currentPortfolio newestModuleOfFamily: aModule)
		ifNil: [aModule]."
		
"	myModuleInWork ~= aModule ifTrue: [
		self flashMessage: 'main:otherVersionIsInYourPortfolio't
	]."

	"TBD: Auto-Update module?"

"	self currentPortfolio
		lastOpenedModule: aModule."

"	self session currentModule: aModule."

	moduleExerciser := (VIAKlaModuleExerciser fromModuleExercise: moduleExercise).

	moduleExerciser gotoTask: aTaskExercise task.

	aBoolean ifTrue: [ moduleExerciser gotoModeAutomatic ].
	
	moduleExerciser onAnswer: [ self taskIsFinished ].
