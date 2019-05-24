Class {
	#name : #BIArrayExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur-ToIntegrateToPharo'
}

{ #category : #configurations }
BIArrayExpressionTest >> basicConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:false;
		maxLineLength:50;
		stringInsideParentheses:'';
		retainBlankLinesBetweenStatements:false;
		minimumNewLinesBetweenStatements:1;
		indentString:'	';
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod:false
]

{ #category : #configurations }
BIArrayExpressionTest >> maxLineLengthConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		formatCommentWithStatements:false;
		maxLineLength:12;
		retainBlankLinesBetweenStatements:false;
		minimumNewLinesBetweenStatements: 1;
		indentString: '	';
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod:false
]

{ #category : #configurations }
BIArrayExpressionTest >> periodAsTerminatorConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		formatCommentWithStatements:false;
		maxLineLength:12;
		retainBlankLinesBetweenStatements:false;
		minimumNewLinesBetweenStatements: 1;
		indentString: '	';
		periodsAtEndOfBlock:true;
		periodsAtEndOfMethod:true;
		stringInsideBlocks:'';
		lineUpBlockBrackets:false
]

{ #category : #configurations }
BIArrayExpressionTest >> periodAsTerminatorMessageConfiguration2 [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		formatCommentWithStatements:false;
		maxLineLength:12;
		retainBlankLinesBetweenStatements:false;
		minimumNewLinesBetweenStatements: 1;
		indentString: '	';
		periodsAtEndOfBlock:true;
		periodsAtEndOfMethod:true;
		multiLineMessages:Array new;
		oneLineMessages:Array new;
		numberOfArgumentsForMultiLine:2;
		newLineBeforeFirstKeyword:false
]

{ #category : #test }
BIArrayExpressionTest >> testEmptyArray [
	| expr source |
	configurationSelector := #basicConfiguration.
	expr := self parseExpression: '{}'.
	source := self formatter format: expr.
	self assert: source equals: '{}'
]

{ #category : #test }
BIArrayExpressionTest >> testFormatElement [
	| expr source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: ' { a:=1. b:=2 } '.
	self assert: source equals:
'{(a := 1).
(b := 2)}'
]

{ #category : #test }
BIArrayExpressionTest >> testNoExtraSpaceAroundPeriod [
	| expr source |
	expr := self parseExpression: '{1.    2.        3}'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '{1 . 2 . 3}'.
]

{ #category : #test }
BIArrayExpressionTest >> testNoSpaceAroundBrackets [
	| expr source |
	expr := self parseExpression: ' { 1. 2. 3 } '.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '{1 . 2 . 3}'.
]

{ #category : #test }
BIArrayExpressionTest >> testPeriodAtEndOfBlock [
	| expr source |
	expr := self parseExpression: '{[1]}'.
	configurationSelector := #periodAsTerminatorConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '{[1.].}'
]

{ #category : #test }
BIArrayExpressionTest >> testPeriodAtEndOfMethod [
	| expr source |
	expr := self parseExpression: '{1 factorial}'.
	configurationSelector := #periodAsTerminatorMessageConfiguration2.
	source := self formatter format: expr.
	self assert: source equals: '{1 factorial.}'
]

{ #category : #test }
BIArrayExpressionTest >> testSpaceAroundPeriod [
	| expr source |
	expr := self parseExpression: '{1. 2. 3}'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '{1 . 2 . 3}'
]

{ #category : #test }
BIArrayExpressionTest >> testToLongNewLine [
	| expr source |
	expr := self parseExpression:'{VeryLongExpression. 1}'.
	configurationSelector := #maxLineLengthConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'{VeryLongExpression.
1}'
]

{ #category : #test }
BIArrayExpressionTest >> testToLongNewLine2 [
	| expr source |
	expr := self parseExpression:'{1. 2. 3. 4. 5. 6. 7. 1}'.
	configurationSelector := #maxLineLengthConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'{1 . 2 . 3 . 4.
5 . 6 . 7 . 1}'
]
