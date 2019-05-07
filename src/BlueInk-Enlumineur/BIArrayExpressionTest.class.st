Class {
	#name : #BIArrayExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #'as yet unclassified' }
BIArrayExpressionTest >> testEmptyArray [
	| expr source |
	expr := RBParser parseExpression: '{}'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '{}'
]

{ #category : #'as yet unclassified' }
BIArrayExpressionTest >> testNoExtraSpaceAroundPeriod [
	| expr source |
	expr := RBParser parseExpression: '{1.    2.        3}'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '{1 . 2 . 3}'.
]

{ #category : #'as yet unclassified' }
BIArrayExpressionTest >> testNoSpaceAroundBrackets [
	| expr source |
	expr := RBParser parseExpression: ' { 1. 2. 3 } '.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '{1 . 2 . 3}'.
]

{ #category : #'as yet unclassified' }
BIArrayExpressionTest >> testSpaceAroundPeriod [
	| expr source |
	expr := RBParser parseExpression: '{1. 2. 3}'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '{1 . 2 . 3}'
]
