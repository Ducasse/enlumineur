Class {
	#name : #BIAssignmentExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #test }
BIAssignmentExpressionTest >> testAssignment [

	| expr source |
	expr := RBParser parseExpression: 'a:=1'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'a := 1'
]

{ #category : #test }
BIAssignmentExpressionTest >> testAssignmentHasNoExtraSpace [

	| expr source |
	expr := RBParser parseExpression: '   a:=1   '.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'a := 1'
]

{ #category : #test }
BIAssignmentExpressionTest >> testAssignmentHasNoExtraSpaceInside [

	| expr source |
	expr := RBParser parseExpression: '   a    :=    1   '.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'a := 1'
]

{ #category : #test }
BIAssignmentExpressionTest >> testMultipleAssignmentHasNoExtraSpaceInside [

	| expr source |
	expr := RBParser parseExpression: '   a    :=    b :=  1   '.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'a := b := 1'
]
