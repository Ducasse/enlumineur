Class {
	#name : #BIEnlumineurMethodeExpressionTest,
	#superclass : #BIEnlumineurTest,
	#category : #'BlueInk-Enlumineur-Tests'
}

{ #category : #configurations }
BIEnlumineurMethodeExpressionTest >> basicCommentFormatConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false;
		useBasicCommentFormat: true;
		newLinesAfterMethodPattern: 1;
		newLinesAfterMethodComment: 1
]

{ #category : #configurations }
BIEnlumineurMethodeExpressionTest >> basicConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false;
		useBasicCommentFormat: false;
		maxLineLength: 50;
		periodsAtEndOfBlock: false;
		periodsAtEndOfMethod: false;
		newLinesAfterMethodPattern: 1;
		newLinesAfterMethodComment: 1
]

{ #category : #configurations }
BIEnlumineurMethodeExpressionTest >> bigMethodeConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false;
		useBasicCommentFormat: false;
		maxLineLength: 50;
		periodsAtEndOfBlock: false;
		periodsAtEndOfMethod: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		indentsForKeywords: 1;
		keepBlockInMessage:true;
		retainBlankLinesBetweenStatements:false;
		retainBlankLinesBetweenStatements: false;
		minimumNewLinesBetweenStatements:1;
		newLineBeforeFirstCascade:true;
		newLineAfterCascade:true;
		numberOfArgumentsForMultiLine:4;
		newLinesAfterTemporaries:1;
		numberOfSpacesInsideBlock:0;
		lineUpBlockBrackets: true;
		newLinesAfterMethodPattern: 1;
		newLinesAfterMethodComment: 1
]

{ #category : #configurations }
BIEnlumineurMethodeExpressionTest >> cascadeConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false;
		useBasicCommentFormat: false;
		maxLineLength: 50;
		periodsAtEndOfBlock: false;
		periodsAtEndOfMethod: false;
		newLineBeforeFirstCascade:true;
		newLineAfterCascade:true;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine:10;
		keepBlockInMessage:true;
		retainBlankLinesBetweenStatements:false;
		newLinesAfterMethodPattern:1;
		minimumNewLinesBetweenStatements: 1
]

{ #category : #configurations }
BIEnlumineurMethodeExpressionTest >> newLineAfterSignatureConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false;
		newLinesAfterMethodPattern: 1
]

{ #category : #configurations }
BIEnlumineurMethodeExpressionTest >> newLineBetweenTopCommentsConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false;
		useBasicCommentFormat: false;
		maxLineLength: 50;
		periodsAtEndOfBlock: false;
		periodsAtEndOfMethod: false;
		newLinesAfterMethodPattern: 1;
		newLinesAfterMethodComment: 1
]

{ #category : #configurations }
BIEnlumineurMethodeExpressionTest >> noNewLineBetweenTopCommentsConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false;
		useBasicCommentFormat: true;
		newLinesAfterMethodPattern: 1;
		newLinesAfterMethodComment: 0
]

{ #category : #configurations }
BIEnlumineurMethodeExpressionTest >> noNewLinesAfterCommentConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false;
		useBasicCommentFormat: true;
		newLinesAfterMethodPattern: 1;
		newLinesAfterMethodComment: 1
]

{ #category : #configurations }
BIEnlumineurMethodeExpressionTest >> notBasicCommentFormatConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false;
		useBasicCommentFormat: false;
		maxLineLength: 50;	
		newLinesAfterMethodPattern: 1;
		newLinesAfterMethodComment: 1
]

{ #category : #configurations }
BIEnlumineurMethodeExpressionTest >> oneNewLineAfterCommentConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false;
		useBasicCommentFormat:false;
		maxLineLength:50;
		newLinesAfterMethodPattern: 1;
		newLinesAfterMethodComment: 2
]

{ #category : #configurations }
BIEnlumineurMethodeExpressionTest >> oneNewLinesAfterSignatureConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false
]

{ #category : #configurations }
BIEnlumineurMethodeExpressionTest >> signatureConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false;
		newLinesAfterMethodPattern: 1
]

{ #category : #configurations }
BIEnlumineurMethodeExpressionTest >> signatureNotOnMultipleLinesConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false;
		methodSignatureOnMultipleLines: false;
		newLinesAfterMethodPattern: 1
]

{ #category : #configurations }
BIEnlumineurMethodeExpressionTest >> signatureOnMultipleLinesConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false;
		methodSignatureOnMultipleLines: true;
		selectorAndArgumentCombinedMaxSize: 2;
		newLinesAfterMethodPattern: 0
]

{ #category : #test }
BIEnlumineurMethodeExpressionTest >> testBasic [
	| expr source |
	expr := RBParser parseMethod: 'aMethode <pragma> "aComment" body'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	"aComment"
	<pragma>
	body'
]

{ #category : #test }
BIEnlumineurMethodeExpressionTest >> testBasic2 [
	| expr source |
	expr := RBParser parseMethod: 'aMethode <pragma1> <pragma2> "aComment1" "aComment2"  body'.
	configurationSelector := #newLineBetweenTopCommentsConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	"aComment1"
	"aComment2"
	<pragma1>
	<pragma2>
	body'
]

{ #category : #test }
BIEnlumineurMethodeExpressionTest >> testBigMethode [
	| expr source |
	expr := RBParser parseMethod: 
	'aMethode
	"aComment"
	"anotherComment"
	<pragma>
	| tmp |
	tmp := 1.
	tmp to: 10 do: [:i | Transcript show:i ; cr ;cr]
	'.
	configurationSelector := #bigMethodeConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	"aComment"
	"anotherComment"
	<pragma>
	| tmp |
	tmp := 1.
	tmp
		to: 10
		do: [:i | 
			Transcript
				show: i;
				cr;
				cr
			]'
]

{ #category : #test }
BIEnlumineurMethodeExpressionTest >> testCommentBasicFormat [
	| expr source |
	expr := RBParser parseMethod: 'aMethode "   aComment   "'.
	configurationSelector := #basicCommentFormatConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	"   aComment   "
	'
]

{ #category : #test }
BIEnlumineurMethodeExpressionTest >> testCommentNotBasicFormat [
	| expr source |
	expr := RBParser parseMethod: 'aMethode "   aComment   "'.
	configurationSelector := #notBasicCommentFormatConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	"aComment   "
	'
]

{ #category : #test }
BIEnlumineurMethodeExpressionTest >> testFormatBody [
	| expr source |
	expr := RBParser parseMethod: 'aMethode a:=1'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	a := 1'
]

{ #category : #test }
BIEnlumineurMethodeExpressionTest >> testIndentCascade [
	| expr source |
	expr := RBParser parseMethod: 'aMethode	Transcript cr; show: ''foo'';	cr. Transcript cr;cr'.
	configurationSelector := #cascadeConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	Transcript
		cr;
		show: ''foo'';
		cr.
	Transcript
		cr;
		cr'
]

{ #category : #test }
BIEnlumineurMethodeExpressionTest >> testNewLinesAfterComment [
	| expr source |
	expr := RBParser parseMethod: 'aMethode "aComment"'.
	configurationSelector := #oneNewLineAfterCommentConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	"aComment"

	'
]

{ #category : #test }
BIEnlumineurMethodeExpressionTest >> testNewLinesAfterComment2 [
	| expr source |
	expr := RBParser parseMethod: 'aMethode "aComment" "anotherComment"'.
	configurationSelector := #oneNewLineAfterCommentConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	"aComment"

	"anotherComment"

	'
]

{ #category : #test }
BIEnlumineurMethodeExpressionTest >> testNewLinesAfterGluedComment [
	| expr source |
	expr := RBParser parseMethod: 'aMethode"aComment""anotherComment"'.
	configurationSelector := #oneNewLineAfterCommentConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	"aComment""anotherComment"

	'
]

{ #category : #test }
BIEnlumineurMethodeExpressionTest >> testNewLinesAfterSignature [
	| expr source |
	expr := RBParser parseMethod: 'aMethode'.
	configurationSelector := #newLineAfterSignatureConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	'
]

{ #category : #test }
BIEnlumineurMethodeExpressionTest >> testNewLinesBetweenTopComments [
	| expr source |
	expr := RBParser parseMethod: 'aMethode "aComment" "anotherComment"'.
	configurationSelector := #newLineBetweenTopCommentsConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	"aComment"
	"anotherComment"
	'
]

{ #category : #test }
BIEnlumineurMethodeExpressionTest >> testNoNewLinesAfterComment [
	| expr source |
	expr := RBParser parseMethod: 'aMethode "aComment"'.
	configurationSelector := #basicCommentFormatConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	"aComment"
	'

]

{ #category : #test }
BIEnlumineurMethodeExpressionTest >> testNoNewLinesAfterGluedComment [
	| expr source |
	expr := RBParser parseMethod: 'aMethode "aComment""anotherComment"'.
	configurationSelector := #noNewLinesAfterCommentConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	"aComment""anotherComment"
	'

]

{ #category : #test }
BIEnlumineurMethodeExpressionTest >> testNoNewLinesAfterSignature [
	| expr source |
	expr := RBParser parseMethod: 'aMethode'.
	configurationSelector := #signatureConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	'
]

{ #category : #test }
BIEnlumineurMethodeExpressionTest >> testNoNewLinesBetweenTopComments [
	| expr source |
	expr := RBParser parseMethod: 'aMethode "aComment" "anotherComment"'.
	configurationSelector := #noNewLineBetweenTopCommentsConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	"aComment"	"anotherComment"	'

]

{ #category : #test }
BIEnlumineurMethodeExpressionTest >> testOneNewLinesAfterSignature [
	| expr source |
	expr := RBParser parseMethod: 'aMethode'.
	configurationSelector := #oneNewLineAfterCommentConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	'
]

{ #category : #test }
BIEnlumineurMethodeExpressionTest >> testPragma [
	| expr source |
	expr := RBParser parseMethod: 'aMethode <pragma>'.
	configurationSelector := #notBasicCommentFormatConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	<pragma>
	'
]

{ #category : #test }
BIEnlumineurMethodeExpressionTest >> testSignatureNotOnMultipleLines [
	| expr source |
	expr := RBParser parseMethod: 'aMethode:arg1 foo:arg2'.
	configurationSelector := #signatureNotOnMultipleLinesConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode: arg1 foo: arg2
	'
]

{ #category : #test }
BIEnlumineurMethodeExpressionTest >> testSignatureOnMultipleLines [
	| expr source |
	expr := RBParser parseMethod: 'aMethode: arg1 foo:arg2'.
	configurationSelector := #signatureOnMultipleLinesConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode: arg1
	foo: arg2
	'
]

{ #category : #test }
BIEnlumineurMethodeExpressionTest >> testSignatureWithArgument [
	| expr source |
	expr := RBParser parseMethod: 'aMethode:arg'.
	configurationSelector := #signatureNotOnMultipleLinesConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode: arg
	'
]

{ #category : #test }
BIEnlumineurMethodeExpressionTest >> testSignatureWithoutArgument [
	| expr source |
	expr := RBParser parseMethod: 'aMethode'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	'
]

{ #category : #test }
BIEnlumineurMethodeExpressionTest >> testTwoNewLinesAfterSignature [
	| expr source |
	expr := RBParser parseMethod: 'aMethode'.
	configurationSelector := #twoNewLinesAfterSignatureConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode


	'
]

{ #category : #configurations }
BIEnlumineurMethodeExpressionTest >> twoNewLinesAfterSignatureConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false;
		newLinesAfterMethodPattern: 3
]
