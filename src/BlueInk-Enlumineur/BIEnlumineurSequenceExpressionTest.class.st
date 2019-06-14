Class {
	#name : #BIEnlumineurSequenceExpressionTest,
	#superclass : #BIEnlumineurTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #configurations }
BIEnlumineurSequenceExpressionTest >> basicConfiguration [ 

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

{ #category : #tests }
BIEnlumineurSequenceExpressionTest >> dontFormatCommentWithStatementConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:false;
		indentString: '	';
		newLinesAfterTemporaries:0;
		retainBlankLinesBeforeComments:false;
		useBasicCommentFormat:false;
		maxLineLength:50;
		retainBlankLinesBetweenStatements:false;
		minimumNewLinesBetweenStatements:0;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod:false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 5;
		indentsForKeywords: 0;
		keepBlockInMessage: false;
		newLineBeforeFirstKeyword:false
]

{ #category : #configurations }
BIEnlumineurSequenceExpressionTest >> dontRetainBlankLinesBeforeCommentsConfiguration [
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
BIEnlumineurSequenceExpressionTest >> dontRetainBlankLinesBetweenStatementsConfiguration [
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

{ #category : #tests }
BIEnlumineurSequenceExpressionTest >> formatCommentWithStatementConfiguration [

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
		periodsAtEndOfMethod:false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 5;
		indentsForKeywords: 0;
		keepBlockInMessage: false;
		newLineBeforeFirstKeyword: false
]

{ #category : #configurations }
BIEnlumineurSequenceExpressionTest >> newLineAfterStatementConfiguration [

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
BIEnlumineurSequenceExpressionTest >> newLineAfterTemporariesConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:true;
		indentString: '	';
		newLinesAfterTemporaries:1
]

{ #category : #configurations }
BIEnlumineurSequenceExpressionTest >> periodAsTerminatorConfiguration [
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
		numberOfSpacesInsideBlock:1;
		lineUpBlockBrackets: true;
		multiLineMessages:Array new;
		oneLineMessages:Array new;
		numberOfArgumentsForMultiLine:2;
		newLineBeforeFirstKeyword:false
]

{ #category : #configurations }
BIEnlumineurSequenceExpressionTest >> periodNotAsTerminatorConfiguration [ 

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
		numberOfSpacesInsideBlock:1;
		lineUpBlockBrackets: true;
		multiLineMessages:Array new;
		oneLineMessages:Array new;
		numberOfArgumentsForMultiLine:2;
		newLineBeforeFirstKeyword:false
]

{ #category : #configurations }
BIEnlumineurSequenceExpressionTest >> retainBlankLinesBeforeCommentsConfiguration [
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
BIEnlumineurSequenceExpressionTest >> retainBlankLinesBetweenStatementsConfiguration [
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
BIEnlumineurSequenceExpressionTest >> testCommentBetweenStatements [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '|a b| a := 1."comment"b := 2'.
	self assert: source equals: '| a b |a := 1.	"comment" b := 2'
]

{ #category : #tests }
BIEnlumineurSequenceExpressionTest >> testCommentBetweenTemporariesAndStatement [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '|a b| "comment" a := 1'.
	self
		assert: source
		equals:
			'| a b |"comment"a := 1'
]

{ #category : #tests }
BIEnlumineurSequenceExpressionTest >> testDontFormatCommentWithStatement [
	| source |
	self flag: 'change the expected result to : 1 + 3 "We do an addition".	2'.
	configurationSelector := #dontFormatCommentWithStatementConfiguration.
	source := self formatExpression: '1+3 "We do an addition". 2'.
	self assert: source equals:
 '1 + 3 "We do an addition". 2'
]

{ #category : #tests }
BIEnlumineurSequenceExpressionTest >> testDontRetainBlankLinesBeforeComments [
	| source |
	configurationSelector := #dontRetainBlankLinesBeforeCommentsConfiguration.
	source := self
		formatExpression:
			'|a b|
	a :=1.
	"Comment" b :=2'.
	self assert: source equals: '| a b |a := 1.	"Comment" b := 2'
]

{ #category : #tests }
BIEnlumineurSequenceExpressionTest >> testDontRetainBlankLinesBetweenStatements [
	| source |
	configurationSelector := #dontRetainBlankLinesBetweenStatementsConfiguration.
	source := self
		formatExpression:
			'|a b| 
	
	a:=1.
	
	b:=a'.
	self assert: source equals: '| a b |a := 1. b := a'
]

{ #category : #tests }
BIEnlumineurSequenceExpressionTest >> testFormatCommentWithStatement [
	| source |
	configurationSelector := #formatCommentWithStatementConfiguration.
	source := self formatExpression: '1+1 "We do an addition". 2'.
	self assert: source equals: 
'1 + 1.	"We do an addition" 2'
]

{ #category : #tests }
BIEnlumineurSequenceExpressionTest >> testFormatEachStatement [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '|a b|a:=1.b:=a'.
	self assert: source equals: '| a b |a := 1. b := a'
]

{ #category : #tests }
BIEnlumineurSequenceExpressionTest >> testLineBetweenTemporariesAndComment [
	| source |
	configurationSelector := #newLineAfterTemporariesConfiguration.
	source := self formatExpression: '|a b| "comment"'.
	self
		assert: source
		equals:
			'| a b |
"comment"'
]

{ #category : #tests }
BIEnlumineurSequenceExpressionTest >> testNewLineBetweenStatement [
	| source |
	configurationSelector := #newLineAfterStatementConfiguration.
	source := self formatExpression: '|a b| a := 1. b := a'.
	self
		assert: source
		equals:
			'| a b |a := 1.
b := a'
]

{ #category : #tests }
BIEnlumineurSequenceExpressionTest >> testNoPeriodAtEndOfBlock [
	| source |
	configurationSelector := #periodNotAsTerminatorConfiguration.
	source := self formatExpression: '|a b| [1.].'.
	self assert: source equals: '| a b |[ 1 ]'
]

{ #category : #tests }
BIEnlumineurSequenceExpressionTest >> testNoPeriodAtEndOfMethode [
	| source |
	configurationSelector := #periodNotAsTerminatorConfiguration.
	source := self formatExpression: '|a b| 6 factorial'.
	self assert: source equals: '| a b |6 factorial'
]

{ #category : #tests }
BIEnlumineurSequenceExpressionTest >> testPeriodAtEndOfBlock [
	| source |
	configurationSelector := #periodAsTerminatorConfiguration.
	source := self formatExpression: '|a b| [1.].'.
	self assert: source equals: '| a b |[ 1. ].'
]

{ #category : #tests }
BIEnlumineurSequenceExpressionTest >> testPeriodAtEndOfMethode [
	| source |
	configurationSelector := #periodAsTerminatorConfiguration.
	source := self formatExpression: '|a b| 6 factorial'.
	self assert: source equals: '| a b |6 factorial.'
]

{ #category : #tests }
BIEnlumineurSequenceExpressionTest >> testRetainBlankLinesBeforeComments [
	| source |
	configurationSelector := #retainBlankLinesBeforeCommentsConfiguration.
	source := self
		formatExpression:
			'|a b|
	a :=1.
	"Comment"
	b :=2'.
	self
		assert: source
		equals:
			'| a b |a := 1.
"Comment" b := 2'
]

{ #category : #tests }
BIEnlumineurSequenceExpressionTest >> testRetainBlankLinesBetweenStatements [
	| source |
	configurationSelector := #retainBlankLinesBetweenStatementsConfiguration.
	source := self
		formatExpression:
			'|a b| 
	
	a:=1.
	
	b:=a'.
	self
		assert: source
		equals:
			'| a b |a := 1.

b := a'
]

{ #category : #tests }
BIEnlumineurSequenceExpressionTest >> testRetainBlankLinesBetweenStatements2 [
	| source |
	configurationSelector := #retainBlankLinesBetweenStatementsConfiguration.
	source := self
		formatExpression:
			'|a b| 
	
	a:=1.
	
	
	b:=a'.
	self
		assert: source
		equals:
			'| a b |a := 1.


b := a'
]

{ #category : #tests }
BIEnlumineurSequenceExpressionTest >> testRetainBlankLinesBetweenStatements3 [
	| source |
	configurationSelector := #retainBlankLinesBetweenStatementsConfiguration.
	source := self
		formatExpression:
			'|a b| 
	
	a:=1.
	b:=a'.
	self
		assert: source
		equals:
			'| a b |a := 1.
b := a'
]
