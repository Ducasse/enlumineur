Class {
	#name : #BIBlock2ExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #test }
BIBlock2ExpressionTest >> testSpaceAfterComment [
	| expr source |
	expr := RBParser parseExpression: '["aComment"1]'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '[ "aComment" 1 ]'
]

{ #category : #test }
BIBlock2ExpressionTest >> testformatComment [

	| expr source |
	expr := RBParser parseExpression: '["  c1   " "   c2 " 2 "c3"]'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '[ "  c1   " "   c2 " 2	"c3" ]'.
]
