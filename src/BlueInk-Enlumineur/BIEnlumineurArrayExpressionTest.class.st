Class {
	#name : #BIEnlumineurArrayExpressionTest,
	#superclass : #BIEnlumineurTest,
	#category : #'BlueInk-Enlumineur-Tests'
}

{ #category : #configurations }
BIEnlumineurArrayExpressionTest >> basicConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:false;
		maxLineLength:50;
		numberOfSpacesInsideParentheses: 0;
		retainBlankLinesBetweenStatements:false;
		minimumNewLinesBetweenStatements:1;
		indentStyle: #tabulation;
		indentExtraSpaces: 0;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod:false;
		numberOfSpacesInsideArray: 0
]

{ #category : #configurations }
BIEnlumineurArrayExpressionTest >> maxLineLengthConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		formatCommentWithStatements:false;
		maxLineLength:12;
		retainBlankLinesBetweenStatements:false;
		minimumNewLinesBetweenStatements: 1;
		indentStyle: #tabulation;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod:false;
		indentExtraSpaces: 0;
		numberOfSpacesInsideArray: 0
]

{ #category : #configurations }
BIEnlumineurArrayExpressionTest >> multiLineConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:false;
		maxLineLength:50;
		numberOfSpacesInsideParentheses: 0;
		retainBlankLinesBetweenStatements:false;
		minimumNewLinesBetweenStatements:1;
		indentStyle: #tabulation;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod:false;
		numberOfSpacesInsideParentheses: 0;
		numberOfArgumentsForMultiLine: 4;
		indentsForKeywords: 1;
		keepBlockInMessage: true;
		indentExtraSpaces: 0;
		numberOfSpacesInsideArray: 0
]

{ #category : #configurations }
BIEnlumineurArrayExpressionTest >> oneSpaceInsideArrayConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:false;
		maxLineLength:50;
		numberOfSpacesInsideParentheses: 0;
		retainBlankLinesBetweenStatements:false;
		minimumNewLinesBetweenStatements:1;
		indentStyle: #tabulation;
		indentExtraSpaces: 0;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod:false;
		numberOfSpacesInsideArray: 1
]

{ #category : #configurations }
BIEnlumineurArrayExpressionTest >> periodAtEndOfMethod [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		formatCommentWithStatements:false;
		maxLineLength:12;
		retainBlankLinesBetweenStatements:false;
		minimumNewLinesBetweenStatements: 1;
		indentStyle: #tabulation;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod:true;
		numberOfArgumentsForMultiLine:2;
		newLineBeforeFirstKeyword:false;
		numberOfSpacesInsideArray: 0
]

{ #category : #test }
BIEnlumineurArrayExpressionTest >> testEmptyArray [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '{}'.
	self assert: source equals: '{}'
]

{ #category : #test }
BIEnlumineurArrayExpressionTest >> testFormatElement [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: ' { a:=1. b:=2 } '.
	self assert: source equals:
'{
	(a := 1).
	(b := 2)}'
]

{ #category : #test }
BIEnlumineurArrayExpressionTest >> testNewLineAfterBracesWhenMultiline [
	| source |
	configurationSelector := #multiLineConfiguration.
	source := self formatExpression: '{(self + (1 @ 0)).
	(self + (1 @ 1)).
	(self + (0 @ 1)).
	(self + (-1 @ 1)).
	(self + (-1 @ 0)).
	(self + (-1 @ -1)).
	(self + (0 @ -1)).
	(self + (1 @ -1))}'.
	self
		assert: source
		equals:
'{
	(self + (1 @ 0)).
	(self + (1 @ 1)).
	(self + (0 @ 1)).
	(self + (-1 @ 1)).
	(self + (-1 @ 0)).
	(self + (-1 @ -1)).
	(self + (0 @ -1)).
	(self + (1 @ -1))}'
]

{ #category : #test }
BIEnlumineurArrayExpressionTest >> testNoExtraSpaceAroundPeriod [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '{1.    2.        3}'.
	self assert: source equals: '{1. 2. 3}'
]

{ #category : #test }
BIEnlumineurArrayExpressionTest >> testNoSpaceAroundBrackets [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: ' { 1. 2. 3 } '.
	self assert: source equals: '{1. 2. 3}'
]

{ #category : #test }
BIEnlumineurArrayExpressionTest >> testOneSpaceAroundBrackets [
	| source |
	configurationSelector := #oneSpaceInsideArrayConfiguration.
	source := self formatExpression: ' { 1. 2. 3 } '.
	self assert: source equals: '{ 1. 2. 3 }'
]

{ #category : #test }
BIEnlumineurArrayExpressionTest >> testPeriodAtEndOfMethod [
	| source |
	configurationSelector := #periodAtEndOfMethod.
	source := self formatExpression: '{1 factorial}'.
	self assert: source equals: '{1 factorial.}'
]

{ #category : #test }
BIEnlumineurArrayExpressionTest >> testSpaceAroundPeriod [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '{1. 2. 3}'.
	self assert: source equals: '{1. 2. 3}'
]

{ #category : #test }
BIEnlumineurArrayExpressionTest >> testToLongNewLine [
	| source |
	configurationSelector := #maxLineLengthConfiguration.
	source := self formatExpression: '{VeryLongExpression. 1}'.
	self
		assert: source
		equals:
'{
	VeryLongExpression.
	1}'
]

{ #category : #test }
BIEnlumineurArrayExpressionTest >> testToLongNewLine2 [
	| source |
	configurationSelector := #maxLineLengthConfiguration.
	source := self formatExpression: '{1. 2. 3. 4. 5. 6. 7. 1}'.
	self
		assert: source
		equals:
			'{1. 2. 3. 4.
5. 6. 7. 1}'
]

{ #category : #test }
BIEnlumineurArrayExpressionTest >> testTwoSpaceAroundBrackets [
	| source |
	configurationSelector := #twoSpacesInsideArrayConfiguration.
	source := self formatExpression: ' { 1. 2. 3 } '.
	self assert: source equals: '{  1. 2. 3  }'
]

{ #category : #configurations }
BIEnlumineurArrayExpressionTest >> twoSpacesInsideArrayConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:false;
		maxLineLength:50;
		numberOfSpacesInsideParentheses: 0;
		retainBlankLinesBetweenStatements:false;
		minimumNewLinesBetweenStatements:1;
		indentStyle: #tabulation;
		indentExtraSpaces: 0;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod:false;
		numberOfSpacesInsideArray: 2
]
