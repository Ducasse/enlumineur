Class {
	#name : #BIAssignmentExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #configurations }
BIAssignmentExpressionTest >> spaceForAssignementConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
]

{ #category : #test }
BIAssignmentExpressionTest >> testAssignment [

	| expr source |
	expr := RBParser parseExpression: 'a:=1'.
	configurationSelector := #spaceForAssignementConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'a := 1'
]

{ #category : #test }
BIAssignmentExpressionTest >> testAssignmentHasNoExtraSpace [

	| expr source |
	expr := RBParser parseExpression: '   a:=1   '.
	configurationSelector := #spaceForAssignementConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'a := 1'
]

{ #category : #test }
BIAssignmentExpressionTest >> testAssignmentHasNoExtraSpaceInside [

	| expr source |
	expr := RBParser parseExpression: '   a    :=    1   '.
	configurationSelector := #spaceForAssignementConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'a := 1'
]

{ #category : #test }
BIAssignmentExpressionTest >> testMultipleAssignmentHasNoExtraSpaceInside [

	| expr source |
	expr := RBParser parseExpression: '   a    :=    b :=  1   '.
	configurationSelector := #spaceForAssignementConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'a := b := 1'
]
