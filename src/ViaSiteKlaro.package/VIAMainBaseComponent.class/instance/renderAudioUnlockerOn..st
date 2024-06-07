rendering
renderAudioUnlockerOn: html
	html div id: 'audioUnlocker'; style: 'display: none'; with: [
"		html span class: 'standardButton'; with: 'Ton einschalten'."
		html imgSignSound.
		html paragraph with: [
			html pT: 'audioUnlocker:text'.
		]
	]