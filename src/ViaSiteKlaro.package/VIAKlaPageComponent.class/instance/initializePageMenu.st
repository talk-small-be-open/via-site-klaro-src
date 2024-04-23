initialization
initializePageMenu
	| subMenu entry |

	pageMenu := VIAMenu new.
	
	menuRenderer := VIAKlaOffcanvasMenuRenderer new.

	(pageMenu addEntry: 'menu:klaroStart' action: [ self app gotoKlaroStart ]).
"		icon: 'menuHome'."

	(pageMenu addEntry: 'menu:klaroIntroduction' action: [ self app gotoKlaroIntroduction ]).
"		icon: 'menuIntroduction'."


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

	entry := VIAUrlMenuEntry label: 'menu:info' url: 'https://www.klaro-app.online/'.
"	entry icon: 'menuInfo'."
	pageMenu addEntry: entry.


"	(subMenu addEntry: 'menu:info:disclaimer' send: #openDisclaimer to: self)
		icon: 'menuInfoPage'."

"	subMenu beCollapsed."


"	pageMenu addDivider."

	(pageMenu addEntry: 'menu:messageToSupport' action: [ self app sendMessageToSupport ]).
"		icon: 'menuSupport'."

"	pageMenu addDivider."

"	userLabel := self currentUser accountName."
	(pageMenu addEntry: 'menu:myProfile' action: [ self app gotoMyProfile ]).
"		icon: 'user'."

"	pageMenu addDivider."
		
	(pageMenu addEntry: 'menu:logout' action: [ self app logout ])
"		icon: 'logout';"
		css: 'logout'.

	self ifBetatest: [
		(pageMenu addEntry: 'menu:toggleBetatest' action: [ self app toggleBetatest ])
	]