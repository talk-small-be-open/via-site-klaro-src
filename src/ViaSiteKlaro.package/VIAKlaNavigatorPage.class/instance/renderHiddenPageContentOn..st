rendering
renderHiddenPageContentOn: html
	"We load the Navigator always in full, to have it statically there"
	self renderPageContentOn: html