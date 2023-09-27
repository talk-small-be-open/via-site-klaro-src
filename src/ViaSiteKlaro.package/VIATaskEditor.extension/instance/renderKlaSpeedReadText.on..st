*ViaSiteKlaro
renderKlaSpeedReadText: aSpeedReadText on: html
	| assets |
	assets := (self wd audioAssets sortedReversedBy: [ :each | each createdAt ]).

	self renderInputEditorFor: aSpeedReadText on: html with: [

		html skRow: [
			html skColumnWidth: 'four' with: [
				html textInput
					on: #text of: aSpeedReadText.
				html select
					list: aSpeedReadText possibleStyleNames;
					beOptional;
					on: #styleName of: aSpeedReadText
				].

			html skColumnWidth: 'four' with: [
				html selectize
					list: assets;
					labels: [ :each | each displayName ];
					beOptional;
					on: #audioAsset of: aSpeedReadText ].

			html skColumnWidth: 'four' with: [
				aSpeedReadText audioAsset
					ifNil: [
						html badgeWarning: 'no audio found'.
						html span: aSpeedReadText suggestedGenericAssetName.
					]
					ifNotNil: [ :asset |
						html audio
							controls: true;
							url: asset audioUrl ].
			]
		]
	]