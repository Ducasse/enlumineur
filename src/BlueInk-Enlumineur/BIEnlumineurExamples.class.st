Class {
	#name : #BIEnlumineurExamples,
	#superclass : #Object,
	#classVars : [
		'settingsTable'
	],
	#category : #'BlueInk-Enlumineur'
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
	#stringFollowingReturn : '' '',
	#stringInsideParentheses : '' '',
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
	#stringInsideBlocks : '' '',
	#numberOfSpacesInsideParentheses : 1,
	#numberOfSpacesAfterCaretSymbolInReturn : 1,
	#indentCharacter : #tabulation,
	#numberOfSpacesInIndent : 3
}'
]

{ #category : #'class initialization' }
BIEnlumineurExamples class >> initialize [
]

{ #category : #'class initialization' }
BIEnlumineurExamples class >> initializeSettingsTable [

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
		#stringFollowingReturn -> #spacesAfterCaretSymbolInReturnExample.
		#stringInsideBlocks -> #blockExample.
		#stringInsideParentheses -> #parenthesesExample.
		#useTraditionalBinaryPrecedenceForParentheses -> #traditionalBinaryPrecedenceForParenthesesExample.
		#selectorAndArgumentCombinedMaxSize -> #messageWithALotOfParameters.
		#useBasicCommentFormat -> #useBasicCommentFormatExample.
		#traditionalBinaryPrecedenceArray.
	}
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
BIEnlumineurExamples >> messageWithALotOfParameters [
	^ self method:1 with:2 a:3 lot:4 of:5 parameters:6
]

{ #category : #util }
BIEnlumineurExamples >> method:a with:b a:c lot:d of:e parameters:f [
]

{ #category : #methods }
BIEnlumineurExamples >> methodSignature:a OnMultipleLinesExample:b [

	
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
