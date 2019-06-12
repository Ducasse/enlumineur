Class {
	#name : #BIEnlumineurExamples,
	#superclass : #Object,
	#instVars : [
		'codeStream',
		'indent',
		'lookaheadCode',
		'originalSource',
		'lineStart',
		'context',
		'isInCascadeNode'
	],
	#classVars : [
		'DefaultPrettyPrintContext',
		'FormatAsYouReadPolicy'
	],
	#category : #'BlueInk-Enlumineur'
}

{ #category : #formatting }
BIEnlumineurExamples >> formatCommentWithStatementsExample [

	1 + 1.	"We do an addition"
	2 + 2
]

{ #category : #formatting }
BIEnlumineurExamples >> spacesAfterCaretSymbolInReturnExample [
	^ 1
]
