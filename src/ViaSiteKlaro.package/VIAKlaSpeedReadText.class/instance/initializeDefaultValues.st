accessing
initializeDefaultValues
	super initializeDefaultValues.
	textPillar ifNil: [ textPillar := VIAPillarObject new ]