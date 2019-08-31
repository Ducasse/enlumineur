Class {
	#name : #BaselineOfEnlumineur,
	#superclass : #BaselineOf,
	#category : #BaselineOfEnlumineur
}

{ #category : #baselines }
BaselineOfEnlumineur >> baseline: spec [
	<baseline>

	spec for: #pharo do: [
		spec package: 'Enlumineur'.
		spec package: 'Enlumineur-Tests' with: [ spec requires: #('EnlumineurUI') ].
		spec package: 'EnlumineurUI' with: [ spec requires: #('Enlumineur') ].
		spec package: 'EnlumineurUI-Tests' with: [ spec requires: #('EnlumineurUI') ] ]
]
