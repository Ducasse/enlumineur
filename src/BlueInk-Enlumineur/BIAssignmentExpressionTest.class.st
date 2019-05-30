Class {
	#name : #BIAssignmentExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur-ToIntegrateToPharo'
}

{ #category : #configurations }
BIAssignmentExpressionTest >> basicConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:false
]

{ #category : #test }
BIAssignmentExpressionTest >> testAssignment [

	| expr source |
	expr := RBParser parseExpression: 'a:=1'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'a := 1'
]

{ #category : #test }
BIAssignmentExpressionTest >> testAssignmentFormatValue [

	| expr source |
	expr := RBParser parseExpression: 'a:= b:=1'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'a := b := 1'

]

{ #category : #test }
BIAssignmentExpressionTest >> testAssignmentFormatVariable [

	| expr source |
	expr := RBParser parseExpression: ' a   := 1'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'a := 1'

]

{ #category : #test }
BIAssignmentExpressionTest >> testAssignmentHasNoExtraSpace [

	| expr source |
	expr := RBParser parseExpression: '   a:=1   '.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'a := 1'
]

{ #category : #test }
BIAssignmentExpressionTest >> testAssignmentHasNoExtraSpaceInside [

	| expr source |
	expr := RBParser parseExpression: '   a    :=    1   '.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'a := 1'
]

{ #category : #test }
BIAssignmentExpressionTest >> testMultipleAssignmentHasNoExtraSpaceInside [

	| expr source |
	expr := RBParser parseExpression: '   a    :=    b :=  1   '.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'a := b := 1'
]
