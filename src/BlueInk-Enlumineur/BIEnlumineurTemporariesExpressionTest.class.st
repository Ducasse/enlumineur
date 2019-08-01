Class {
	#name : #BIEnlumineurTemporariesExpressionTest,
	#superclass : #BIEnlumineurTest,
	#category : #'BlueInk-Enlumineur-Tests'
}

{ #category : #configurations }
BIEnlumineurTemporariesExpressionTest >> basicCommentFormatConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
	useBasicCommentFormat: true;
	formatCommentWithStatements:true;
	indentStyle: #tabulation;
	newLinesAfterTemporaries:0;
	retainBlankLinesBeforeComments:false;
	indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurTemporariesExpressionTest >> commentWithStatementsConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:true;
		indentStyle: #tabulation;
		newLinesAfterTemporaries:0;
		retainBlankLinesBeforeComments:false;
		useBasicCommentFormat:false;
		maxLineLength:50;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurTemporariesExpressionTest >> dontRetainBlankLinesBeforeComments [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		retainBlankLinesBeforeComments: false;
		useBasicCommentFormat: false;
		formatCommentWithStatements:false;
		indentStyle: #tabulation;
		newLinesAfterTemporaries:0;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurTemporariesExpressionTest >> newLinesAfterTemporariesConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"
		
	^ self contextClass basicNew
		newLinesAfterTemporaries: 1;
		useBasicCommentFormat: false;
		formatCommentWithStatements:false;
		indentStyle: #tabulation;
		retainBlankLinesBeforeComments:false;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurTemporariesExpressionTest >> noNewLinesAfterTemporariesConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		newLinesAfterTemporaries: 0;
		useBasicCommentFormat: false;
		formatCommentWithStatements:false;
		indentStyle: #tabulation;
		retainBlankLinesBeforeComments:false;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurTemporariesExpressionTest >> notBasicCommentFormatConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		useBasicCommentFormat: false;
		formatCommentWithStatements:true;
		indentStyle: #tabulation;
		newLinesAfterTemporaries:0;
		retainBlankLinesBeforeComments:false;
		maxLineLength: 50;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurTemporariesExpressionTest >> retainBlankLinesBeforeComments [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"
	^ self contextClass basicNew
		newLinesAfterTemporaries: 1;
		useBasicCommentFormat: false;
		formatCommentWithStatements:true;
		maxLineLength:50;
		indentStyle: #tabulation;
		retainBlankLinesBeforeComments:true;
		indentExtraSpaces:0
]

{ #category : #tests }
BIEnlumineurTemporariesExpressionTest >> testCommentBasicFormat [
	| source |
	configurationSelector := #basicCommentFormatConfiguration.
	source := self formatExpression: ' | d "    comment     " e |'.
	self assert: source equals: '| d "    comment     " e |'
]

{ #category : #tests }
BIEnlumineurTemporariesExpressionTest >> testCommentNotBasicFormat [
	| source |
	configurationSelector := #notBasicCommentFormatConfiguration.
	source := self formatExpression: ' | d "    comment     " e |'.
	self
		assert: source
		equals:
			'| d "comment     
" e |'
]

{ #category : #tests }
BIEnlumineurTemporariesExpressionTest >> testDontRetainBlankLinesBeforeComments [
	| source |
	configurationSelector := #dontRetainBlankLinesBeforeComments.
	source := self
		formatExpression:
			' | d 
	"comment"e |'.
	self
		assert: source
		equals:
			'| d "comment" e |'
]

{ #category : #tests }
BIEnlumineurTemporariesExpressionTest >> testDontRetainBlankLinesBeforeComments2 [
	| source |
	configurationSelector := #dontRetainBlankLinesBeforeComments.
	source := self
		formatExpression:
			' | d 
	
	"comment"
	e |'.
	self
		assert: source
		equals: '| d "comment" e |'
]

{ #category : #tests }
BIEnlumineurTemporariesExpressionTest >> testNewLineAfterTemporaries [
	| source |
	configurationSelector := #newLinesAfterTemporariesConfiguration.
	source := self formatExpression: ' |d e|'.
	self
		assert: source
		equals: '| d e |
'
]

{ #category : #tests }
BIEnlumineurTemporariesExpressionTest >> testNoNewLineAfterTemporaries [
	| source |
	configurationSelector := #noNewLinesAfterTemporariesConfiguration.
	source := self formatExpression: ' |d e|'.
	self assert: source equals: '| d e |'
]

{ #category : #tests }
BIEnlumineurTemporariesExpressionTest >> testRetainBlankLinesBeforeComments [
	| source |
	configurationSelector := #retainBlankLinesBeforeComments.
	source := self
		formatExpression:
			' | d 
	"comment"e |'.
	self
		assert: source
		equals:
			'| d
"comment" e |
'
]

{ #category : #tests }
BIEnlumineurTemporariesExpressionTest >> testRetainBlankLinesBeforeComments2 [
	| source |
	configurationSelector := #retainBlankLinesBeforeComments.
	source := self
		formatExpression:
			' | d 
	
	"comment"e |'.
	self
		assert: source
		equals:
			'| d

"comment" e |
'
]

{ #category : #tests }
BIEnlumineurTemporariesExpressionTest >> testRetainBlankLinesBeforeComments3 [
	| source |
	configurationSelector := #retainBlankLinesBeforeComments.
	source := self formatExpression: ' | d "comment" e |'.
	self
		assert: source
		equals:
			'| d "comment" e |
'
]

{ #category : #tests }
BIEnlumineurTemporariesExpressionTest >> testSpaceBetweenTemporaries [
	| source |
	configurationSelector := #noNewLinesAfterTemporariesConfiguration.
	source := self formatExpression: '|a|'.
	self assert: source equals: '| a |'
]

{ #category : #tests }
BIEnlumineurTemporariesExpressionTest >> testSpaceBetweenTemporaries2 [
	| source |
	configurationSelector := #noNewLinesAfterTemporariesConfiguration.
	source := self formatExpression: '|a b|'.
	self assert: source equals: '| a b |'
]

{ #category : #tests }
BIEnlumineurTemporariesExpressionTest >> testTabBetweenVarAndComment [
	| source |
	configurationSelector := #commentWithStatementsConfiguration.
	source := self formatExpression: ' | d "comment" |'.
	self assert: source equals: '| d "comment" |'
]

{ #category : #tests }
BIEnlumineurTemporariesExpressionTest >> testTwoLinesAfterTemporaries [
	| source |
	configurationSelector := #twoLinesAfterTemporariesConfiguration.
	source := self formatExpression: ' |d e|'.
	self
		assert: source
		equals:
			'| d e |

'
]

{ #category : #configurations }
BIEnlumineurTemporariesExpressionTest >> twoLinesAfterTemporariesConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"
		
	^ self contextClass basicNew
		newLinesAfterTemporaries: 2;
		useBasicCommentFormat: false;
		formatCommentWithStatements:false;
		indentStyle: #tabulation;
		retainBlankLinesBeforeComments:false;
		indentExtraSpaces:0
]
