Class {
	#name : #BIEnlumineurAssignmentExpressionTest,
	#superclass : #BIEnlumineurTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #configurations }
BIEnlumineurAssignmentExpressionTest >> basicConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:false
]

{ #category : #test }
BIEnlumineurAssignmentExpressionTest >> testAssignment [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: 'a:=1'.
	self assert: source equals: 'a := 1'
]

{ #category : #test }
BIEnlumineurAssignmentExpressionTest >> testAssignmentFormatValue [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: 'a:= b:=1'.
	self assert: source equals: 'a := b := 1'
]

{ #category : #test }
BIEnlumineurAssignmentExpressionTest >> testAssignmentFormatVariable [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: ' a   := 1'.
	self assert: source equals: 'a := 1'
]

{ #category : #test }
BIEnlumineurAssignmentExpressionTest >> testAssignmentHasNoExtraSpace [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '   a:=1   '.
	self assert: source equals: 'a := 1'
]

{ #category : #test }
BIEnlumineurAssignmentExpressionTest >> testAssignmentHasNoExtraSpaceInside [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '   a    :=    1   '.
	self assert: source equals: 'a := 1'
]

{ #category : #test }
BIEnlumineurAssignmentExpressionTest >> testMultipleAssignmentHasNoExtraSpaceInside [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '   a    :=    b :=  1   '.
	self assert: source equals: 'a := b := 1'
]
