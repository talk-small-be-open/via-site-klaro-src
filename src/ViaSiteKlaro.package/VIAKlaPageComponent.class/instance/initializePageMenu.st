initialization
initializePageMenu
	| userLabel subMenu entry |

	pageMenu := VIAMenu new.
	
	menuRenderer := VIAKlaOffcanvasMenuRenderer new.

	subMenu := pageMenu addSubMenu.

	subMenu mainEntry: ((VIAActionMenuEntry label: 'menu:klaroStart' action: [ self app gotoKlaroStart ])
		icon: 'menuHome';
		yourself).

	pageMenu addDivider.
	
	userLabel := self currentUser accountName.
	(pageMenu addEntry: userLabel action: [ self app gotoMyProfile ])
		icon: 'user'.

	pageMenu addDivider.

"	self ifTeacher: [
		(pageMenu addEntry: 'menu:myTeacherCockpit' send: #gotoMyTeacherCockpit to: self)
			icon: 'menuTeacher'.
		pageMenu addDivider.
	]."

	
	"Info Menu"
	subMenu := pageMenu addSubMenu.
	
	subMenu mainEntry: ((VIATextMenuEntry label: 'menu:info') icon: 'menuInfo'; yourself).

	{'teacher'->'lehrpersonen'. 'faq'->'faq'. 'press'->'info'. 'about'->'info'. 'support'->'support'} do: [ :each |
		entry := VIAUrlMenuEntry label: ('menu:info:', each key) url: ('https://www.klaro-app.online/', each value).
		entry icon: 'menuInfoPage'.
		subMenu addEntry: entry.
	].

"	#(teacher faq press about support) do: [ :each |
		(subMenu addEntry: ('menu:info:', each) send: #showTextWithBack: to: self arg: ('page:', each))
			icon: 'menuInfoPage'.
	]."

"	(subMenu addEntry: 'menu:info:disclaimer' send: #openDisclaimer to: self)
		icon: 'menuInfoPage'."

	subMenu beCollapsed.



	pageMenu addDivider.

	(pageMenu addEntry: 'menu:messageToSupport' action: [ self app sendMessageToSupport ])
		icon: 'menuSupport'.

	pageMenu addDivider.
		
	(pageMenu addEntry: 'menu:logout' action: [ self app logout ])
		icon: 'logout';
		css: 'logout'.