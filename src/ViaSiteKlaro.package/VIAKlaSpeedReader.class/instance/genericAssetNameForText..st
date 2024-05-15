as yet unclassified
genericAssetNameForText: aString
	| replacements string |
	replacements := {
		'?'->'_'.
"		'ö'->'oe'.
		'ü'->'ue'."
	} asDictionary.
	
	string := aString.
	
	replacements keysAndValuesDo: [ :find :replace |
		string := string copyReplaceAll: find with: replace.
	].

"	string := string onlyLetters.
	string := VIAHelper normalizeAccents: string."

	^ string