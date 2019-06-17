Class {
	#name : #BIEnlumineurContext,
	#superclass : #Object,
	#instVars : [
		'formatCommentWithStatements',
		'indentString',
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
		'stringFollowingReturn',
		'stringInsideParentheses',
		'useTraditionalBinaryPrecedenceForParentheses',
		'selectorAndArgumentCombinedMaxSize',
		'useBasicCommentFormat',
		'traditionalBinaryPrecedenceArray',
		'numberOfSpacesInsideBlock',
		'stringInsideBlocks',
		'numberOfSpacesInsideParentheses',
		'numberOfSpacesAfterCaretSymbolInReturn'
	],
	#category : #'BlueInk-Enlumineur'
}

{ #category : #accessing }
BIEnlumineurContext >> formatCommentWithStatements [
	^ formatCommentWithStatements
]

{ #category : #accessing }
BIEnlumineurContext >> formatCommentWithStatements: anObject [
	formatCommentWithStatements := anObject
]

{ #category : #accessing }
BIEnlumineurContext >> indentString [
	^ indentString
]

{ #category : #accessing }
BIEnlumineurContext >> indentString: aString [
	indentString := aString 
]

{ #category : #accessing }
BIEnlumineurContext >> indentsForKeywords [
	^ indentsForKeywords
]

{ #category : #accessing }
BIEnlumineurContext >> indentsForKeywords: anObject [
	indentsForKeywords := anObject
]

{ #category : #initialization }
BIEnlumineurContext >> initialize [
	useBasicCommentFormat := true.
	formatCommentWithStatements := true.
	indentString := String with: Character tab.
	indentsForKeywords := 1.
	keepBlockInMessage := true.
	lineUpBlockBrackets := false.
	maxLineLength := 70.
	methodSignatureOnMultipleLines := false.
	minimumNewLinesBetweenStatements := 1.
	multiLineMessages := #(#ifTrue:ifFalse: #ifFalse:ifTrue: #ifTrue: #ifFalse: #on:do: #ensure: #ifCurtailed:).
	newLineAfterCascade := true.
	newLineBeforeFirstCascade := true.
	newLineBeforeFirstKeyword := false.
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
	stringFollowingReturn := ' '.
	stringInsideBlocks := ' '.
	stringInsideParentheses := ''.
	traditionalBinaryPrecedenceArray := #(#($| $& $?) #($= $~ $< $>) #($- $+) #($* $/ $% $\) #($@)).
	useTraditionalBinaryPrecedenceForParentheses := true.
	numberOfSpacesInsideBlock:= 1.
	numberOfSpacesInsideParentheses := 1
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
	multiLineMessages := (self class compiler evaluate: anArray asString)
]

{ #category : #'as yet unclassified' }
BIEnlumineurContext >> newEmptyLineAfterMethodCommentZone [

	self newLinesAfterMethodComment: 2
	"
	We do two line return: one for the empty line and one for the method body start.
	After the comments (even empty) we let one empty line
	"
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

{ #category : #'as yet unclassified' }
BIEnlumineurContext >> noNewEmptyLineAfterMethodCommentZone [

	self newLinesAfterMethodComment: 1
	"After the comments (even empty) we don't let one empty line.
	We just issue one new line for the method body"
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
BIEnlumineurContext >> numberOfSpaces: aNumber [
	^ (1 to: aNumber) collect: [ :index | Character space ] as: String
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfSpacesAfterCaretSymbolInReturn [
	^ numberOfSpacesAfterCaretSymbolInReturn
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfSpacesAfterCaretSymbolInReturn: aNumber [
	self stringFollowingReturn:(self numberOfSpaces: aNumber).
	numberOfSpacesAfterCaretSymbolInReturn := aNumber
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfSpacesInsideBlock [
	^ numberOfSpacesInsideBlock
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfSpacesInsideBlock: aNumber [
	self stringInsideBlocks: (self numberOfSpaces: aNumber).
	numberOfSpacesInsideBlock := aNumber
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfSpacesInsideParentheses [
	^ numberOfSpacesInsideParentheses
]

{ #category : #accessing }
BIEnlumineurContext >> numberOfSpacesInsideParentheses: aNumber [
	self stringInsideParentheses: (self numberOfSpaces: aNumber).
	numberOfSpacesInsideParentheses := aNumber
]

{ #category : #accessing }
BIEnlumineurContext >> oneLineMessages [
	^ oneLineMessages
]

{ #category : #accessing }
BIEnlumineurContext >> oneLineMessages: anArray [
	oneLineMessages := (self class compiler evaluate: anArray asString)
]

{ #category : #accessing }
BIEnlumineurContext >> periodsAtEndOfBlock [
	^ periodsAtEndOfBlock
]

{ #category : #accessing }
BIEnlumineurContext >> periodsAtEndOfBlock: anObject [
	periodsAtEndOfBlock := anObject
]

{ #category : #accessing }
BIEnlumineurContext >> periodsAtEndOfMethod [
	^ periodsAtEndOfMethod
]

{ #category : #accessing }
BIEnlumineurContext >> periodsAtEndOfMethod: anObject [
	periodsAtEndOfMethod := anObject
]

{ #category : #accessing }
BIEnlumineurContext >> retainBlankLinesBeforeComments [
	^ retainBlankLinesBeforeComments
]

{ #category : #accessing }
BIEnlumineurContext >> retainBlankLinesBeforeComments: anObject [
	retainBlankLinesBeforeComments := anObject
]

{ #category : #accessing }
BIEnlumineurContext >> retainBlankLinesBetweenStatements [
	^ retainBlankLinesBetweenStatements
]

{ #category : #accessing }
BIEnlumineurContext >> retainBlankLinesBetweenStatements: anObject [
	retainBlankLinesBetweenStatements := anObject
]

{ #category : #accessing }
BIEnlumineurContext >> selectorAndArgumentCombinedMaxSize [
	^ selectorAndArgumentCombinedMaxSize
]

{ #category : #accessing }
BIEnlumineurContext >> selectorAndArgumentCombinedMaxSize: anInteger [
	selectorAndArgumentCombinedMaxSize := anInteger
]

{ #category : #'as yet unclassified' }
BIEnlumineurContext >> storeOn: aStream [

	aStream 
		nextPutAll: self class name;
		nextPutAll: ' new' ; cr.
	self class instVarNames sorted
		do: [ :each | 
					aStream tab.
					aStream nextPutAll: each, ': '.
					aStream print: (self instVarNamed: each asSymbol) ]
		separatedBy: [ aStream nextPutAll: ';'; cr. ]
]

{ #category : #accessing }
BIEnlumineurContext >> stringFollowingReturn [
	^ stringFollowingReturn
]

{ #category : #accessing }
BIEnlumineurContext >> stringFollowingReturn: anObject [
	stringFollowingReturn := anObject
]

{ #category : #accessing }
BIEnlumineurContext >> stringInsideBlocks [
	^ stringInsideBlocks
]

{ #category : #accessing }
BIEnlumineurContext >> stringInsideBlocks: anObject [
	stringInsideBlocks := anObject
]

{ #category : #accessing }
BIEnlumineurContext >> stringInsideParentheses [
	^ stringInsideParentheses
]

{ #category : #accessing }
BIEnlumineurContext >> stringInsideParentheses: anObject [
	stringInsideParentheses := anObject
]

{ #category : #accessing }
BIEnlumineurContext >> traditionalBinaryPrecedenceArray [
	^ traditionalBinaryPrecedenceArray
]

{ #category : #accessing }
BIEnlumineurContext >> traditionalBinaryPrecedenceArray: anArray [
	traditionalBinaryPrecedenceArray := (self class compiler evaluate: anArray asString)
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
BIEnlumineurContext >> useTraditionalBinaryPrecedenceForParentheses: anObject [
	useTraditionalBinaryPrecedenceForParentheses := anObject
]
