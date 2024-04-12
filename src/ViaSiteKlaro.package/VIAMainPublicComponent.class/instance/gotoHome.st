as yet unclassified
gotoHome
	"This component contains the login logic, so we have to reload the app,
	to make a login complete"
	self coreComponent: VIAPublicHomeComponent new onAnswer: [ self login ]