Class {
	#name : #BIArrayExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #test }
BIArrayExpressionTest >> testEmptyArray [
	| expr source |
	expr := RBParser parseExpression: '{}'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '{}'
]

{ #category : #test }
BIArrayExpressionTest >> testFormatElement [
	| expr source |
	expr := RBParser parseExpression: ' { [a]. [b] } '.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'{[ a ].
[ b ]}'
]

{ #category : #test }
BIArrayExpressionTest >> testNoExtraSpaceAroundPeriod [
	| expr source |
	expr := RBParser parseExpression: '{1.    2.        3}'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '{1 . 2 . 3}'.
]

{ #category : #test }
BIArrayExpressionTest >> testNoSpaceAroundBrackets [
	| expr source |
	expr := RBParser parseExpression: ' { 1. 2. 3 } '.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '{1 . 2 . 3}'.
]

{ #category : #test }
BIArrayExpressionTest >> testSpaceAroundPeriod [
	| expr source |
	expr := RBParser parseExpression: '{1. 2. 3}'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '{1 . 2 . 3}'
]
