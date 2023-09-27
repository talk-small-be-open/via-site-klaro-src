baselines
baseline: spec
	<baseline>
	| viaRepo |
	
	viaRepo := 'github://talk-small-be-open/via-base-src:klaro-master/src'.

	spec for: #'common' do: [
		spec baseline: 'Via' with: [
			spec
				repository: viaRepo;
				loads: #('default')
		].
	
		spec baseline: 'ViaWithTests' with: [
			spec
				repository: viaRepo;
				loads: #('default' 'Tests');
				className: 'BaselineOfVia'.
		].
	

		spec package: 'ViaSiteKlaro' with: [
			spec 
				requires: #('Via')].

"		spec package: 'ViaSiteKlaro-Tests' with: [
			spec 
				requires: #('ViaSiteKlaro' 'ViaWithTests')]."


		spec
			group: 'default' with: #('Core' );
			group: 'Development' with: #('default' 'Tests' );
			group: 'Core' with: #('ViaSiteKlaro' );
			group: 'Tests' with: #('ViaWithTests' "'ViaSiteKlaro-Tests'" ).
		].