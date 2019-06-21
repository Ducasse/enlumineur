Class {
	#name : #BIEnlumineurExamples,
	#superclass : #Object,
	#classVars : [
		'settingsTable'
	],
	#category : #'BlueInk-Enlumineur-Example to work'
}

{ #category : #settings }
BIEnlumineurExamples class >> defaultConfiguration [
	^ 'BIEnlumineurContext {
	#formatCommentWithStatements : true,
	#indentString : ''\t'',
	#indentsForKeywords : 1,
	#keepBlockInMessage : true,
	#lineUpBlockBrackets : false,
	#maxLineLength : 70,
	#methodSignatureOnMultipleLines : false,
	#minimumNewLinesBetweenStatements : 1,
	#multiLineMessages : [
		#''ifTrue:ifFalse:'',
		#''ifFalse:ifTrue:'',
		#''ifTrue:'',
		#''ifFalse:'',
		#''on:do:'',
		#''ensure:'',
		#''ifCurtailed:''
	],
	#newLineAfterCascade : true,
	#newLineBeforeFirstCascade : true,
	#newLineBeforeFirstKeyword : false,
	#newLinesAfterMethodComment : 2,
	#newLinesAfterMethodPattern : 1,
	#newLinesAfterTemporaries : 1,
	#numberOfArgumentsForMultiLine : 4,
	#oneLineMessages : [
		#''to:'',
		#''to:do:'',
		#''to:by:'',
		#''to:by:do:''
	],
	#periodsAtEndOfBlock : false,
	#periodsAtEndOfMethod : false,
	#retainBlankLinesBetweenStatements : false,
	#retainBlankLinesBeforeComments : true,
	#spacesAfterCaretSymbolInReturn : '' '',
	#spacesInsideParentheses : '' '',
	#useTraditionalBinaryPrecedenceForParentheses : true,
	#selectorAndArgumentCombinedMaxSize : 40,
	#useBasicCommentFormat : true,
	#traditionalBinaryPrecedenceArray : [
		[
			Character [ ''|'' ],
			Character [ ''&'' ],
			Character [ ''?'' ]
		],
		[
			Character [ ''='' ],
			Character [ ''~'' ],
			Character [ ''<'' ],
			Character [ ''>'' ]
		],
		[
			Character [ ''-'' ],
			Character [ ''+'' ]
		],
		[
			Character [ ''*'' ],
			Character [ ''/'' ],
			Character [ ''%'' ],
			Character [ ''\\'' ]
		],
		[
			Character [ ''@'' ]
		]
	],
	#numberOfSpacesInsideBlock : 1,
	#spacesInsideBlocks : '' '',
	#numberOfSpacesInsideParentheses : 1,
	#numberOfSpacesAfterCaretSymbolInReturn : 1,
	#indentStyle : #tabulation,
	#numberOfSpacesInIndent : 3
}'
]

{ #category : #'class initialization' }
BIEnlumineurExamples class >> initializeSettingsTable [
	"self initializeSettingsTable"
	
	settingsTable := {
		#formatCommentWithStatements -> #formatCommentWithExpressionExample.
		#indentString -> #indentExample.
		#indentsForKeywords -> #messageWithALotOfParameters.
		#keepBlockInMessage -> #blockExample.
		#lineUpBlockBrackets -> #blockExample.
		#maxLineLength -> #maxLineLengthExample.
		#methodSignatureOnMultipleLines -> #method:with:A:lot:of:parameters:.
		#minimumNewLinesBetweenStatements-> #minimumNewLinesBetweenStatementsExample.
		#multiLineMessages.
		#newLineAfterCascade -> #cascadeExample.
		#newLineBeforeFirstCascade -> #cascadeExample.
		#newLineBeforeFirstKeyword -> #messageWithALotOfParameters.
		#newLinesAfterMethodComment -> #newLinesExample.
		#newLinesAfterMethodPattern -> #newLinesExample.
		#newLinesAfterTemporaries -> #newLinesExample.
		#numberOfArgumentsForMultiLine -> #messageWithALotOfParameters.
		#oneLineMessages.
		#periodsAtEndOfBlock -> #blockExample.
		#periodsAtEndOfMethod -> #periodsAtEndOfMethodExample.
		#retainBlankLinesBetweenStatements -> #retainBlankLinesExample.
		#retainBlankLinesBeforeComments -> #retainBlankLinesExample.
		#spacesAfterCaretSymbolInReturn -> #spacesAfterCaretSymbolInReturnExample.
		#spacesInsideBlocks -> #blockExample.
		#spacesInsideParentheses -> #parenthesesExample.
		#useTraditionalBinaryPrecedenceForParentheses -> #traditionalBinaryPrecedenceForParenthesesExample.
		#selectorAndArgumentCombinedMaxSize -> #messageWithALotOfParameters.
		#useBasicCommentFormat -> #useBasicCommentFormatExample.
		#traditionalBinaryPrecedenceArray.
	}
]

{ #category : #methods }
BIEnlumineurExamples >> bigMethod: argumentOne example: argumentTwo [
"   methode comment   "
|tmp|
tmp := 3.

tmp := tmp factorial.
tmp := tmp + 1.

"   Comment   "

^1
]

{ #category : #methods }
BIEnlumineurExamples >> blockExample [
	1 to: 4 do: [ :i | 
		Transcript
			show: i;
			cr;
			cr]
]

{ #category : #methods }
BIEnlumineurExamples >> cascadeExample [
	Transcript cr;cr;cr
]

{ #category : #methods }
BIEnlumineurExamples >> formatCommentWithExpressionExample [

	1 + 1.	"We do an addition"
	2 + 2
]

{ #category : #methods }
BIEnlumineurExamples >> indentExample [
1 to: 4 do: [ :i | 
		i to: 4 do: [ :j |
		Transcript
			show: i;
			show: j;
			cr;
			cr] ]
]

{ #category : #methods }
BIEnlumineurExamples >> maxLineLengthExample [
	^ 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 + 11 + 12 + 13 + 14 + 15 + 16 + 17 + 18 + 19 + 20
]

{ #category : #methods }
BIEnlumineurExamples >> messageExample: a to: b [

	| i j tmp |
	tmp := 20.
	a < b
		ifTrue: [ i := a. j := b ]
		ifFalse: [ i := b.	j := a ].
	i to: j do: [:k | tmp := tmp + k].
	self method:1 with:2 a:3 lot:4 of:5 parameters:6.
	^ tmp
]

{ #category : #methods }
BIEnlumineurExamples >> messageWithALotOfParameters [
	^ self method:1 with:2 a:3 lot:4 of:5 parameters:6
]

{ #category : #methods }
BIEnlumineurExamples >> method:a with:b a:c lot:d of:e parameters:f [

^1
]

{ #category : #methods }
BIEnlumineurExamples >> methodSignature:a onMultipleLinesExample:b [

	
]

{ #category : #methods }
BIEnlumineurExamples >> minimumNewLinesBetweenStatementsExample [
	1 + 1.
	2 + 2.
	3 + 3
]

{ #category : #methods }
BIEnlumineurExamples >> newLinesExample [
	"myComment"
	| tmp |
	tmp:= 1.
	^ tmp
]

{ #category : #methods }
BIEnlumineurExamples >> parenthesesExample [
	1 + ( 2 * 3 )
]

{ #category : #methods }
BIEnlumineurExamples >> periodsAtEndOfMethodExample [
	
	^ 1 factorial
]

{ #category : #methods }
BIEnlumineurExamples >> retainBlankLinesExample [
"methodComment"	

	| a b c|
	
	a:=1.


	"aComment"	

	b:=2.
	
	c:=3
]

{ #category : #methods }
BIEnlumineurExamples >> spacesAfterCaretSymbolInReturnExample [
	^ 1
]

{ #category : #methods }
BIEnlumineurExamples >> strangeFormattingWithAssignment [
	"look at this ugly parseMethod that is badly indented"
	| tree |
	tree := self
		parseMethod:
			'foo: abd bar: cde  
^ abd + cde'.
	self assert: tree conceptualSelectorSize equals: 'foo:bar:' size.
	self assert: tree conceptualArgumentSize equals: 'abdcde' size.
	self
		assert: tree conceptualSignatureSize
		equals: 'abdcde' size + 'foo:bar:' size + 3
	
]

{ #category : #methods }
BIEnlumineurExamples >> strangeFormattingWithAssignment2 [
	"as you see this is the length and the width of the argument that is pushing th parseMerthod on the second line"

	| tree |
	tree := self parseMethod: '1234567'.
	tree := self parseMethod: 	'a
b'.
	self
		assert: tree conceptualSignatureSize
		equals: 'abdcde' size + 'foo:bar:' size + 3
]

{ #category : #methods }
BIEnlumineurExamples >> sumFrom: a to: b [
	"MethodComment"
	| tmp i j |
	tmp := 0.

	(a < b)
		ifTrue: [ i := a. j := b ]
		ifFalse: [ i := b.	j := a ].
	
	"Comment"
	i to: j do: [:k | tmp := tmp + k].
	^ tmp
]

{ #category : #methods }
BIEnlumineurExamples >> traditionalBinaryPrecedenceForParenthesesExample [

	1 + 2 * 3.
	true | false = true & true
	
]

{ #category : #methods }
BIEnlumineurExamples >> useBasicCommentFormatExample [
"	  aComment    "
]
