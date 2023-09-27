rendering-visitor
renderTextListInput: aTextListInput on: html
	| answerValue answerCollection mainId shuffledHintFragments |

	answerValue := exercise answerOf: aTextListInput.
	answerCollection := answerValue value.
	mainId := html nextId.
	
	shuffledHintFragments := exercise propertyAt: #shuffledHintFragments of: aTextListInput.

	html div
		id: mainId;
		class: 'textListInput';
		class: aTextListInput uiStyle;
		with: [

"		html hintBox: 'selectMany:seeTutorial'."

			self renderHintSymbolOf: aTextListInput on: html.
			
			"List of clickable hint texts"
			shuffledHintFragments ifNotBlank: [ :fragments |
				html div class: 'hintFragments'; with: [
					fragments do: [ :each |
						html span
							class: 'hintFragment';
							onClick: ( (JSStream on: 'listInput_addText') apply: { mainId. each. } );
							with: each
					].

					html div class: 'hintTools'; with: [
						html clickButton: ( (JSStream on: 'listInput_addSpace') apply: { mainId } ) with: [
"							html iconSpace; space."
							html text: 'Leerschlag' ].
						
						html space.

						html clickButton: ( (JSStream on: 'listInput_gotoNextLine') apply: { mainId } ) with: [
							html iconNewline; space.
							html text: 'Weiter' ] ]

				]
			].
			
			html div class: 'textInputs'; with: [
				answerCollection withIndexDo: [:text :index |
					| isCorrect isWrong |
					text ifNotBlank: [
						isCorrect := aTextListInput isSolution: text.
						isWrong := isCorrect not ].

					html div: [
						| id jsSave |
"						html span class: 'lineNumber'; with: index asString."
						
						"JS for locally saving the last focused cursor position"
						jsSave := ((html jQuery id: mainId)
							dataAt: 'lastInputElement' put: (JSStream this);
							dataAt: 'lastPosition' put: (JSStream this access: 'selectionStart')
						).
						
						html textInput
							noAuto;
							id: (id := html nextId);
							class: 'textListInput';
							class: 'wrong' if: (self isca: isWrong);
							class: 'correct' if: (self isca: isCorrect);
							onClick: jsSave;
							onKeyUp: jsSave;
							callback: [ :value |
								answerCollection at: index put: (self sanitizeUserTextInput: value).
							];
							with: text.

						html span
							class: 'clearLine';
							onClick: (((html jQuery id: id) value: '') removeClass: 'correct wrong') triggerFocus;
							with: [ html iconDelete ]
					]]].
		
			html ukSubmitButton
				callback: [ answerCollection addAll: (Array new: 5 withAll: nil) ];
				with: '... Zeilen hinzufügen'.
			html ukSubmitButton
				callback: [ answerCollection removeAllSuchThat: [ :each | each isBlank ] ];
				with: 'Leere Zeilen entfernen'
		]