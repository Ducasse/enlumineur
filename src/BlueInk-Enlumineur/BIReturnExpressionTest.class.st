Class {
	#name : #BIReturnExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #tests }
BIReturnExpressionTest >> testReturn [
	| expr source |
	expr := RBParser parseExpression: '^a'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '^ a'
]

{ #category : #tests }
BIReturnExpressionTest >> testReturnExtraSpace [
	| expr source |
	expr := RBParser parseExpression: ' ^  a   '.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '^ a'
]

{ #category : #tests }
BIReturnExpressionTest >> testReturnPeriod [
	| expr source |
	expr := RBParser parseExpression: '^a.'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '^ a'
]
