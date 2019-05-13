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

	^ self contextClass new
		useBasicCommentFormat: true
]

{ #category : #configurations }
BIMethodeExpressionTest >> noNewLinesAfterCommentConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
	newLinesAfterCommentZone:0
]

{ #category : #configurations }
BIMethodeExpressionTest >> noNewLinesAfterSignatureConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
	newLinesAfterSignature:0;
	newLinesAfterCommentZone:0
]

{ #category : #configurations }
BIMethodeExpressionTest >> notBasicCommentFormatConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
		useBasicCommentFormat: false
]

{ #category : #configurations }
BIMethodeExpressionTest >> oneNewLinesAfterCommentConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
	newLinesAfterCommentZone:1
]

{ #category : #configurations }
BIMethodeExpressionTest >> oneNewLinesAfterSignatureConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
	newLinesAfterSignature:1;
	newLinesAfterCommentZone:0
]

{ #category : #configurations }
BIMethodeExpressionTest >> signatureNotOnMultipleLinesConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
	methodSignatureOnMultipleLines: false;
	newLinesAfterCommentZone:0
]

{ #category : #configurations }
BIMethodeExpressionTest >> signatureOnMultipleLinesConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"
	^ self contextClass new
	methodSignatureOnMultipleLines: true;
	selectorAndArgumentCombinedMaxSize: 2;
	newLinesAfterCommentZone:0
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
	configurationSelector := #oneNewLinesAfterCommentConfiguration.
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
	configurationSelector := #oneNewLinesAfterCommentConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	"aComment"
	"anotherComment"

	'
]

{ #category : #test }
BIMethodeExpressionTest >> testNewLinesAfterGluedComment [
	| expr source |
	expr := RBParser parseMethod: 'aMethode"aComment""anotherComment"'.
	configurationSelector := #oneNewLinesAfterCommentConfiguration.
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
	configurationSelector := #noNewLinesAfterCommentConfiguration.
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
	configurationSelector := #noNewLinesAfterCommentConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'aMethode
	"aComment"
	"anotherComment"
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
	configurationSelector := #noNewLinesAfterSignatureConfiguration.
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
	configurationSelector := #oneNewLinesAfterSignatureConfiguration.
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

	^ self contextClass new
	newLinesAfterSignature:2;
	newLinesAfterCommentZone:0
]
