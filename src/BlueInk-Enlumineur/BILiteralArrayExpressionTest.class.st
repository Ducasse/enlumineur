Class {
	#name : #BILiteralArrayExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #tests }
BILiteralArrayExpressionTest >> testNoExtraSpaceArroundParenthesis [

	| expr source |
	expr := RBParser parseExpression: '#(  1 2 3    )  '.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '#(1 2 3)'
]

{ #category : #tests }
BILiteralArrayExpressionTest >> testNoExtraSpaceBetweenValue [

	| expr source |
	expr := RBParser parseExpression: '#(1     2       3)'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '#(1 2 3)'
]
