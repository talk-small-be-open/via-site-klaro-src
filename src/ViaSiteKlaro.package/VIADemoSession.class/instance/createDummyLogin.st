as yet unclassified
createDummyLogin
	| firstnames lastnames |
	firstnames := #(Delphine Aradia Admira Floranda Valerina Lorella Adelinda Evander Finn Janus Lysander).
	lastnames := #(Klarexis).

	user := VIADemoUser new firstName: firstnames atRandom; lastName: lastnames atRandom; yourself.