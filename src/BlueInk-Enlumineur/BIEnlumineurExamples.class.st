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
		#indentString.
		#indentsForKeywords -> #indentsForKeywordsExample.
		#keepBlockInMessage -> #keepBlockInMessageExample.
		#lineUpBlockBrackets -> #alignBlockBracketsExample.
		#maxLineLength.
		#methodSignatureOnMultipleLines.
		#minimumNewLinesBetweenStatements.
		#multiLineMessages.
		#newLineAfterCascade.
		#newLineBeforeFirstCascade.
		#newLineBeforeFirstKeyword.
		#newLinesAfterMethodComment.
		#newLinesAfterMethodPattern.
		#newLinesAfterTemporaries.
		#numberOfArgumentsForMultiLine.
		#oneLineMessages.
		#periodsAtEndOfBlock.
		#periodsAtEndOfMethod.
		#retainBlankLinesBetweenStatements.
		#retainBlankLinesBeforeComments.
		#stringFollowingReturn -> #spacesAfterCaretSymbolInReturnExample.
		#stringInsideBlocks.
		#stringInsideParentheses.
		#useTraditionalBinaryPrecedenceForParentheses.
		#selectorAndArgumentCombinedMaxSize.
		#useBasicCommentFormat.
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
BIEnlumineurExamples >> formatCommentWithExpressionExample [

	1 + 1.	"We do an addition"
	2 + 2
]

{ #category : #examples }
BIEnlumineurExamples >> indentsForKeywordsExample [
self flag:'name of settings might change'.
"depend of the setting numberOfArgumentsForMultiLine"
	self method:1 With:2 A:3 Lot:4 Of:5 Parameters:6
]

{ #category : #examples }
BIEnlumineurExamples >> keepBlockInMessageExample [

	1 to: 4 do: [ :i | 
		Transcript
			show: i;
			cr;
			cr ]
]

{ #category : #'as yet unclassified' }
BIEnlumineurExamples >> method:a With:b A:c Lot:d Of:e Parameters:f [
]

{ #category : #examples }
BIEnlumineurExamples >> spacesAfterCaretSymbolInReturnExample [
	^ 1
]
