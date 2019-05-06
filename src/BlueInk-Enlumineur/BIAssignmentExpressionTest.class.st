Class {
	#name : #BIAssignmentExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #assignments }
BIAssignmentExpressionTest >> spaceForAssignementConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
]

{ #category : #assignments }
BIAssignmentExpressionTest >> testAssignment [

	| expr source |
	expr := RBParser parseExpression: 'a:=1'.
	configurationSelector := #spaceForAssignementConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'a := 1'
]

{ #category : #assignments }
BIAssignmentExpressionTest >> testAssignmentHasNoExtraSpace [

	| expr source |
	expr := RBParser parseExpression: '   a:=1   '.
	configurationSelector := #spaceForAssignementConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'a := 1'
]

{ #category : #assignments }
BIAssignmentExpressionTest >> testAssignmentHasNoExtraSpaceInside [

	| expr source |
	expr := RBParser parseExpression: '   a    :=    1   '.
	configurationSelector := #spaceForAssignementConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'a := 1'
]

{ #category : #assignments }
BIAssignmentExpressionTest >> testMultipleAssignmentHasNoExtraSpaceInside [

	| expr source |
	expr := RBParser parseExpression: '   a    :=    b :=  1   '.
	configurationSelector := #spaceForAssignementConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'a := b := 1'
]
