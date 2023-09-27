initialization
finish
	gameMode := #finished.
	
	"TODO: Check if reward is new, suppress otherwise"
	"self showReward."
	
	"Will close this exerciser, which in turn will end the task, etc."
	self close
