initialization
initializeKlaroMenu
	| subMenu entry |

	subMenu := mainMenu addSubMenu.
"	mainMenu addDivider."

	subMenu mainEntry: ((VIAActionMenuEntry label: 'menu:aurea' send: #gotoKlaroStart to: self)
		icon: 'menuHome';
		yourself).

"	VIAKlaHelper aureaCaputs do: [ :each |
		entry := subMenu addEntry: ('menu:aurea:caput't, ' ', each asString) send: #gotoAureaCaput: to: self arg: each.
	]."

"	entry := subMenu addEntry: 'menu:aurea:vocabulo' send: #gotoSmartVocabula to: self.
	entry := subMenu addEntry: 'menu:aurea:commentatio' send: #gotoSmartCommentatio to: self."
