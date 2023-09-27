enumerating
assetsDo: aBlock
	super assetsDo: aBlock.

	aBlock value: self audioAsset