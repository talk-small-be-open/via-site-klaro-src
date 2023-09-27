actions
openModule: aModule taskNumber: aTaskNumber

	aModule isForDemo
		ifTrue: [ super openModule: aModule taskNumber: aTaskNumber ]
		ifFalse: [ self inform: 'demo:notAvailableInDemo']
