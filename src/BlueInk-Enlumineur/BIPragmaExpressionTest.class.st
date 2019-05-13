Class {
	#name : #BIPragmaExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #tests }
BIPragmaExpressionTest >> testPragmaNoExtraSpace [
	| expr source |
	expr := RBParser parsePragma:'<   Pragma   >'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '<Pragma>'
]

{ #category : #tests }
BIPragmaExpressionTest >> testPragmaNoExtraSpaceBetweenMethodeAndArgument [
	| expr source |
	expr := RBParser parsePragma:'<primitive:    41>'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '<primitive: 41>'
]
