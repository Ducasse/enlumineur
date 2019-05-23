Class {
	#name : #BITemporariesExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #configurations }
BITemporariesExpressionTest >> basicCommentFormatConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
	useBasicCommentFormat: true;
	formatCommentWithStatements:true;
	indentString: '	';
	newLinesAfterTemporaries:0;
	retainBlankLinesBeforeComments:false
]

{ #category : #configurations }
BITemporariesExpressionTest >> commentWithStatementsConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:true;
		indentString: '	';
		newLinesAfterTemporaries:0;
		retainBlankLinesBeforeComments:false;
		useBasicCommentFormat:false;
		maxLineLength:50
]

{ #category : #configurations }
BITemporariesExpressionTest >> dontRetainBlankLinesBeforeComments [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		retainBlankLinesBeforeComments: false;
		useBasicCommentFormat: false;
		formatCommentWithStatements:false;
		indentString: '	';
		newLinesAfterTemporaries:0
]

{ #category : #configurations }
BITemporariesExpressionTest >> newLinesAfterTemporariesConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"
		
	^ self contextClass basicNew
		newLinesAfterTemporaries: 1;
		useBasicCommentFormat: false;
		formatCommentWithStatements:false;
		indentString: '	';
		retainBlankLinesBeforeComments:false
]

{ #category : #configurations }
BITemporariesExpressionTest >> noNewLinesAfterTemporariesConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		newLinesAfterTemporaries: 0;
		useBasicCommentFormat: false;
		formatCommentWithStatements:false;
		indentString: '	';
		retainBlankLinesBeforeComments:false
]

{ #category : #configurations }
BITemporariesExpressionTest >> notBasicCommentFormatConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		useBasicCommentFormat: false;
		formatCommentWithStatements:true;
		indentString: '	';
		newLinesAfterTemporaries:0;
		retainBlankLinesBeforeComments:false;
		maxLineLength: 50
]

{ #category : #configurations }
BITemporariesExpressionTest >> retainBlankLinesBeforeComments [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"
	^ self contextClass basicNew
		newLinesAfterTemporaries: 1;
		useBasicCommentFormat: false;
		formatCommentWithStatements:true;
		maxLineLength:50;
		indentString: '	';
		retainBlankLinesBeforeComments:true
]

{ #category : #tests }
BITemporariesExpressionTest >> testCommentBasicFormat [

	| expr source |
	expr := RBParser parseExpression: ' | d "    comment     " e |'.
	configurationSelector := #basicCommentFormatConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| d	"    comment     " e |'
]

{ #category : #tests }
BITemporariesExpressionTest >> testCommentNotBasicFormat [

	| expr source |
	expr := RBParser parseExpression: ' | d "    comment     " e |'.
	configurationSelector := #notBasicCommentFormatConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| d	"comment     
" e |'
]

{ #category : #tests }
BITemporariesExpressionTest >> testDontRetainBlankLinesBeforeComments [

	| expr source |
	expr := RBParser parseExpression: ' | d 
	"comment"e |'.
	configurationSelector := #dontRetainBlankLinesBeforeComments.
	source := self formatter format: expr.
	self assert: source equals:
'| d"comment"
 e |'
]

{ #category : #tests }
BITemporariesExpressionTest >> testDontRetainBlankLinesBeforeComments2 [

	| expr source |
	expr := RBParser parseExpression: ' | d 
	
	"comment"
	e |'.
	configurationSelector := #dontRetainBlankLinesBeforeComments.
	source := self formatter format: expr.
	self assert: source equals:
'| d"comment"
 e |'
]

{ #category : #tests }
BITemporariesExpressionTest >> testNewLineAfterTemporaries [

	| expr source |
	expr := RBParser parseExpression: ' |d e|'.
	configurationSelector := #newLinesAfterTemporariesConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| d e |
'
	
]

{ #category : #tests }
BITemporariesExpressionTest >> testNoNewLineAfterTemporaries [

	| expr source |
	expr := RBParser parseExpression: ' |d e|'.
	configurationSelector := #noNewLinesAfterTemporariesConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| d e |'
	
]

{ #category : #tests }
BITemporariesExpressionTest >> testRetainBlankLinesBeforeComments [

	| expr source |
	expr := RBParser parseExpression: ' | d 
	"comment"e |'.
	configurationSelector := #retainBlankLinesBeforeComments.
	source := self formatter format: expr.
	self assert: source equals:
'| d
"comment" e |
'
	
]

{ #category : #tests }
BITemporariesExpressionTest >> testRetainBlankLinesBeforeComments2 [

	| expr source |
	expr := RBParser parseExpression: ' | d 
	
	"comment"e |'.
	configurationSelector := #retainBlankLinesBeforeComments.
	source := self formatter format: expr.
	self assert: source equals:
'| d

"comment" e |
'
	
]

{ #category : #tests }
BITemporariesExpressionTest >> testRetainBlankLinesBeforeComments3 [

	| expr source |
	expr := RBParser parseExpression: ' | d "comment" e |'.
	configurationSelector := #retainBlankLinesBeforeComments.
	source := self formatter format: expr.
	self assert: source equals:
'| d	"comment" e |
'
	
]

{ #category : #tests }
BITemporariesExpressionTest >> testSpaceBetweenTemporaries [
	| expr source |
	expr := RBParser parseExpression: '|a|'.
	configurationSelector := #noNewLinesAfterTemporariesConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a |'
]

{ #category : #tests }
BITemporariesExpressionTest >> testSpaceBetweenTemporaries2 [
	| expr source |
	expr := RBParser parseExpression: '|a b|'.
	configurationSelector := #noNewLinesAfterTemporariesConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |'
]

{ #category : #tests }
BITemporariesExpressionTest >> testTabBetweenVarAndComment [

	| expr source |
	expr := RBParser parseExpression: ' | d "comment" |'.
	configurationSelector := #commentWithStatementsConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| d	"comment" |'
]

{ #category : #tests }
BITemporariesExpressionTest >> testTwoLinesAfterTemporaries [

	| expr source |
	expr := RBParser parseExpression: ' |d e|'.
	configurationSelector := #twoLinesAfterTemporariesConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| d e |

'
	
]

{ #category : #configurations }
BITemporariesExpressionTest >> twoLinesAfterTemporariesConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"
		
	^ self contextClass basicNew
		newLinesAfterTemporaries: 2;
		useBasicCommentFormat: false;
		formatCommentWithStatements:false;
		indentString: '	';
		retainBlankLinesBeforeComments:false
]
