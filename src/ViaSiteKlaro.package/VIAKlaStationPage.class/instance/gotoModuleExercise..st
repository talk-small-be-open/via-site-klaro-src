actions
gotoModuleExercise: aModuleExercise
	moduleExercise := aModuleExercise.
	
	"Build task exercise objects on the fly. Before even using it,
	but in Klaro we need them in advance"
	moduleExercise ensureBuildAllTaskExercises.

	self refresh