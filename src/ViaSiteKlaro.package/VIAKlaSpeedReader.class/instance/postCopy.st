accessing
postCopy
	super postCopy.
	
	texts := texts copyWithCopiedElements.
	
	"Parent Referenz wiederherstellen"
	texts do: [:each |
		each speedReaderTaskBrick: self ]