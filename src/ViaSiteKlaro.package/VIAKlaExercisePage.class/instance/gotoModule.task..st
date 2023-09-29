obsolete
gotoModule: aModule task: aTask
	| myModuleInWork |

	(aModule canView: self currentUser) ifFalse: [ self inform: 'main:accessDenied'. ^ self ].

	"Suche ein Module, welches schon im Portfolio ist, auch wenn veraltet"
	myModuleInWork := (self currentPortfolio newestModuleOfFamily: aModule)
		ifNil: [aModule].
		
	myModuleInWork ~= aModule ifTrue: [
		self flashMessage: 'main:otherVersionIsInYourPortfolio't
	].

	"TBD: Auto-Update module?"

	self currentPortfolio
		addModule: aModule;
		lastOpenedModule: aModule.

	self session currentModule: aModule.

	moduleExerciser := (VIAKlaModuleExerciser fromModule: aModule).

	moduleExerciser onAnswer: [ self moduleIsFinished ].

	aTask ifNotNil: [
		moduleExerciser gotoTask: aTask ].