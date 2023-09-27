initialization
initialize
	
	super initialize.

	currentExerciser := nil.
	exerciserComponents := nil.
	
	self addContainerDiv.
	
	self addForm
		removeButtons.

"	classification := model overallClassification."
"	subtitleTags := classification contextTags,
		classification grammarTopicTags,
		classification topicTags."
"	isAllMothertongue := model isMothertongue."

	self build