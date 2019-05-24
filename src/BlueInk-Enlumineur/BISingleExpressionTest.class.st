Class {
	#name : #BISingleExpressionTest,
	#superclass : #TestCase,
	#instVars : [
		'configurationSelector'
	],
	#category : #'BlueInk-Enlumineur-ToIntegrateToPharo'
}

{ #category : #hooks }
BISingleExpressionTest >> contextClass [
	self flag: #todo. "change to have BIPrettyPrinterContext"
	^ BIExtendedPrettyPrinterContext
]

{ #category : #hooks }
BISingleExpressionTest >> formatExpression: anExpression [

	| expr |
	expr := self parseExpression: anExpression.
	^ self formatter format: expr.
	
]

{ #category : #hooks }
BISingleExpressionTest >> formatter [
	^ self formatterClass new
		installNewContext: (self perform: configurationSelector)
		yourself
]

{ #category : #hooks }
BISingleExpressionTest >> formatterClass [
	self flag: #todo. "change to have BIConfigurableFormatter"
	^ BIEnlumineurConfigurableFormatter
]

{ #category : #hooks }
BISingleExpressionTest >> parseExpression: anExpression [

	^ RBParser parseExpression: anExpression
]
