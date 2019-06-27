Class {
	#name : #BIEnlumineurReturnExpressionTest,
	#superclass : #BIEnlumineurTest,
	#category : #'BlueInk-Enlumineur-Tests'
}

{ #category : #configuration }
BIEnlumineurReturnExpressionTest >> basicConfiguration [
	^ self contextClass basicNew
		formatCommentWithStatements: false;
		numberOfSpacesAfterCaretSymbolInReturn: 1;
		maxLineLength: 70
]

{ #category : #configuration }
BIEnlumineurReturnExpressionTest >> multilineConfiguration [
	^ self contextClass basicNew
		formatCommentWithStatements: false;
		numberOfSpacesAfterCaretSymbolInReturn: 1;
		maxLineLength: 70;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 4;
		indentStyle: #tabulation;
		indentsForKeywords: 1;
		newLineBeforeFirstKeyword: true;
		keepBlockInMessage: true
]

{ #category : #tests }
BIEnlumineurReturnExpressionTest >> testReturnExtraSpacesInIndentWhenMultilne [
	| source |
	configurationSelector := #multilineConfiguration.
	source := self formatExpression: '^ Array with: self leftRotated with: self negated with: self rightRotated with: self'.
	self assert: source equals:
'^ Array
	  with: self leftRotated
	  with: self negated
	  with: self rightRotated
	  with: self'
]

{ #category : #tests }
BIEnlumineurReturnExpressionTest >> testReturnFormatValue [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '    ^a:=1   '.
	self assert: source equals: '^ a := 1'
]

{ #category : #tests }
BIEnlumineurReturnExpressionTest >> testReturnHasNoExtraSpace [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '    ^a   '.
	self assert: source equals: '^ a'
]

{ #category : #tests }
BIEnlumineurReturnExpressionTest >> testReturnHasNoExtraSpaceInside [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: ' ^    a'.
	self assert: source equals: '^ a'
]

{ #category : #tests }
BIEnlumineurReturnExpressionTest >> testReturnHasNoPeriod [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '^a.'.
	self assert: source equals: '^ a'
]

{ #category : #tests }
BIEnlumineurReturnExpressionTest >> testReturnHasSpaceBetween [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '^a'.
	self assert: source equals: '^ a'
]
