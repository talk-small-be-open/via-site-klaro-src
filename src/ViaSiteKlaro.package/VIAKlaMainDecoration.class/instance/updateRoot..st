as yet unclassified
updateRoot: anHtmlRoot
	super updateRoot: anHtmlRoot.

	self updateRootEssentials: anHtmlRoot.

"	self updateRootStandardJsUiLibs: anHtmlRoot."
	anHtmlRoot javascript defer; url: 'https://cdn.jsdelivr.net/npm/interactjs@1.10.26/dist/interact.min.js'.


"	self updateRootCookieConsent: anHtmlRoot.
	self updateRootFontawesome: anHtmlRoot."
"	self updateRootDefaultUi: anHtmlRoot."
	self updateRootSite: anHtmlRoot.
	
	"OPTIMIZE: Performance?"
	self updateRootPwa: anHtmlRoot.

	"IMPORTANT: Watch the order of the deferred scripts! They might be dependent"

	"Anime.js"
"	anHtmlRoot javascript defer; url: '/site/js/anime/anime.min.js'."
	"with modifications:"
	anHtmlRoot javascript
		defer;
		url: '/site/js/anime/anime.js'.

	"SVG helper to load files as inline SVG"
	"see https://github.com/shubhamjain/svg-loader"
"	anHtmlRoot javascript defer; url: '/site/js/svg-loader/svg-loader.min.js'."
	"We use our own, much much simpler"
	anHtmlRoot javascript defer; url: '/site/js/svg-loader/svg-loader.js'.

	"SVG manipulation library, see https://svgjs.dev"
	anHtmlRoot javascript defer; url: '/site/js/svgjs/svg.min.js'.

	"Lottie Player"
	"TODO: Stick to a fix version, not latest"
	anHtmlRoot javascript
		defer;
		url: 'https://unpkg.com/@dotlottie/player-component@latest/dist/dotlottie-player.mjs';
		type: 'module'.

	"PixiJS sound"
	anHtmlRoot javascript defer; url: 'https://unpkg.com/pixi.js@7.2.4/dist/pixi.min.js'.
	anHtmlRoot javascript defer; url: 'https://unpkg.com/@pixi/sound@5.2.1/dist/pixi-sound.js'.

