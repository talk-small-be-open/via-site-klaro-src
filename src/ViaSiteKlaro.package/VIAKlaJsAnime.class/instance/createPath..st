paths
createPath: aCssSelector
	| name id |
	id := UUID new asString36.
	name := 'anime_path_', id.
	paths add: { name. aCssSelector }.
	
	^ name