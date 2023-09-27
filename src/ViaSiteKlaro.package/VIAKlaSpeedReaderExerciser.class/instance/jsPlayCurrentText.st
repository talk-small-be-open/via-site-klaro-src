as yet unclassified
jsPlayCurrentText
	^ JSStream on: ('PIXI.sound.play("', (self currentAudioAsset uuidString), '");')