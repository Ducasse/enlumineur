Class {
	#name : #BaselineOfEnlumineurFormatter,
	#superclass : #BaselineOf,
	#category : #BaselineOfEnlumineurFormatter
}

{ #category : #baselines }
BaselineOfEnlumineurFormatter >> baseline: spec [
	<baseline>

	spec for: #pharo do: [
		spec package: 'EnlumineurFormatter'.
		spec package: 'EnlumineurFormatter-Tests' with: [ spec requires: #('EnlumineurFormatterUI') ].
		spec package: 'EnlumineurFormatterUI' with: [ spec requires: #('EnlumineurFormatter') ].
		spec package: 'EnlumineurFormatterUI-Tests' with: [ spec requires: #('EnlumineurFormatterUI') ]. 
		
		spec
				group: 'Core' with: #('EnlumineurFormatter');
				group: 'Tests' with: #('EnlumineurFormatter-Tests');
				group: 'UI' with: #('EnlumineurFormatterUI' 'EnlumineurFormatterUI-Tests');
				group: 'All' with: #('Core' 'Tests' 'UI')
		
		]
]
