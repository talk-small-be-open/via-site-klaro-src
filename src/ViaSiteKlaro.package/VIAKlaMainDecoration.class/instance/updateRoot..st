as yet unclassified
updateRoot: anHtmlRoot
	super updateRoot: anHtmlRoot.

	self updateRootEssentials: anHtmlRoot.
"	self updateRootCookieConsent: anHtmlRoot.
	self updateRootFontawesome: anHtmlRoot."
"	self updateRootDefaultUi: anHtmlRoot."
	self updateRootSite: anHtmlRoot.
	
	"OPTIMIZE: Performance?"
	self updateRootPwa: anHtmlRoot.

	"Lottie Player"
	anHtmlRoot javascript
		defer;
		url: 'https://unpkg.com/@dotlottie/player-component@latest/dist/dotlottie-player.mjs';
		type: 'module'.

	"PixiJS sound"
	anHtmlRoot javascript defer; url: 'https://unpkg.com/pixi.js@7.2.4/dist/pixi.min.js'.
	anHtmlRoot javascript defer; url: 'https://unpkg.com/@pixi/sound@5.2.1/dist/pixi-sound.js'.

	"Anime.js"
	anHtmlRoot javascript defer; url: '/site/js/anime/anime.min.js'.
