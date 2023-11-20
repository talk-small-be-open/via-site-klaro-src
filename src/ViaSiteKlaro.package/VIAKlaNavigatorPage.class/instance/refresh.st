initialization
refresh

	| modules |
	modules := (1 to: 18) collectNonBlank: [ :each |
		self wd findPublicModuleByIndexCode: each asString ].

	moduleExercises := modules collect: [ :each | self currentPortfolio exerciseForModule: each ].

	"Ensure setup full empty structure"
	moduleExercises do: [ :each | each ensureBuildAllTaskExercises ].
	
	currentExercise := moduleExercises detect: [ :each | each isFinished not ] ifNone: [ moduleExercises last ].
	
	lastInWorkExercise := moduleExercises reversed detect: [ :each | each isInWork or: [ each isFinished ] ] ifNone: [ nil ].