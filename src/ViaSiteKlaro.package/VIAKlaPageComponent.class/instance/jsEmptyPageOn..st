as yet unclassified
jsEmptyPageOn: js
	^ ((js jQuery id: htmlId) empty)
	
"	(('document.getElementById(""', htmlId,'"").innerHtml = """"') asJsStream),
	(('console.log(""empty page ', htmlId, '"")') asJsStream)"