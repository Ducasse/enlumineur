Class {
	#name : #BIEnlumineurMethodExpressionTest,
	#superclass : #BIEnlumineurTest,
	#category : #'Enlumineur-Tests'
}

{ #category : #configurations }
BIEnlumineurMethodExpressionTest >> basicCommentFormatConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false;
		useBasicCommentFormat: true;
		newLinesAfterMethodPattern: 1;
		numberOfNewLinesAfterMethodComment: 1;
		indentExtraSpaces: 0
]

{ #category : #configurations }
BIEnlumineurMethodExpressionTest >> basicConfiguration [
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
		numberOfNewLinesAfterMethodComment: 1;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurMethodExpressionTest >> bigMethodeConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements: false;
		useBasicCommentFormat: false;
		maxLineLength: 50;
		periodsAtEndOfBlock: false;
		periodsAtEndOfMethod: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		indentsForKeywords: 1;
		keepBlockInMessage: true;
		retainBlankLinesBetweenStatements: false;
		retainBlankLinesBetweenStatements: false;
		minimumNewLinesBetweenStatements: 1;
		newLineBeforeFirstCascade: true;
		newLineAfterCascade: true;
		numberOfArgumentsForMultiLine: 4;
		newLinesAfterTemporaries: 1;
		numberOfSpacesInsideBlock: 0;
		lineUpBlockBrackets: true;
		newLinesAfterMethodPattern: 1;
		numberOfNewLinesAfterMethodComment: 1;
		newLineBeforeFirstKeyword:true;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurMethodExpressionTest >> cascadeConfiguration [
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
		minimumNewLinesBetweenStatements: 1;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurMethodExpressionTest >> newLineBetweenTopCommentsConfiguration [
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
		numberOfNewLinesAfterMethodComment: 1;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurMethodExpressionTest >> noNewLineBetweenTopCommentsConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false;
		useBasicCommentFormat: true;
		newLinesAfterMethodPattern: 1;
		numberOfNewLinesAfterMethodComment: 0;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurMethodExpressionTest >> noNewLinesAfterCommentConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false;
		useBasicCommentFormat: true;
		newLinesAfterMethodPattern: 1;
		numberOfNewLinesAfterMethodComment: 1;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurMethodExpressionTest >> notBasicCommentFormatConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false;
		useBasicCommentFormat: false;
		maxLineLength: 50;	
		newLinesAfterMethodPattern: 1;
		numberOfNewLinesAfterMethodComment: 1;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurMethodExpressionTest >> oneNewLineAfterCommentConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false;
		useBasicCommentFormat:false;
		maxLineLength:50;
		newLinesAfterMethodPattern: 1;
		numberOfNewLinesAfterMethodComment: 2;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurMethodExpressionTest >> oneNewLinesAfterSignatureConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false
]

{ #category : #configurations }
BIEnlumineurMethodExpressionTest >> signatureConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false;
		newLinesAfterMethodPattern: 1;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurMethodExpressionTest >> signatureNotOnMultipleLinesConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false;
		methodSignatureOnMultipleLines: false;
		newLinesAfterMethodPattern: 1;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurMethodExpressionTest >> signatureOnMultipleLinesConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false;
		methodSignatureOnMultipleLines: true;
		selectorAndArgumentCombinedMaxSize: 2;
		newLinesAfterMethodPattern: 0;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurMethodExpressionTest >> spaceIndentConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		numberOfSpacesInIndent: 10; "pay attention since there are dependency."
		indentStyle: #space;
		formatCommentWithStatements:false;
		useBasicCommentFormat: false;
		maxLineLength: 50;
		periodsAtEndOfBlock: false;
		periodsAtEndOfMethod: false;
		newLinesAfterMethodPattern: 1;
		numberOfNewLinesAfterMethodComment: 1;
		indentExtraSpaces:0
]

{ #category : #test }
BIEnlumineurMethodExpressionTest >> testBasic [
	| expr source |
	expr := RBParser parseMethod: 'aMethod <pragma> "aComment" body'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethod
	"aComment"
	<pragma>
	body'
]

{ #category : #test }
BIEnlumineurMethodExpressionTest >> testBasic2 [
	| expr source |
	expr := RBParser parseMethod: 'aMethod <pragma1> <pragma2> "aComment1" "aComment2"  body'.
	configurationSelector := #newLineBetweenTopCommentsConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethod
	"aComment1"
	"aComment2"
	<pragma1>
	<pragma2>
	body'
]

{ #category : #test }
BIEnlumineurMethodExpressionTest >> testBasicSpaceIndent [
	| expr source |
	expr := RBParser parseMethod: 'aMethod <pragma> "aComment" body'.
	configurationSelector := #spaceIndentConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethod
          "aComment"
          <pragma>
          body'
]

{ #category : #test }
BIEnlumineurMethodExpressionTest >> testBigMethod [
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
	tmp to: 10 do: [:i | 
		Transcript
			show: i;
			cr;
			cr
		]'
]

{ #category : #test }
BIEnlumineurMethodExpressionTest >> testCommentBasicFormat [
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
BIEnlumineurMethodExpressionTest >> testCommentNotBasicFormat [
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
BIEnlumineurMethodExpressionTest >> testFormatBody [
	| expr source |
	expr := RBParser parseMethod: 'aMethode a:=1'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	a := 1'
]

{ #category : #test }
BIEnlumineurMethodExpressionTest >> testIndentCascade [
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
BIEnlumineurMethodExpressionTest >> testNewLinesAfterComment [
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
BIEnlumineurMethodExpressionTest >> testNewLinesAfterComment2 [
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
BIEnlumineurMethodExpressionTest >> testNewLinesAfterGluedComment [
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
BIEnlumineurMethodExpressionTest >> testNewLinesBetweenTopComments [
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
BIEnlumineurMethodExpressionTest >> testNoNewLinesAfterComment [
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
BIEnlumineurMethodExpressionTest >> testNoNewLinesAfterGluedComment [
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
BIEnlumineurMethodExpressionTest >> testNoNewLinesAfterSignature [
	| expr source |
	expr := RBParser parseMethod: 'aMethode'.
	configurationSelector := #signatureConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	'
]

{ #category : #test }
BIEnlumineurMethodExpressionTest >> testNoNewLinesBetweenTopComments [
	| expr source |
	expr := RBParser parseMethod: 'aMethode "aComment" "anotherComment"'.
	configurationSelector := #noNewLineBetweenTopCommentsConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	"aComment"	"anotherComment"	'

]

{ #category : #test }
BIEnlumineurMethodExpressionTest >> testOneNewLinesAfterSignature [
	| expr source |
	expr := RBParser parseMethod: 'aMethode'.
	configurationSelector := #oneNewLineAfterCommentConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	'
]

{ #category : #test }
BIEnlumineurMethodExpressionTest >> testPragma [
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
BIEnlumineurMethodExpressionTest >> testSignatureNotOnMultipleLines [
	| expr source |
	expr := RBParser parseMethod: 'aMethode:arg1 foo:arg2'.
	configurationSelector := #signatureNotOnMultipleLinesConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode: arg1 foo: arg2
	'
]

{ #category : #test }
BIEnlumineurMethodExpressionTest >> testSignatureOnMultipleLines [
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
BIEnlumineurMethodExpressionTest >> testSignatureWithArgument [
	| expr source |
	expr := RBParser parseMethod: 'aMethode:arg'.
	configurationSelector := #signatureNotOnMultipleLinesConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode: arg
	'
]

{ #category : #test }
BIEnlumineurMethodExpressionTest >> testSignatureWithoutArgument [
	| expr source |
	expr := RBParser parseMethod: 'aMethode'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	'
]

{ #category : #test }
BIEnlumineurMethodExpressionTest >> testTwoNewLinesAfterSignature [
	| expr source |
	expr := RBParser parseMethod: 'aMethode'.
	configurationSelector := #twoNewLinesAfterSignatureConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode


	'
]

{ #category : #configurations }
BIEnlumineurMethodExpressionTest >> twoNewLinesAfterSignatureConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false;
		newLinesAfterMethodPattern: 3;
		indentExtraSpaces:0
]
