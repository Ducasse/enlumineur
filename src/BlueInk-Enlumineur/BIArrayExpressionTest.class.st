Class {
	#name : #BIArrayExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #configurations }
BIArrayExpressionTest >> maxLineLengthConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
	maxLineLength:12
	
]

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

{ #category : #test }
BIArrayExpressionTest >> testToLongNewLine [
	| expr source |
	expr := RBParser parseExpression:'{2 factorial. 1}'.
	configurationSelector := #maxLineLengthConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'{2 factorial.
1}'
]

{ #category : #test }
BIArrayExpressionTest >> testToLongNewLine2 [
	| expr source |
	expr := RBParser parseExpression:'{1. 2. 3. 4. 5. 6. 7. 1}'.
	configurationSelector := #maxLineLengthConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'{1 . 2 . 3 . 4.
5 . 6 . 7 . 1}'
]
