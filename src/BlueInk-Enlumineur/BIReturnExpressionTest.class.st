Class {
	#name : #BIReturnExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #tests }
BIReturnExpressionTest >> testReturnHasNoExtraSpace [
	| expr source |
	expr := RBParser parseExpression: '    ^a   '.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '^ a'
]

{ #category : #tests }
BIReturnExpressionTest >> testReturnHasNoExtraSpaceInside [
	| expr source |
	expr := RBParser parseExpression: ' ^    a'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '^ a'
]

{ #category : #tests }
BIReturnExpressionTest >> testReturnHasNoPeriod [
	| expr source |
	expr := RBParser parseExpression: '^a.'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '^ a'
]

{ #category : #tests }
BIReturnExpressionTest >> testReturnHasSpaceBetween [
	| expr source |
	expr := RBParser parseExpression: '^a'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '^ a'
]
