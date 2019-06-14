Class {
	#name : #BIEnlumineurExamples,
	#superclass : #Object,
	#classVars : [
		'settingsTable'
	],
	#category : #'BlueInk-Enlumineur'
}

{ #category : #'class initialization' }
BIEnlumineurExamples class >> initialize [
]

{ #category : #'class initialization' }
BIEnlumineurExamples class >> initializeSettingsTable [

	settingsTable := {
		#formatCommentWithStatements -> #formatCommentWithExpressionExample.
		#indentString -> #indentExample.
		#indentsForKeywords -> #messageWithALotOfParameters.
		#keepBlockInMessage -> #keepBlockInMessageExample.
		#lineUpBlockBrackets -> #alignBlockBracketsExample.
		#maxLineLength -> #maxLineLengthExample.
		#methodSignatureOnMultipleLines -> #method:with:A:lot:of:parameters:.
		#minimumNewLinesBetweenStatements-> #minimumNewLinesBetweenStatementsExample.
		#multiLineMessages.
		#newLineAfterCascade -> #cascadeExample.
		#newLineBeforeFirstCascade -> #cascadeExample.
		#newLineBeforeFirstKeyword -> #messageWithALotOfParameters.
		#newLinesAfterMethodComment -> #newLinesAfterMethodCommentExample.
		#newLinesAfterMethodPattern -> #newLinesAfterMethodPatternExample.
		#newLinesAfterTemporaries -> #newLinesAfterTemporariesExample.
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

{ #category : #examples }
BIEnlumineurExamples >> alignBlockBracketsExample [
	1 to: 4 do: [ :i | 
		Transcript
			show: i;
			cr;
			cr]
]

{ #category : #examples }
BIEnlumineurExamples >> blockExample [
	^ [ :n | 1+ n ]
]

{ #category : #examples }
BIEnlumineurExamples >> cascadeExample [
	Transcript cr;cr;cr
]

{ #category : #examples }
BIEnlumineurExamples >> formatCommentWithExpressionExample [

	1 + 1.	"We do an addition"
	2 + 2
]

{ #category : #examples }
BIEnlumineurExamples >> indentExample [
1 to: 4 do: [ :i | 
		i to: 4 do: [ :j |
		Transcript
			show: i;
			show: j;
			cr;
			cr] ]
]

{ #category : #examples }
BIEnlumineurExamples >> keepBlockInMessageExample [

	1 to: 4 do: [ :i | 
		Transcript
			show: i;
			cr;
			cr ]
]

{ #category : #examples }
BIEnlumineurExamples >> maxLineLengthExample [
	^ 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 + 11 + 12 + 13 + 14 + 15 + 16 + 17 + 18 + 19 + 20
]

{ #category : #examples }
BIEnlumineurExamples >> messageWithALotOfParameters [
	^ self method:1 with:2 a:3 lot:4 of:5 parameters:6
]

{ #category : #examples }
BIEnlumineurExamples >> method:a with:b a:c lot:d of:e parameters:f [
]

{ #category : #examples }
BIEnlumineurExamples >> methodSignature:a OnMultipleLinesExample:b [

	
]

{ #category : #examples }
BIEnlumineurExamples >> minimumNewLinesBetweenStatementsExample [
	1 + 1.
	2 + 2.
	3 + 3
]

{ #category : #examples }
BIEnlumineurExamples >> newLinesAfterMethodCommentExample [
	"myComment"

	^ true
]

{ #category : #examples }
BIEnlumineurExamples >> newLinesAfterMethodPatternExample [

	^ true
]

{ #category : #examples }
BIEnlumineurExamples >> newLinesAfterTemporariesExample [
	| tmp |
	tmp:= 1.
	^ tmp
]

{ #category : #examples }
BIEnlumineurExamples >> parenthesesExample [
	1 + ( 2 * 3 )
]

{ #category : #examples }
BIEnlumineurExamples >> periodsAtEndOfMethodExample [
	
	^ 1 factorial
]

{ #category : #examples }
BIEnlumineurExamples >> retainBlankLinesExample [
"methodComment"	

	| a b c|
	
	a:=1.


	"aComment"	

	b:=2.
	
	c:=3
]

{ #category : #examples }
BIEnlumineurExamples >> spacesAfterCaretSymbolInReturnExample [
	^ 1
]

{ #category : #examples }
BIEnlumineurExamples >> traditionalBinaryPrecedenceForParenthesesExample [

	1 + 2 * 3.
	true | false = true & true
	
]

{ #category : #examples }
BIEnlumineurExamples >> useBasicCommentFormatExample [
"	  aComment    "
]
