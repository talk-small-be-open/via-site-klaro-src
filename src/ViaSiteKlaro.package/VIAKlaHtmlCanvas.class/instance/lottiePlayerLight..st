as yet unclassified
lottiePlayerLight: anAnimationPath
	| id |
	id := self nextId.
	
	self div id: 'debug-div'.

	self div id: id; style: 'border: 1px #000000 solid'.
	
	self script: 'jlottie.loadAnimation({
container: document.getElementById("', id, '"),
loop: true,
autoplay: true,
useWebWorker: false,
debug: true,
debugAnimation: true,
debugContainer: document.getElementById("debug-div"),
path: "', anAnimationPath, '"
});'