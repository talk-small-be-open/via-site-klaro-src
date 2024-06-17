as yet unclassified
allRegularTexts
	^ self allTexts reject: [ :each | each styleName = 'magic-spell' ]