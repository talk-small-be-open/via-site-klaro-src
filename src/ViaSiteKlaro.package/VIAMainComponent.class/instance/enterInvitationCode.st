actions
enterInvitationCode
	| component |
	component := VIAAurMyProfileComponent new.

	self coreComponent: component.
	
	"Hm, seaside hackish?"
	component enterInvitationCode