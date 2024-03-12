pager
pagerAction: aCallbackBlock with: aBlock
	"Like an anchor inside the page. Runs the callback and reloads just that page.
	Like a minibrowser."

	"IMPORTANT: We use the event pointerdown, because thats faster in reacting to the finger,
	instead of on-click"
	
	self span
		class: 'pagerAnchor';
"		onClickNoPropagation: (self jsPagerAction: aCallbackBlock);"
		"script: (self jQuery this on: 'pointerdown' do: (
			(
			'event.stopPropagation()' asJsStream, (self jsPagerAction: aCallbackBlock)
			) asFunction: #(event)
		));"
		onFastPointer: (self jsPagerAction: aCallbackBlock);

"		script: (self jQuery this on: 'touchend' do: ('event.stopPropagation()' asFunction: #(event)));"
"		script: (self jsInteract pointer onTapNoPropagation: (self jsPagerAction: aCallbackBlock));"
		with: aBlock