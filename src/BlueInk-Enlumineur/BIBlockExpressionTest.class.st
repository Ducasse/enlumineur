Class {
	#name : #BIBlockExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #configurations }
BIBlockExpressionTest >> lineUpBlockBracketsConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
		lineUpBlockBrackets: true
]

{ #category : #configurations }
BIBlockExpressionTest >> periodAtEndConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
		periodsAtEndOfBlock: true
]

{ #category : #test }
BIBlockExpressionTest >> testLineUpBlock [
	| expr source |
	expr := RBParser parseExpression: '[3. 4]'.
	configurationSelector := #lineUpBlockBracketsConfiguration.
	source := self formatter format: expr.
	self
		assert: source
		equals:'[ 3.
4
]'
]

{ #category : #test }
BIBlockExpressionTest >> testNoLineUpBlock [
	| expr source |
	expr := RBParser parseExpression: '[3. 4]'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self
		assert: source
		equals:'[ 3.
4 ]'
]

{ #category : #test }
BIBlockExpressionTest >> testNoPeriodAtEndOfBlock [
	| expr source |
	expr := RBParser parseExpression: '[2.]'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '[ 2 ]'
]

{ #category : #test }
BIBlockExpressionTest >> testPeriodAtEndOfBlock [
	| expr source |
	expr := RBParser parseExpression: '[2.]'.
	configurationSelector := #periodAtEndConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '[ 2. ]'
]

{ #category : #test }
BIBlockExpressionTest >> testSpaceBlock [
	| expr source |
	expr := RBParser parseExpression: '[2]'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '[ 2 ]'
]
