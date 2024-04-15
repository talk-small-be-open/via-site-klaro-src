as yet unclassified
jsPlayCurrentTextThen: aJsCallbackScript
	| js |
	
	self currentAudioAsset ifNil: [ 

		"Having no audio is like having a zero-length audio. Its like immediately played"
		js := aJsCallbackScript

	] ifNotNil: [ :audio |

		| playIt |

		js := JSScript new.
		
		playIt := (js pixiSoundPlay audioAsset: audio).

		aJsCallbackScript ifNotBlank: [ playIt onComplete: aJsCallbackScript ].
		
		js << playIt
		
	].

	^ js