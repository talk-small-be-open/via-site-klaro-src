initialization
initializePageMenu
	| entry |

	pageMenu := VIAMenu new.
	
	menuRenderer := VIAKlaOffcanvasMenuRenderer new.

	(pageMenu addEntry: 'menu:klaroStart' action: [ self app gotoKlaroStart ]).
"		icon: 'menuHome'."

	(pageMenu addEntry: 'menu:klaroIntroduction' action: [ self app gotoKlaroIntroduction ]).
"		icon: 'menuIntroduction'."

	pageMenu addDivider.

"	self ifTeacher: [
		(pageMenu addEntry: 'menu:myTeacherCockpit' send: #gotoMyTeacherCockpit to: self)
			icon: 'menuTeacher'.
		pageMenu addDivider.
	]."

	
	"Info Menu"
"	subMenu := pageMenu addSubMenu.
	
	subMenu mainEntry: ((VIATextMenuEntry label: 'menu:info') icon: 'menuInfo'; yourself).

	{'teacher'->'lehrpersonen'. 'faq'->'faq'. 'press'->'info'. 'about'->'info'. 'support'->'support'} do: [ :each |
		entry := VIAUrlMenuEntry label: ('menu:info:', each key) url: ('https://www.klaro-app.online/', each value).
		entry icon: 'menuInfoPage'.
		subMenu addEntry: entry.
	]."

	"Externe URLs"
	entry := VIAUrlMenuEntry label: 'menu:info:videos' url: 'https://www.hep-verlag.ch/klaro#storyvideo'.
	pageMenu addEntry: entry.
	entry := VIAUrlMenuEntry label: 'menu:info:contents' url: 'https://www.hep-verlag.ch/klaro/inhalt'.
	pageMenu addEntry: entry.
	entry := VIAUrlMenuEntry label: 'menu:info:parents' url: 'https://www.hep-verlag.ch/klaro/eltern'.
	pageMenu addEntry: entry.
	entry := VIAUrlMenuEntry label: 'menu:info:experts' url: 'https://www.hep-verlag.ch/klaro/fachpersonen'.
	pageMenu addEntry: entry.


"	(subMenu addEntry: 'menu:info:disclaimer' send: #openDisclaimer to: self)
		icon: 'menuInfoPage'."

"	subMenu beCollapsed."


"	pageMenu addDivider."

"	(pageMenu addEntry: 'menu:messageToSupport' action: [ self app sendMessageToSupport ])."
"		icon: 'menuSupport'."

	pageMenu addDivider.

"	userLabel := self currentUser accountName."
	(pageMenu addEntry: 'menu:myProfile' action: [ self app gotoMyProfile ]).
"		icon: 'user'."

		
	(pageMenu addEntry: 'menu:logout' action: [ self app logout ])
"		icon: 'logout';"
		css: 'logout'.

	pageMenu addDivider.

	"Externe URLs"
	entry := VIAUrlMenuEntry label: 'menu:info:contact' url: 'https://www.hep-verlag.ch/support-und-kontakt'.
	entry css: 'small'.
	pageMenu addEntry: entry.
	
	entry := pageMenu addEntry: 'menu:info:imprint' action: [ self app showTextWithBack: 'aurea:imprint:text' ]. "'https://www.hep-verlag.ch/impressum'."
	entry css: 'small'.
	
	entry := VIAUrlMenuEntry label: 'menu:info:privacy' url: 'https://www.hep-verlag.ch/datenschutz'.
	entry css: 'small'.
	pageMenu addEntry: entry.
	entry := VIAUrlMenuEntry label: 'menu:info:terms' url: 'https://www.hep-verlag.ch/agb'.
	entry css: 'small'.
	pageMenu addEntry: entry.
	
	


	self ifBetatest: [
		(pageMenu addEntry: 'menu:toggleBetatest' action: [ self app toggleBetatest ])
	]