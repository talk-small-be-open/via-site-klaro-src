as yet unclassified
findAudioAssetInWebsite: aWebsite
	| genericName asset |

	genericName := self suggestedGenericAssetName.

	asset := (aWebsite data findAssetsByTitle: genericName) firstOrNil.

	self audioAsset: asset