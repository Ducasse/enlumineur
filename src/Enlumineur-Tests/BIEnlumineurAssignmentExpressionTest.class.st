Class {
	#name : #BIEnlumineurAssignmentExpressionTest,
	#superclass : #BIEnlumineurTest,
	#category : #'Enlumineur-Tests'
}

{ #category : #configurations }
BIEnlumineurAssignmentExpressionTest >> basicConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:false;
		maxLineLength: 70;
		indentExtraSpaces: 0
]

{ #category : #configurations }
BIEnlumineurAssignmentExpressionTest >> multilineConfiguration [
	^ self contextClass basicNew
		formatCommentWithStatements: false;
		maxLineLength: 70;
		useTraditionalBinaryPrecedenceForParentheses: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 4;
		indentsForKeywords: 1;
		keepBlockInMessage: true;
		numberOfSpacesInsideParentheses: 1;
		indentStyle: #tabulation;
		retainBlankLinesBetweenStatements: true;
		minimumNewLinesBetweenStatements: 1;
		periodAtEndOfMethod: false;
		periodAtEndOfBlock: false;
		numberOfSpacesInsideBlock: 1;
		lineUpBlockBrackets: true;
		newLineBeforeFirstKeyword: true;
		indentExtraSpaces: 0
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
BIEnlumineurAssignmentExpressionTest >> testExtraIndentationWhenKeywordMessageIsMultiline [
	| source |
	configurationSelector := #multilineConfiguration.
	source := self
		formatExpression:
'abcdefghijklmnop:= aBoolean
	ifTrue: [ self indentsForKeywords ]
	ifFalse: [ 0 ]'.
	self
		assert: source
		equals:
'abcdefghijklmnop := aBoolean
	                    ifTrue: [ self indentsForKeywords ]
	                    ifFalse: [ 0 ]'
]

{ #category : #test }
BIEnlumineurAssignmentExpressionTest >> testExtraIndentationWhenMultiline [
	| source |
	configurationSelector := #multilineConfiguration.
	source := self
		formatExpression:
			'abcdefghijklmnop:= p2-x - p0-x * ( p3-y - p0-y ) - ( p3-x - p0-x * ( p2-y - p0-y ) ) * b0'.
	self
		assert: source
		equals:
'abcdefghijklmnop := p2 - x - p0 - x * ( p3 - y - p0 - y )
                    - ( p3 - x - p0 - x * ( p2 - y - p0 - y ) ) * b0'
]

{ #category : #test }
BIEnlumineurAssignmentExpressionTest >> testExtraIndentationWhenMultiline2 [
	| source |
	configurationSelector := #multilineConfiguration.
	source := self
		formatExpression:
			'1 to: 4 do: [a:= p2-x - p0-x * ( p3-y - p0-y ) - ( p3-x - p0-x * ( p2-y - p0-y ) )
	  * b0]'.
	self
		assert: source
		equals:
'1 to: 4 do: [ 
	a := p2 - x - p0 - x * ( p3 - y - p0 - y )
	     - ( p3 - x - p0 - x * ( p2 - y - p0 - y ) ) * b0
	]'
]

{ #category : #test }
BIEnlumineurAssignmentExpressionTest >> testExtraIndentationWhenMultiline3 [
	| source |
	configurationSelector := #multilineConfiguration.
	source := self
		formatExpression:
	'a:= b := p2-x - p0-x * ( p3-y - p0-y ) - ( p3-x - p0-x * ( p2-y - p0-y ) )
	  * b0'.
	self
		assert: source
		equals:
'a := b := p2 - x - p0 - x * ( p3 - y - p0 - y )
          - ( p3 - x - p0 - x * ( p2 - y - p0 - y ) ) * b0'

]

{ #category : #test }
BIEnlumineurAssignmentExpressionTest >> testExtraIndentationWhenMultilineResetTheIndentWhenFinish [
	| source |
	configurationSelector := #multilineConfiguration.
	source := self formatExpression: 'a := p2-x - p0-x * ( p3-y - p0-y ) - ( p3-x - p0-x * ( p2-y - p0-y ) ) * b0. a:=1'.
	self assert: source equals:
'a := p2 - x - p0 - x * ( p3 - y - p0 - y )
     - ( p3 - x - p0 - x * ( p2 - y - p0 - y ) ) * b0.
a := 1'
]

{ #category : #test }
BIEnlumineurAssignmentExpressionTest >> testMultipleAssignmentHasNoExtraSpaceInside [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '   a    :=    b :=  1   '.
	self assert: source equals: 'a := b := 1'
]
