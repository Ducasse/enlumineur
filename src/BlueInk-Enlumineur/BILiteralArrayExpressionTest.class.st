Class {
	#name : #BILiteralArrayExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #configurations }
BILiteralArrayExpressionTest >> basicConfiguration [

	^ self contextClass basicNew
	formatCommentWithStatements:false
]

{ #category : #tests }
BILiteralArrayExpressionTest >> testByteArrayParenthesis [

	| expr source |
	expr := RBParser parseExpression: '#[1 2 3]'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '#[1 2 3]'
]

{ #category : #tests }
BILiteralArrayExpressionTest >> testNoExtraSpaceArroundParenthesis [

	| expr source |
	expr := RBParser parseExpression: '#(  1 2 3    )  '.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '#(1 2 3)'
]

{ #category : #tests }
BILiteralArrayExpressionTest >> testNoExtraSpaceArroundParenthesis2 [

	| expr source |
	expr := RBParser parseExpression: '#[  1 2 3    ]  '.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '#[1 2 3]'
]

{ #category : #tests }
BILiteralArrayExpressionTest >> testNoExtraSpaceBetweenValue [

	| expr source |
	expr := RBParser parseExpression: '#(1     2       3)'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '#(1 2 3)'
]

{ #category : #tests }
BILiteralArrayExpressionTest >> testNoExtraSpaceBetweenValue2 [

	| expr source |
	expr := RBParser parseExpression: '#[1     2       3]'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '#[1 2 3]'
]
