Class {
	#name : #BIMethodeExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #configurations }
BIMethodeExpressionTest >> basicCommentFormatConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
	indentString: '	';
	newLinesAfterSignature:0;
	newLinesAfterCommentZone:0;
	formatCommentWithStatements:false;
	useBasicCommentFormat: true
]

{ #category : #configurations }
BIMethodeExpressionTest >> basicConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
	indentString: '	';
	newLinesAfterSignature:0;
	newLinesAfterCommentZone:0;
	formatCommentWithStatements:false;
	useBasicCommentFormat: false;
	maxLineLength: 50;
	periodsAtEndOfBlock: false;
	periodsAtEndOfMethod: false
]

{ #category : #configurations }
BIMethodeExpressionTest >> newLineBetweenTopCommentsConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
	indentString: '	';
	newLinesAfterSignature:0;
	newLinesAfterCommentZone:0;
	formatCommentWithStatements:false;
	useBasicCommentFormat: true;
	newLinesBetweenTopComments:0
]

{ #category : #configurations }
BIMethodeExpressionTest >> noNewLinesAfterCommentConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
	indentString: '	';
	newLinesAfterSignature:0;
	newLinesAfterCommentZone:0;
	formatCommentWithStatements:false;
	useBasicCommentFormat: true
]

{ #category : #configurations }
BIMethodeExpressionTest >> notBasicCommentFormatConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
	indentString: '	';
	newLinesAfterSignature:0;
	newLinesAfterCommentZone:0;
	formatCommentWithStatements:false;
	useBasicCommentFormat: false;
	maxLineLength: 50
]

{ #category : #configurations }
BIMethodeExpressionTest >> oneNewLineAfterCommentConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
	indentString: '	';
	newLinesAfterSignature:0;
	newLinesAfterCommentZone:1;
	formatCommentWithStatements:false;
	useBasicCommentFormat:false;
	maxLineLength:50;
	newLinesBetweenTopComments:0
]

{ #category : #configurations }
BIMethodeExpressionTest >> oneNewLinesAfterSignatureConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
	indentString: '	';
	newLinesAfterSignature:1;
	newLinesAfterCommentZone:0;
	formatCommentWithStatements:false
]

{ #category : #configurations }
BIMethodeExpressionTest >> signatureConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
	indentString: '	';
	newLinesAfterSignature:0;
	newLinesAfterCommentZone:0;
	formatCommentWithStatements:false
]

{ #category : #configurations }
BIMethodeExpressionTest >> signatureNotOnMultipleLinesConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
	indentString: '	';
	newLinesAfterSignature:0;
	newLinesAfterCommentZone:0;
	formatCommentWithStatements:false;
	methodSignatureOnMultipleLines: false
]

{ #category : #configurations }
BIMethodeExpressionTest >> signatureOnMultipleLinesConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"
	^ self contextClass basicNew
	indentString: '	';
	newLinesAfterSignature:0;
	newLinesAfterCommentZone:0;
	formatCommentWithStatements:false;
	methodSignatureOnMultipleLines: true;
	selectorAndArgumentCombinedMaxSize: 2
]

{ #category : #test }
BIMethodeExpressionTest >> testBasic [
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
BIMethodeExpressionTest >> testBasicCommentFormat [
	| expr source |
	expr := RBParser parseMethod: 'aMethode "             aComment        "'.
	configurationSelector := #basicCommentFormatConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	"             aComment        "
	'.
]

{ #category : #test }
BIMethodeExpressionTest >> testFormatElements [
	| expr source |
	expr := RBParser parseMethod: 'aMethode "aComment" |tmp| tmp:=1. ^tmp'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	"aComment"

	| tmp |
	tmp := 1.
	^ tmp'
]

{ #category : #test }
BIMethodeExpressionTest >> testMethodePatternWithArgument [
	| expr source |
	expr := RBParser parseMethod: 'aMethode:arg'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode: arg

	'
]

{ #category : #test }
BIMethodeExpressionTest >> testMethodePatternWithoutArgument [
	| expr source |
	expr := RBParser parseMethod: 'aMethode'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode

	'
]

{ #category : #test }
BIMethodeExpressionTest >> testNewLinesAfterComment [
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
BIMethodeExpressionTest >> testNewLinesAfterComment2 [
	| expr source |
	expr := RBParser parseMethod: 'aMethode "aComment" "anotherComment"'.
	configurationSelector := #oneNewLineAfterCommentConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	"aComment"	"anotherComment"

	'
]

{ #category : #test }
BIMethodeExpressionTest >> testNewLinesAfterGluedComment [
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
BIMethodeExpressionTest >> testNoNewLinesAfterComment [
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
BIMethodeExpressionTest >> testNoNewLinesAfterComment2 [
	| expr source |
	expr := RBParser parseMethod: 'aMethode "aComment" "anotherComment"'.
	configurationSelector := #newLineBetweenTopCommentsConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	"aComment"	"anotherComment"
	'

]

{ #category : #test }
BIMethodeExpressionTest >> testNoNewLinesAfterGluedComment [
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
BIMethodeExpressionTest >> testNoNewLinesAfterSignature [
	| expr source |
	expr := RBParser parseMethod: 'aMethode'.
	configurationSelector := #signatureConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	'
]

{ #category : #test }
BIMethodeExpressionTest >> testNotBasicCommentFormat [
	| expr source |
	expr := RBParser parseMethod: 'aMethode "             aComment        "'.
	configurationSelector := #notBasicCommentFormatConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	"aComment        "
	'
]

{ #category : #test }
BIMethodeExpressionTest >> testOneNewLinesAfterSignature [
	| expr source |
	expr := RBParser parseMethod: 'aMethode'.
	configurationSelector := #oneNewLineAfterCommentConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode

	'
]

{ #category : #test }
BIMethodeExpressionTest >> testSignatureNotOnMultipleLines [
	| expr source |
	expr := RBParser parseMethod: 'aMethode:arg1 foo:arg2'.
	configurationSelector := #signatureNotOnMultipleLinesConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode: arg1 foo: arg2
	'
]

{ #category : #test }
BIMethodeExpressionTest >> testSignatureOnMultipleLines [
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
BIMethodeExpressionTest >> testTwoNewLinesAfterSignature [
	| expr source |
	expr := RBParser parseMethod: 'aMethode'.
	configurationSelector := #twoNewLinesAfterSignatureConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode


	'
]

{ #category : #configurations }
BIMethodeExpressionTest >> twoNewLinesAfterSignatureConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
	indentString: '	';
	newLinesAfterSignature:2;
	newLinesAfterCommentZone:0;
	formatCommentWithStatements:false
]
