Class {
	#name : #BISingleExpressionTest,
	#superclass : #ParametrizedTestCase,
	#instVars : [
		'configurationSelector',
		'formatterClass'
	],
	#category : #'BlueInk-Enlumineur-ToIntegrateToPharo'
}

{ #category : #'building suites' }
BISingleExpressionTest class >> testParameters [

	^ ParametrizedTestMatrix new
		forSelector: #formatterClass addOptions: {BIConfigurableFormatter};
		yourself.
]

{ #category : #hooks }
BISingleExpressionTest >> contextClass [
	self flag: #todo. "change to have BIPrettyPrinterContext"
	^ BIPrettyPrinterContext
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
	^ formatterClass
]

{ #category : #hooks }
BISingleExpressionTest >> formatterClass: aFormatterClass [
	formatterClass := aFormatterClass
]

{ #category : #hooks }
BISingleExpressionTest >> parseExpression: anExpression [

	^ RBParser parseExpression: anExpression
]
