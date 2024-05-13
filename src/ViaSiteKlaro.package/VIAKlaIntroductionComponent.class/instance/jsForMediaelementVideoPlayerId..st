as yet unclassified
jsForMediaelementVideoPlayerId: aVideoId
	| options js |

	options := {
		'pauseOtherPlayers'->true.
		'alwaysShowControls'->false.
		'alwaysShowHours'->false.
		'showTimecodeFrameCount'->false.
		'stretching'->'responsive'.
		'showPosterWhenEnded'->false.
} aD.

	js := JSStream new.
	js
		nextPutAll: 'const player = $("#';
		nextPutAll: aVideoId;
		nextPutAll: '").mediaelementplayer';
		arguments: { options }.
"		nextPutAll: ';player.addEventListener(""pause"", function() {alert(""jhj"")});'."

	^ js