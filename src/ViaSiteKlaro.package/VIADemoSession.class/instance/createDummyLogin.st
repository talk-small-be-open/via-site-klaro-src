as yet unclassified
createDummyLogin
	| firstnames lastnames |
	firstnames := #(Delphine Agostino Tinko Godwin Erlina Barney Jantje Chuck Wilbert Admira Riano Mechthild Biljana Floranda Valerina Lorella Hank Olympia Ilda Neron Kaitlynn Peeke Signe).
	lastnames := #(Kleiner Brodbeck Mussi Philipp).

	user := VIADemoUser new firstName: firstnames atRandom; lastName: lastnames atRandom; yourself.