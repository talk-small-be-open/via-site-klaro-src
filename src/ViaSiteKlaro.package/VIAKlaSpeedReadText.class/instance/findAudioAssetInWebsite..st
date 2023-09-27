as yet unclassified
findAudioAssetInWebsite: aWebsite
	| genericName asset |

	genericName := self suggestedGenericAssetName.

	asset := aWebsite data assets detect: [ :each | each title = genericName ] ifNone: [ nil ].

	self audioAsset: asset