Class {
	#name : #BIEnlumineurReturnExpressionTest,
	#superclass : #BIEnlumineurTest,
	#category : #'Enlumineur-Tests'
}

{ #category : #configuration }
BIEnlumineurReturnExpressionTest >> basicConfiguration [
	^ self contextClass basicNew
		formatCommentWithStatements: false;
		numberOfSpacesAfterCaretSymbolInReturn: 1;
		maxLineLength: 70;
		indentExtraSpaces: 0
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
		keepBlockInMessage: true;
		indentExtraSpaces: 0
]

{ #category : #configuration }
BIEnlumineurReturnExpressionTest >> multilineWithThreeSpacesAfterCaretSymbolConfiguration [
	^ self contextClass basicNew
		formatCommentWithStatements: false;
		numberOfSpacesAfterCaretSymbolInReturn: 3;
		maxLineLength: 70;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 4;
		indentStyle: #tabulation;
		indentsForKeywords: 1;
		newLineBeforeFirstKeyword: true;
		keepBlockInMessage: true;
		indentExtraSpaces: 0
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
BIEnlumineurReturnExpressionTest >> testReturnExtraSpacesInIndentWhenMultilneWithThreeSpacesAfterCaretSymbol [
	| source |
	configurationSelector := #multilineWithThreeSpacesAfterCaretSymbolConfiguration.
	source := self formatExpression: '^ Array with: self leftRotated with: self negated with: self rightRotated with: self'.
	self assert: source equals:
'^   Array
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
