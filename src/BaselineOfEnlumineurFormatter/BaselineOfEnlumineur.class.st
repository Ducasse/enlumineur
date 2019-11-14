Class {
	#name : #BaselineOfEnlumineur,
	#superclass : #BaselineOf,
	#category : #BaselineOfEnlumineurFormatter
}

{ #category : #baselines }
BaselineOfEnlumineur >> baseline: spec [
	<baseline>

	spec for: #pharo do: [
		spec package: 'EnlumineurFormatter'.
		spec package: 'EnlumineurFormatter-Tests' with: [ spec requires: #('EnlumineurFormatterUI') ].
		spec package: 'EnlumineurFormatterUI' with: [ spec requires: #('EnlumineurFormatter') ].
		spec package: 'EnlumineurFormatterUI-Tests' with: [ spec requires: #('EnlumineurFormatterUI') ] ]
]
