rendering
jsPrepareStageOn: html
	| updateScript |

	"Does some initial preparations of the base stage"
	
	updateScript := JSScript new.

	"Test add circle"
	updateScript addLiteral: '
var station, kreis, kreisX;
const kreisTemplate = SVG("#Kreis_klein_01");
'.
	

	"Draw every stations small circles"
	moduleExercises do: [ :each |
		| num  |
		num := each module indexCode firstNumber asTwoCharacterString.
		"Add small circles"
		each taskExercises withIndexDo: [ :eachTaskEx :index |
			| kreisId |
			kreisId := 'Kreis_klein_', num, '_', index asTwoCharacterString.

			updateScript addLiteral: ('station = SVG("#Kreis_gross_', num, '");').
			updateScript addLiteral: ('kreisX = station.x() + station.width() + 4 + (', (index-1) asString,' * (kreisTemplate.width()+4));').
			updateScript addLiteral: ('kreis = station.parent().put(kreisTemplate.clone()).x(kreisX).cy(station.cy());').
			updateScript addLiteral: ('kreis.attr("id", "', kreisId, '")').
		].
	].	

	^ updateScript