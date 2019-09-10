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
		'newLinesAfterMethodComment',
		'newLinesAfterMethodPattern',
		'newLinesAfterTemporaries',
		'numberOfArgumentsForMultiLine',
		'oneLineMessages',
		'periodsAtEndOfBlock',
		'periodsAtEndOfMethod',
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
		'spacesBeforeDotInDynamicArray'
	],
	#category : #'Enlumineur-Core'
}

{ #category : #accessing }
BIEnlumineurContext >> formatCommentWithStatements [
	^ formatCommentWithStatements
]

{ #category : #accessing }
BIEnlumineurContext >> formatCommentWithStatements: aBoolean [
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
	useBasicCommentFormat := true.
	formatCommentWithStatements := true.
	indentsForKeywords := 1.
	keepBlockInMessage := true.
	lineUpBlockBrackets := false.
	maxLineLength := 70.
	methodSignatureOnMultipleLines := false.
	minimumNewLinesBetweenStatements := 1.
	multiLineMessages := #(#ifTrue:ifFalse: #ifFalse:ifTrue: #ifTrue: #ifFalse: #on:do: #ensure: #ifCurtailed:).
	newLineAfterCascade := true.
	newLineBeforeFirstCascade := true.
	newLineBeforeFirstKeyword := true.
	newLinesAfterMethodComment := 2.
	newLinesAfterMethodPattern := 1.
	newLinesAfterTemporaries := 1.
	numberOfArgumentsForMultiLine := 4.
	oneLineMessages := #(#to: #to:do: #to:by: #to:by:do:).
	periodsAtEndOfBlock := false.
	periodsAtEndOfMethod := false.
	retainBlankLinesBetweenStatements := false.
	retainBlankLinesBeforeComments := true.
	selectorAndArgumentCombinedMaxSize := 40.
	traditionalBinaryPrecedenceArray := #(#($| $& $?) #($= $~ $< $>) #($- $+) #($* $/ $% $\) #($@)).
	useTraditionalBinaryPrecedenceForParentheses := true.
	self numberOfSpacesInsideBlock: 1.
	self numberOfSpacesInsideParentheses: 0.
	self numberOfSpacesAfterCaretSymbolInReturn: 1.
	self indentStyle: #tabulation.
	self numberOfSpacesInIndent: 3.
	self 	numberOfSpacesBeforeDotInDynamicArray: 0.
	self indentExtraSpaces: 0.
	self numberOfSpacesInsideArray: 1
]

{ #category : #accessing }
BIEnlumineurContext >> keepBlockInMessage [
	^ keepBlockInMessage
]

{ #category : #accessing }
BIEnlumineurContext >> keepBlockInMessage: anObject [
	keepBlockInMessage := anObject
]

{ #category : #accessing }
BIEnlumineurContext >> lineUpBlockBrackets [
	^ lineUpBlockBrackets
]

{ #category : #accessing }
BIEnlumineurContext >> lineUpBlockBrackets: anObject [
	lineUpBlockBrackets := anObject
]

{ #category : #accessing }
BIEnlumineurContext >> maxLineLength [
	^ maxLineLength
]

{ #category : #accessing }
BIEnlumineurContext >> maxLineLength: anObject [
	maxLineLength := anObject
]

{ #category : #accessing }
BIEnlumineurContext >> methodSignatureOnMultipleLines [
	^ methodSignatureOnMultipleLines
]

{ #category : #accessing }
BIEnlumineurContext >> methodSignatureOnMultipleLines: anObject [
	methodSignatureOnMultipleLines := anObject
]

{ #category : #accessing }
BIEnlumineurContext >> minimumNewLinesBetweenStatements [
	^ minimumNewLinesBetweenStatements
]

{ #category : #accessing }
BIEnlumineurContext >> minimumNewLinesBetweenStatements: anObject [
	minimumNewLinesBetweenStatements := anObject
]

{ #category : #accessing }
BIEnlumineurContext >> multiLineMessages [
	^ multiLineMessages
]

{ #category : #accessing }
BIEnlumineurContext >> multiLineMessages: anArray [
	"In case the user entered a string representing array we convert it into array."
	
	multiLineMessages := self class compiler evaluate: anArray asString
]

{ #category : #accessing }
BIEnlumineurContext >> newLineAfterCascade [
	^ newLineAfterCascade
]

{ #category : #accessing }
BIEnlumineurContext >> newLineAfterCascade: anObject [
	newLineAfterCascade := anObject
]

{ #category : #accessing }
BIEnlumineurContext >> newLineBeforeFirstCascade [
	^ newLineBeforeFirstCascade
]

{ #category : #accessing }
BIEnlumineurContext >> newLineBeforeFirstCascade: anObject [
	newLineBeforeFirstCascade := anObject
]

{ #category : #accessing }
BIEnlumineurContext >> newLineBeforeFirstKeyword [
	^ newLineBeforeFirstKeyword
]

{ #category : #accessing }
BIEnlumineurContext >> newLineBeforeFirstKeyword: anObject [
	newLineBeforeFirstKeyword := anObject
]

{ #category : #accessing }
BIEnlumineurContext >> newLinesAfterMethodComment [
	^ newLinesAfterMethodComment
]

{ #category : #accessing }
BIEnlumineurContext >> newLinesAfterMethodComment: anObject [
	newLinesAfterMethodComment := anObject
]

{ #category : #accessing }
BIEnlumineurContext >> newLinesAfterMethodPattern [
	^ newLinesAfterMethodPattern
]

{ #category : #accessing }
BIEnlumineurContext >> newLinesAfterMethodPattern: anObject [
	newLinesAfterMethodPattern := anObject
]

{ #category : #accessing }
BIEnlumineurContext >> newLinesAfterTemporaries [
	^ newLinesAfterTemporaries
]

{ #category : #accessing }
BIEnlumineurContext >> newLinesAfterTemporaries: anObject [
	newLinesAfterTemporaries := anObject
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfArgumentsForMultiLine [
	^ numberOfArgumentsForMultiLine
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfArgumentsForMultiLine: anObject [
	numberOfArgumentsForMultiLine := anObject
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
	indentStyle = #space 
		ifTrue: [ indentString := self stringFromSpaceNumber: anInteger ]
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
BIEnlumineurContext >> periodsAtEndOfBlock [
	^ periodsAtEndOfBlock
]

{ #category : #accessing }
BIEnlumineurContext >> periodsAtEndOfBlock: aBoolean [
	periodsAtEndOfBlock := aBoolean
]

{ #category : #accessing }
BIEnlumineurContext >> periodsAtEndOfMethod [
	^ periodsAtEndOfMethod
]

{ #category : #accessing }
BIEnlumineurContext >> periodsAtEndOfMethod: aBoolean [
	periodsAtEndOfMethod := aBoolean
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
