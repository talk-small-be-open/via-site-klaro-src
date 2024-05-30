initialization
initializePageMenu
	| entry infoPageAdder |

	pageMenu := VIAMenu new.
	
	menuRenderer := VIAKlaOffcanvasMenuRenderer new.

	(pageMenu addEntry: 'menu:klaroStart' action: [ self app gotoKlaroStart ]).

	(pageMenu addEntry: 'menu:klaroIntroduction' action: [ self app gotoKlaroIntroduction ]).
	

	infoPageAdder := [ :key | 
		| title |
		title := ('menu:info:', key).
		
		entry := VIAActionMenuEntry label: title action: [ self app showInfoPanel: ('klaro:info:', key) title: title ].
		pageMenu addEntry: entry.
		entry
	].

	infoPageAdder value: 'contents'.
	infoPageAdder value: 'parents'.
	infoPageAdder value: 'experts'.

	(pageMenu addEntry: 'menu:myProfile' action: [ self app gotoMyProfile ]).
		
	(pageMenu addEntry: 'menu:logout' action: [ self app logout ])
		css: 'logout'.

	pageMenu addDivider.

	"Externe URLs"
	entry := VIAUrlMenuEntry label: 'menu:info:contact' url: 'https://www.hep-verlag.ch/support-und-kontakt'.
	entry css: 'small'.
	pageMenu addEntry: entry.
	
	entry := infoPageAdder value: 'imprint'.
	entry css: 'small'.
	
	entry := VIAUrlMenuEntry label: 'menu:info:privacy' url: 'https://www.hep-verlag.ch/datenschutz'.
	entry css: 'small'.
	pageMenu addEntry: entry.
	entry := VIAUrlMenuEntry label: 'menu:info:terms' url: 'https://www.hep-verlag.ch/agb'.
	entry css: 'small'.
	pageMenu addEntry: entry.
	
	
	self ifBetatest: [
		entry := pageMenu addEntry: 'menu:toggleBetatest' action: [ self app toggleBetatest ].
		entry css: 'small'.
	]