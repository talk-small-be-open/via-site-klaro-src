as yet unclassified
javascriptContentOn: aStream

	aStream
		nextPutAll: 'anime.set(';
		javascript: targets;
		nextPutAll: ',';
		javascript: values;
		nextPutAll: ');'