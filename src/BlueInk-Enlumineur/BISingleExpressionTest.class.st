Class {
	#name : #BISingleExpressionTest,
	#superclass : #TestCase,
	#instVars : [
		'configurationSelector'
	],
	#category : #'BlueInk-Enlumineur'
}

{ #category : #tests }
BISingleExpressionTest >> contextClass [
	^ BIExtendedPrettyPrinterContext
]

{ #category : #tests }
BISingleExpressionTest >> formatter [
	^ self formatterClass new
		installNewContext: (self perform: configurationSelector)
		yourself
]

{ #category : #tests }
BISingleExpressionTest >> formatterClass [
	^ BIEnlumineurConfigurableFormatter
]
