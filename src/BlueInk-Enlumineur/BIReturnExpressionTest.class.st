Class {
	#name : #BIReturnExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #configuration }
BIReturnExpressionTest >> basicConfiguration [

	^ self contextClass basicNew
	formatCommentWithStatements:false;
	stringFollowingReturn: ' '
]

{ #category : #tests }
BIReturnExpressionTest >> testReturnFormatValue [
	| expr source |
	expr := RBParser parseExpression: '    ^a:=1   '.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '^ a := 1'
]

{ #category : #tests }
BIReturnExpressionTest >> testReturnHasNoExtraSpace [
	| expr source |
	expr := RBParser parseExpression: '    ^a   '.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '^ a'
]

{ #category : #tests }
BIReturnExpressionTest >> testReturnHasNoExtraSpaceInside [
	| expr source |
	expr := RBParser parseExpression: ' ^    a'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '^ a'
]

{ #category : #tests }
BIReturnExpressionTest >> testReturnHasNoPeriod [
	| expr source |
	expr := RBParser parseExpression: '^a.'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '^ a'
]

{ #category : #tests }
BIReturnExpressionTest >> testReturnHasSpaceBetween [
	| expr source |
	expr := RBParser parseExpression: '^a'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '^ a'
]
