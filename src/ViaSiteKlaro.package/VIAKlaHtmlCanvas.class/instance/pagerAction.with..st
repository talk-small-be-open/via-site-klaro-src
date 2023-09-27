pager
pagerAction: aCallbackBlock with: aBlock
	"Like an anchor inside the page. Runs the callback and reloads just that page.
	Like a minibrowser."
	
	self span
		class: 'pagerAnchor';
		onClick: (self jsPagerAction: aCallbackBlock);
		with: aBlock