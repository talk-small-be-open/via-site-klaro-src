initialization
refresh

	| modules |
	modules := (1 to: 18) collectNonBlank: [ :each |
		self wd findModuleByIndexCode: each asString ].

	moduleExercises := modules collect: [ :each | self currentPortfolio exerciseForModule: each ].

	"Ensure setup full empty structure"
	moduleExercises do: [ :each | each ensureBuildAllTaskExercises ].
	
	nextExercise := moduleExercises detect: [ :each | each isFinished not ] ifNone: [ nil ].