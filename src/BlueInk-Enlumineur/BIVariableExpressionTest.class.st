Class {
	#name : #BIVariableExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #tests }
BIVariableExpressionTest >> testNoExtraSpaces [

	| expr source |
	expr := RBParser parseExpression: '    a     '.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'a'
]

{ #category : #tests }
BIVariableExpressionTest >> testSpaces [

	| expr source |
	expr := RBParser parseExpression: 'a'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'a'
	
]
