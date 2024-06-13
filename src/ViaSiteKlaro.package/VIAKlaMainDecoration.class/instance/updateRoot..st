as yet unclassified
updateRoot: anHtmlRoot
	super updateRoot: anHtmlRoot.

	self updateRootEssentials: anHtmlRoot.

"	self updateRootStandardJsUiLibs: anHtmlRoot."
	anHtmlRoot javascript defer; url: '/js/interact.min.js'.


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
	anHtmlRoot javascript
"		defer;"
		url: '/site/js/lottie/dotlottie-player.mjs';
"		url: 'https://unpkg.com/@dotlottie/player-component@2.7.12/dist/dotlottie-player.mjs';" "unklar, ob beste player variante"
"		url: 'https://unpkg.com/@lottiefiles/dotlottie-wc@latest/dist/dotlottie-wc.js';" "Vermutlich neuste Entwicklung 2024, aber nicht stabil"
		type: 'module'.
"		url: 'https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js'."
"		url: '/site/js/lottie/lottie-player.js'."

	"EXPERIMENTAL. Second lightweight lottie player. Offiziell archiviert, aber von einem fork genommen:"
"	anHtmlRoot javascript url: '/site/js/lottie/jlottie.min.js'."

	"PixiJS sound. Nicht defer. Sound kommen manchmal direkt beim reload"
"	anHtmlRoot javascript url: 'https://unpkg.com/pixi.js@7.2.4/dist/pixi.min.js'.
	anHtmlRoot javascript url: 'https://unpkg.com/@pixi/sound@5.2.1/dist/pixi-sound.js'."
	anHtmlRoot javascript url: '/site/js/pixi/pixi.min.js'.
	anHtmlRoot javascript url: '/site/js/pixi/pixi-sound.js'.

	"Preloading school font, avoid initial flicker"
	anHtmlRoot link
		relationship: 'preload';
		attributeAt: 'as' put: 'font';
		attributeAt: 'crossorigin' put: 'anonymous';
		type: 'font/woff2' seasideMimeType;
		url: 'fonts/DCH-Basisschrift.woff2'.
		
