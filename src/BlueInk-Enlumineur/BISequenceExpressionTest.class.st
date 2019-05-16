Class {
	#name : #BISequenceExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #configurations }
BISequenceExpressionTest >> basicConfiguration [ 

	^ self contextClass basicNew
	formatCommentWithStatements:true;
	indentString: '	';
	newLinesAfterTemporaries:0;
	retainBlankLinesBeforeComments:false;
	useBasicCommentFormat:false;
	maxLineLength:50;
	retainBlankLinesBetweenStatements:false;
	minimumNewLinesBetweenStatements:0;
	periodsAtEndOfBlock:false;
	periodsAtEndOfMethod:false
]

{ #category : #configurations }
BISequenceExpressionTest >> dontRetainBlankLinesBeforeCommentsConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"


		
	^ self contextClass basicNew
	retainBlankLinesBeforeComments:false;
	formatCommentWithStatements:true;
	indentString: '	';
	newLinesAfterTemporaries:0;
	useBasicCommentFormat:false;
	maxLineLength:50;
	retainBlankLinesBetweenStatements:false;
	minimumNewLinesBetweenStatements:0;
	periodsAtEndOfBlock:false;
	periodsAtEndOfMethod:false
]

{ #category : #configurations }
BISequenceExpressionTest >> dontRetainBlankLinesBetweenStatementsConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
	retainBlankLinesBetweenStatements: false;
	retainBlankLinesBeforeComments:false;
	formatCommentWithStatements:true;
	indentString: '	';
	newLinesAfterTemporaries:0;
	useBasicCommentFormat:false;
	maxLineLength:50;
	minimumNewLinesBetweenStatements:0;
	periodsAtEndOfBlock:false;
	periodsAtEndOfMethod:false
]

{ #category : #configurations }
BISequenceExpressionTest >> newLineAfterStatementConfiguration [

	^ self contextClass basicNew
	minimumNewLinesBetweenStatements:1;
	formatCommentWithStatements:true;
	indentString: '	';
	newLinesAfterTemporaries:0;
	retainBlankLinesBeforeComments:false;
	useBasicCommentFormat:false;
	maxLineLength:50;
	retainBlankLinesBetweenStatements:false;
	periodsAtEndOfBlock:false;
	periodsAtEndOfMethod:false
]

{ #category : #configurations }
BISequenceExpressionTest >> newLineAfterTemporariesConfiguration [

	^ self contextClass basicNew
	formatCommentWithStatements:true;
	indentString: '	';
	newLinesAfterTemporaries:1
]

{ #category : #configurations }
BISequenceExpressionTest >> periodAsTerminatorConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
	periodsAtEndOfBlock:true;
	periodsAtEndOfMethod:true;
	formatCommentWithStatements:true;
	indentString: '	';
	newLinesAfterTemporaries:0;
	retainBlankLinesBeforeComments:false;
	useBasicCommentFormat:false;
	maxLineLength:50;
	retainBlankLinesBetweenStatements:false;
	minimumNewLinesBetweenStatements:0;
	stringInsideBlocks: ' ';
	lineUpBlockBrackets: true;
	multiLineMessages:Array new;
	oneLineMessages:Array new;
	numberOfArgumentsForMultiLine:2;
	newLineBeforeFirstKeyword:false
]

{ #category : #configurations }
BISequenceExpressionTest >> periodNotAsTerminatorConfiguration [ 

	^ self contextClass basicNew
	periodsAtEndOfBlock:false;
	periodsAtEndOfMethod:false;
	formatCommentWithStatements:true;
	indentString: '	';
	newLinesAfterTemporaries:0;
	retainBlankLinesBeforeComments:false;
	useBasicCommentFormat:false;
	maxLineLength:50;
	retainBlankLinesBetweenStatements:false;
	minimumNewLinesBetweenStatements:0;
	stringInsideBlocks: ' ';
	lineUpBlockBrackets: true;
	multiLineMessages:Array new;
	oneLineMessages:Array new;
	numberOfArgumentsForMultiLine:2;
	newLineBeforeFirstKeyword:false
]

{ #category : #configurations }
BISequenceExpressionTest >> retainBlankLinesBeforeCommentsConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
	retainBlankLinesBeforeComments:true;
	formatCommentWithStatements:true;
	indentString: '	';
	newLinesAfterTemporaries:0;
	useBasicCommentFormat:false;
	maxLineLength:50;
	retainBlankLinesBetweenStatements:false;
	minimumNewLinesBetweenStatements:0;
	periodsAtEndOfBlock:false;
	periodsAtEndOfMethod:false
]

{ #category : #configurations }
BISequenceExpressionTest >> retainBlankLinesBetweenStatementsConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
	retainBlankLinesBetweenStatements: true;
	retainBlankLinesBeforeComments:false;
	formatCommentWithStatements:true;
	indentString: '	';
	newLinesAfterTemporaries:0;
	useBasicCommentFormat:false;
	maxLineLength:50;
	minimumNewLinesBetweenStatements:0;
	periodsAtEndOfBlock:false;
	periodsAtEndOfMethod:false
]

{ #category : #tests }
BISequenceExpressionTest >> testCommentBetweenStatements [
	| expr source |
	expr := RBParser parseExpression: '|a b| a := 1."comment"b := 2'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |a := 1.	"comment" b := 2'
]

{ #category : #tests }
BISequenceExpressionTest >> testCommentBetweenTemporariesAndStatement [
	| expr source |
	expr := RBParser parseExpression: '|a b| "comment" a := 1'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |"comment"
a := 1'
]

{ #category : #tests }
BISequenceExpressionTest >> testDontRetainBlankLinesBeforeComments [
	| expr source |
	expr := RBParser parseExpression: '|a b|
	a :=1.
	"Comment" b :=2'.
	configurationSelector := #dontRetainBlankLinesBeforeCommentsConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |a := 1.	"Comment" b := 2'
]

{ #category : #tests }
BISequenceExpressionTest >> testDontRetainBlankLinesBetweenStatements [
	| expr source |
	expr := RBParser parseExpression: '|a b| 
	
	a:=1.
	
	b:=a'.
	configurationSelector := #dontRetainBlankLinesBetweenStatementsConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |a := 1. b := a'
]

{ #category : #tests }
BISequenceExpressionTest >> testFormatEachStatement [
	| expr source |
	expr := RBParser parseExpression:'|a b|a:=1.b:=a'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |a := 1. b := a'
]

{ #category : #tests }
BISequenceExpressionTest >> testLineBetweenTemporariesAndComment [
	| expr source |
	expr := RBParser parseExpression: '|a b| "comment"'.
	configurationSelector := #newLineAfterTemporariesConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |
"comment"
'
]

{ #category : #tests }
BISequenceExpressionTest >> testNewLineBetweenStatement [
	| expr source |
	expr := RBParser parseExpression: '|a b| a := 1. b := a'.
	configurationSelector := #newLineAfterStatementConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |a := 1.
b := a'
]

{ #category : #tests }
BISequenceExpressionTest >> testNoPeriodAtEndOfBlock [
	| expr source |
	expr := RBParser parseExpression: '|a b| [1.].'.
	configurationSelector := #periodNotAsTerminatorConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |[ 1 ]'
]

{ #category : #tests }
BISequenceExpressionTest >> testNoPeriodAtEndOfMethode [
	| expr source |
	expr := RBParser parseExpression: '|a b| 6 factorial'.
	configurationSelector := #periodNotAsTerminatorConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |6 factorial'
]

{ #category : #tests }
BISequenceExpressionTest >> testPeriodAtEndOfBlock [
	| expr source |
	expr := RBParser parseExpression: '|a b| [1.].'.
	configurationSelector := #periodAsTerminatorConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |[ 1. ].'
]

{ #category : #tests }
BISequenceExpressionTest >> testPeriodAtEndOfMethode [
	| expr source |
	expr := RBParser parseExpression: '|a b| 6 factorial'.
	configurationSelector := #periodAsTerminatorConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |6 factorial.'
]

{ #category : #tests }
BISequenceExpressionTest >> testRetainBlankLinesBeforeComments [
	| expr source |
	expr := RBParser parseExpression: '|a b|
	a :=1.
	"Comment"
	b :=2'.
	configurationSelector := #retainBlankLinesBeforeCommentsConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |a := 1.
"Comment" b := 2'
]

{ #category : #tests }
BISequenceExpressionTest >> testRetainBlankLinesBetweenStatements [
	| expr source |
	expr := RBParser parseExpression: '|a b| 
	
	a:=1.
	
	b:=a'.
	
	configurationSelector := #retainBlankLinesBetweenStatementsConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |a := 1.

b := a'
]

{ #category : #tests }
BISequenceExpressionTest >> testRetainBlankLinesBetweenStatements2 [
	| expr source |
	expr := RBParser parseExpression: '|a b| 
	
	a:=1.
	
	
	b:=a'.
	configurationSelector := #retainBlankLinesBetweenStatementsConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |a := 1.


b := a'
]

{ #category : #tests }
BISequenceExpressionTest >> testRetainBlankLinesBetweenStatements3 [
	| expr source |
	expr := RBParser parseExpression: '|a b| 
	
	a:=1.
	b:=a'.
	configurationSelector := #retainBlankLinesBetweenStatementsConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |a := 1.
b := a'
]
