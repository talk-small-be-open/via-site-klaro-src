adding
add: aPage named: aNameString
	"Ensure references"
	aPage
		name: aNameString;
		pager: self.
	
	pages at: aNameString put: aPage