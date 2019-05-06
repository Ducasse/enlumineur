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

{ #category : #block }
BISingleExpressionTest >> emptyDefaultConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
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
