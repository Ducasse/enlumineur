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
BIBlockExpressionTest >> noFormatCommentConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
		formatCommentWithStatements: false
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
BIBlockExpressionTest >> testEndPeriodInside [
	| expr source |
	expr := RBParser parseExpression: '[2.]'.
	configurationSelector := #periodAtEndConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '[ 2. ]'
]

{ #category : #test }
BIBlockExpressionTest >> testFormatElements [
	| expr source |
	expr := RBParser parseExpression: '[ [1]. [ a:=1] ]'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'[ [ 1 ].
[ a := 1 ] ]'.
]

{ #category : #test }
BIBlockExpressionTest >> testNewLineBeforeEndBrackets [
	| expr source |
	expr := RBParser parseExpression: '[3. 4]'.
	configurationSelector := #lineUpBlockBracketsConfiguration.
	source := self formatter format: expr.
	self
		assert: source
		equals:
'[ 3.
4
]'
]

{ #category : #test }
BIBlockExpressionTest >> testNoEndPeriodInside [
	| expr source |
	expr := RBParser parseExpression: '[2.]'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '[ 2 ]'
]

{ #category : #test }
BIBlockExpressionTest >> testNoExtraSpaceAroundBlock [
	| expr source |
	expr := RBParser parseExpression: '   [2]   '.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '[ 2 ]'
]

{ #category : #test }
BIBlockExpressionTest >> testNoExtraSpaceInside [
	| expr source |
	expr := RBParser parseExpression: '[    2     ]'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '[ 2 ]'
]

{ #category : #test }
BIBlockExpressionTest >> testNoNewLineBeforeEndBrackets [
	| expr source |
	expr := RBParser parseExpression: '[3. 4]'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self
		assert: source
		equals:
'[ 3.
4 ]'
]

{ #category : #test }
BIBlockExpressionTest >> testSpace [
	| expr source |
	expr := RBParser parseExpression: '[2]'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '[ 2 ]'
]

{ #category : #test }
BIBlockExpressionTest >> testformatComment [

	| expr source |
	expr := RBParser parseExpression: '["  c1   " "   c2 " 2 "c3"]'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '[ "  c1   " "   c2 " 2	"c3" ]'.
]
