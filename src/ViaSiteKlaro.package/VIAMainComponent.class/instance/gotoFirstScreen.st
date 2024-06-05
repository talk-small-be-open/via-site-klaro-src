actions
gotoFirstScreen

"	self currentUser termsAccepted ifFalse: [ self showAcceptTermsDialog. ^ self ]."

	self currentUser firstName ifBlank: [
		"Remarks: Due to its timing in calling, we can not use seasides show:/call: here"
		self coreComponent: VIAKlaOnboardingComponent new onAnswer: [ self gotoFirstScreen ].
		^ self
	].

	"Show video always if coupon has been entered"
"	(self currentUser loginCount = 1) ifTrue: ["
	self session loginMethod = 'hep-coupon' ifTrue: [
		self coreComponentThenGotoHome: ((VIAKlaIntroductionComponent new)
			autoPlay: false;
			yourself).
			
		^ self
	].

	self gotoHome