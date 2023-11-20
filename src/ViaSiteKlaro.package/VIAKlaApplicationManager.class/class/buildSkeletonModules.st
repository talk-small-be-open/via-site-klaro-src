as yet unclassified
buildSkeletonModules
	| website wd |
	website := self db websites first.
	wd := website data.

	(1 to: 18) do: [ :each |
		| module |

		module := (wd findModuleByIndexCode: each asString) ifNil: [ 
			| new |
			new := VIAModule new.
			
			new
				website: website;
				indexCodeString: each asString.
"				addAuthorUser: self currentUser."
			
			wd addModule: new.
		
		].
	
		module tasksCount = 0 ifTrue: [
			| task |
			task := VIACompositeTask new.
			task title: 'Übung 1'.
			module addTask: task.
		].
	
		module releaseNow.
	]