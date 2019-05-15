Class {
	#name : #BIVariableExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #configuration }
BIVariableExpressionTest >> basicConfiguration [

	^ self contextClass basicNew
	formatCommentWithStatements:false
]

{ #category : #tests }
BIVariableExpressionTest >> testNoExtraSpaces [

	| expr source |
	expr := RBParser parseExpression: '    a     '.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'a'
]

{ #category : #tests }
BIVariableExpressionTest >> testSpaces [

	| expr source |
	expr := RBParser parseExpression: 'a'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'a'
	
]
