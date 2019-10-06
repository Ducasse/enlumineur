"
I represent all the parameters that can modify a pretty printer. 
Now since the BlueInkPrettyPrinter context was too complex to refactor and extend without breaking everything we clone it
with the related tests. 

The goal is to make sure that we can have a better prettyprinter and replace the Basic pretty printer (configurationFormatter)
"
Class {
	#name : #BIEnlumineurContext,
	#superclass : #Object,
	#instVars : [
		'formatCommentWithStatements',
		'indentsForKeywords',
		'keepBlockInMessage',
		'lineUpBlockBrackets',
		'maxLineLength',
		'methodSignatureOnMultipleLines',
		'minimumNewLinesBetweenStatements',
		'multiLineMessages',
		'newLineAfterCascade',
		'newLineBeforeFirstCascade',
		'newLineBeforeFirstKeyword',
		'newLinesAfterTemporaries',
		'numberOfArgumentsForMultiLine',
		'oneLineMessages',
		'retainBlankLinesBetweenStatements',
		'retainBlankLinesBeforeComments',
		'useTraditionalBinaryPrecedenceForParentheses',
		'selectorAndArgumentCombinedMaxSize',
		'useBasicCommentFormat',
		'traditionalBinaryPrecedenceArray',
		'numberOfSpacesInsideBlock',
		'numberOfSpacesInsideParentheses',
		'numberOfSpacesAfterCaretSymbolInReturn',
		'numberOfSpacesInIndent',
		'spacesAfterCaretSymbolInReturn',
		'spacesInsideBlocks',
		'indentStyle',
		'indentString',
		'spacesInsideParentheses',
		'indentExtraSpaces',
		'spacesInsideArray',
		'numberOfSpacesInsideArray',
		'numberOfSpacesBeforeDotInDynamicArray',
		'spacesBeforeDotInDynamicArray',
		'numberOfNewLinesAfterMethodComment',
		'newLinesAfterMethodSignature',
		'periodAtEndOfMethod',
		'periodAtEndOfBlock'
	],
	#category : #'Enlumineur-Core'
}

{ #category : #initialization }
BIEnlumineurContext >> configureForTraditionalBinaryPrecedence [

	useTraditionalBinaryPrecedenceForParentheses := true.
	traditionalBinaryPrecedenceArray := #(#($| $& $?) #($= $~ $< $>) #($- $+) #($* $/ $% $\) #($@))
]

{ #category : #initialization }
BIEnlumineurContext >> configureMultiLineMessages [

	multiLineMessages := #(#ifTrue:ifFalse: #ifFalse:ifTrue: #ifTrue: #ifFalse: #on:do: #ensure: #ifCurtailed:)
]

{ #category : #accessing }
BIEnlumineurContext >> formatCommentCloseToStatements [
	^ formatCommentWithStatements
]

{ #category : #accessing }
BIEnlumineurContext >> formatCommentCloseToStatements: aBoolean [
	formatCommentWithStatements := aBoolean
]

{ #category : #accessing }
BIEnlumineurContext >> indentExtraSpaces [
	^ indentExtraSpaces
]

{ #category : #accessing }
BIEnlumineurContext >> indentExtraSpaces: anInteger [
	"To set the number of spaces that represent an indent"

	indentExtraSpaces := self stringFromSpaceNumber: anInteger
]

{ #category : #accessing }
BIEnlumineurContext >> indentString [
	"My value is set using numberOfSpacesInIndent: "
	
	^ indentString
]

{ #category : #accessing }
BIEnlumineurContext >> indentStyle [
	^ indentStyle
]

{ #category : #accessing }
BIEnlumineurContext >> indentStyle: aSymbol [
	"Indent style can be either #tabulation or #space."
	
	indentStyle := aSymbol.
	indentString := aSymbol = #space
		ifTrue: [ self stringFromSpaceNumber: numberOfSpacesInIndent ]
		ifFalse: [ String tab ]
]

{ #category : #accessing }
BIEnlumineurContext >> indentsForKeywords [
	^ indentsForKeywords
]

{ #category : #accessing }
BIEnlumineurContext >> indentsForKeywords: anInteger [
	indentsForKeywords := anInteger
]

{ #category : #initialization }
BIEnlumineurContext >> initialize [

	super initialize.
	self useBasicCommentFormat: true.
	self formatCommentCloseToStatements: true.
	indentsForKeywords := 1.
	keepBlockInMessage := true.
	lineUpBlockBrackets := false.
	maxLineLength := 70.
	methodSignatureOnMultipleLines := false.
	minimumNewLinesBetweenStatements := 1.
	self configureMultiLineMessages.
	newLineAfterCascade := true.
	newLineBeforeFirstCascade := true.
	newLineBeforeFirstKeyword := true.
	numberOfNewLinesAfterMethodComment := 2.
	newLinesAfterMethodSignature := 1.
	newLinesAfterTemporaries := 1.
	numberOfArgumentsForMultiLine := 4.
	oneLineMessages := #(#to: #to:do: #to:by: #to:by:do:).
	self periodAtEndOfBlock: false.
	self periodAtEndOfMethod: false.
	self retainBlankLinesBetweenStatements: false.
	self retainBlankLinesBeforeComments: true.
	self selectorAndArgumentCombinedMaxSize: 40.
	self useTraditionalBinaryPrecedenceForParentheses: false.
	self numberOfSpacesInsideBlock: 1.
	self numberOfSpacesInsideParentheses: 0.
	self numberOfSpacesAfterCaretSymbolInReturn: 1.
	self indentStyle: #tabulation.
	self numberOfSpacesInIndent: 3.
	self numberOfSpacesBeforeDotInDynamicArray: 0.
	self indentExtraSpaces: 0.
	self numberOfSpacesInsideArray: 1
]

{ #category : #accessing }
BIEnlumineurContext >> keepBlockInMessage [
	^ keepBlockInMessage
]

{ #category : #accessing }
BIEnlumineurContext >> keepBlockInMessage: aBoolean [
	keepBlockInMessage := aBoolean
]

{ #category : #accessing }
BIEnlumineurContext >> lineUpBlockBrackets [
	"When true place a new line before closing a multiline block.
	1 to: 4 do: [ Transcript
		show: i;
		cr
	]
	"
	
	^ lineUpBlockBrackets
]

{ #category : #accessing }
BIEnlumineurContext >> lineUpBlockBrackets: aBoolean [
	lineUpBlockBrackets := aBoolean
]

{ #category : #accessing }
BIEnlumineurContext >> maxLineLength [
	^ maxLineLength
]

{ #category : #accessing }
BIEnlumineurContext >> maxLineLength: anInteger [
	maxLineLength := anInteger
]

{ #category : #accessing }
BIEnlumineurContext >> methodSignatureOnMultipleLines [
	^ methodSignatureOnMultipleLines
]

{ #category : #accessing }
BIEnlumineurContext >> methodSignatureOnMultipleLines: aBoolean [
	methodSignatureOnMultipleLines := aBoolean
]

{ #category : #accessing }
BIEnlumineurContext >> minimumNewLinesBetweenStatements [
	^ minimumNewLinesBetweenStatements
]

{ #category : #accessing }
BIEnlumineurContext >> minimumNewLinesBetweenStatements: anInteger [
	minimumNewLinesBetweenStatements := anInteger
]

{ #category : #accessing }
BIEnlumineurContext >> multiLineMessages [
	^ multiLineMessages
]

{ #category : #accessing }
BIEnlumineurContext >> multiLineMessages: anArray [
	"In case the user entered a string representing array we convert it into array."
	self flag: #tocheck. "we should change this logic. It is terrible, the UI should give us an array and not a string!"
	multiLineMessages := self class compiler evaluate: anArray asString
]

{ #category : #accessing }
BIEnlumineurContext >> newLineAfterCascade [
	^ newLineAfterCascade
]

{ #category : #accessing }
BIEnlumineurContext >> newLineAfterCascade: anInteger [
	newLineAfterCascade := anInteger
]

{ #category : #accessing }
BIEnlumineurContext >> newLineBeforeFirstCascade [
	^ newLineBeforeFirstCascade
]

{ #category : #accessing }
BIEnlumineurContext >> newLineBeforeFirstCascade: anInteger [
	newLineBeforeFirstCascade := anInteger
]

{ #category : #accessing }
BIEnlumineurContext >> newLineBeforeFirstKeyword [
	^ newLineBeforeFirstKeyword
]

{ #category : #accessing }
BIEnlumineurContext >> newLineBeforeFirstKeyword: aBoolean [
	newLineBeforeFirstKeyword := aBoolean
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfArgumentsForMultiLine [
	^ numberOfArgumentsForMultiLine
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfArgumentsForMultiLine: anInteger [
	numberOfArgumentsForMultiLine := anInteger
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfNewLinesAfterMethodComment [
	^ numberOfNewLinesAfterMethodComment
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfNewLinesAfterMethodComment: aBoolean [
	numberOfNewLinesAfterMethodComment := aBoolean
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfNewLinesAfterMethodSignature [
	^ newLinesAfterMethodSignature
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfNewLinesAfterMethodSignature: aBoolean [
	newLinesAfterMethodSignature := aBoolean
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfNewLinesAfterTemporaries [
	^ newLinesAfterTemporaries
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfNewLinesAfterTemporaries: anInteger [
	newLinesAfterTemporaries := anInteger
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfSpacesAfterCaretSymbolInReturn [
	^ numberOfSpacesAfterCaretSymbolInReturn
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfSpacesAfterCaretSymbolInReturn: aNumber [
	spacesAfterCaretSymbolInReturn := self stringFromSpaceNumber: aNumber.
	numberOfSpacesAfterCaretSymbolInReturn := aNumber
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfSpacesBeforeDotInDynamicArray [
	^ numberOfSpacesBeforeDotInDynamicArray
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfSpacesBeforeDotInDynamicArray: anInteger [

	spacesBeforeDotInDynamicArray := self stringFromSpaceNumber: anInteger.
	numberOfSpacesBeforeDotInDynamicArray := anInteger
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfSpacesInIndent [
	^ numberOfSpacesInIndent
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfSpacesInIndent: anInteger [
	numberOfSpacesInIndent := anInteger.
	indentString := self indentStyle = #space 
		ifTrue: [ self stringFromSpaceNumber: anInteger ]
		ifFalse: [ String tab ]
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfSpacesInsideArray [
	^ numberOfSpacesInsideArray
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfSpacesInsideArray: anInteger [
	spacesInsideArray := self stringFromSpaceNumber: anInteger.
	numberOfSpacesInsideArray := anInteger
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfSpacesInsideBlock [
	^ numberOfSpacesInsideBlock
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfSpacesInsideBlock: aNumber [
	spacesInsideBlocks := self stringFromSpaceNumber: aNumber.
	numberOfSpacesInsideBlock := aNumber
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfSpacesInsideParentheses [
	^ numberOfSpacesInsideParentheses
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfSpacesInsideParentheses: aNumber [
	spacesInsideParentheses := self stringFromSpaceNumber: aNumber.
	numberOfSpacesInsideParentheses := aNumber
]

{ #category : #accessing }
BIEnlumineurContext >> oneLineMessages [
	^ oneLineMessages
]

{ #category : #accessing }
BIEnlumineurContext >> oneLineMessages: anArray [
	"To be revisited latter. Apparently this trick is to convert strings into an array."
	oneLineMessages := self class compiler evaluate: anArray asString
]

{ #category : #accessing }
BIEnlumineurContext >> periodAtEndOfBlock: aBoolean [
	periodAtEndOfBlock := aBoolean
]

{ #category : #accessing }
BIEnlumineurContext >> periodAtEndOfMethod: aBoolean [
	periodAtEndOfMethod := aBoolean
]

{ #category : #accessing }
BIEnlumineurContext >> periodsAtEndOfBlock [
	^ periodAtEndOfBlock
]

{ #category : #accessing }
BIEnlumineurContext >> periodsAtEndOfMethod [
	^ periodAtEndOfMethod
]

{ #category : #accessing }
BIEnlumineurContext >> retainBlankLinesBeforeComments [
	^ retainBlankLinesBeforeComments
]

{ #category : #accessing }
BIEnlumineurContext >> retainBlankLinesBeforeComments: aBoolean [
	retainBlankLinesBeforeComments := aBoolean
]

{ #category : #accessing }
BIEnlumineurContext >> retainBlankLinesBetweenStatements [
	^ retainBlankLinesBetweenStatements
]

{ #category : #accessing }
BIEnlumineurContext >> retainBlankLinesBetweenStatements: aBoolean [
	retainBlankLinesBetweenStatements := aBoolean
]

{ #category : #accessing }
BIEnlumineurContext >> selectorAndArgumentCombinedMaxSize [
	^ selectorAndArgumentCombinedMaxSize
]

{ #category : #accessing }
BIEnlumineurContext >> selectorAndArgumentCombinedMaxSize: anInteger [
	selectorAndArgumentCombinedMaxSize := anInteger
]

{ #category : #accessing }
BIEnlumineurContext >> spacesAfterCaretSymbolInReturn [
	^ spacesAfterCaretSymbolInReturn
]

{ #category : #accessing }
BIEnlumineurContext >> spacesBeforeDotInDynamicArray [ 
	^ spacesBeforeDotInDynamicArray 
]

{ #category : #accessing }
BIEnlumineurContext >> spacesInsideArray [
	^ spacesInsideArray
]

{ #category : #accessing }
BIEnlumineurContext >> spacesInsideBlocks [
	^ spacesInsideBlocks
]

{ #category : #accessing }
BIEnlumineurContext >> spacesInsideParentheses [
	^ spacesInsideParentheses
]

{ #category : #printing }
BIEnlumineurContext >> storeOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPutAll: ' new';
		cr.
	self class instVarNames sorted
		do: [ :each | 
			aStream tab;
				nextPutAll: each;
				nextPutAll: ': '.
			aStream print: (self instVarNamed: each asSymbol) ]
		separatedBy: [ aStream
				nextPutAll: ';';
				cr ]
]

{ #category : #accessing }
BIEnlumineurContext >> stringFromSpaceNumber: aNumber [
	
	^ String new: aNumber withAll: Character space
]

{ #category : #accessing }
BIEnlumineurContext >> traditionalBinaryPrecedenceArray [
	^ traditionalBinaryPrecedenceArray
]

{ #category : #accessing }
BIEnlumineurContext >> traditionalBinaryPrecedenceArray: anArray [
	"To be revisited latter. Apparently this trick is to convert strings into an array."
	traditionalBinaryPrecedenceArray := self class compiler evaluate: anArray asString
]

{ #category : #accessing }
BIEnlumineurContext >> useBasicCommentFormat [
	^ useBasicCommentFormat
]

{ #category : #accessing }
BIEnlumineurContext >> useBasicCommentFormat: aBoolean [
	useBasicCommentFormat := aBoolean
]

{ #category : #accessing }
BIEnlumineurContext >> useTraditionalBinaryPrecedenceForParentheses [
	^ useTraditionalBinaryPrecedenceForParentheses
]

{ #category : #accessing }
BIEnlumineurContext >> useTraditionalBinaryPrecedenceForParentheses: aBoolean [
	useTraditionalBinaryPrecedenceForParentheses := aBoolean
]
