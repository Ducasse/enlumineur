Class {
	#name : #BIEnlumineurBlockExpressionTest,
	#superclass : #BIEnlumineurTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #configurations }
BIEnlumineurBlockExpressionTest >> basicConfiguration [

	^ self contextClass basicNew
		numberOfSpacesInsideBlock: 1;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets:false;
		indentCharacter: #tabulation;
		keepBlockInMessage:false;
		retainBlankLinesBetweenStatements:false;
		minimumNewLinesBetweenStatements:1;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine:5;
		indentsForKeywords:1;
		newLineBeforeFirstKeyword:false;
		formatCommentWithStatements:true;
		maxLineLength:50
]

{ #category : #hooks }
BIEnlumineurBlockExpressionTest >> closeBracket [
	^']'
]

{ #category : #configurations }
BIEnlumineurBlockExpressionTest >> configurationWithThreeSpaces [

	^ self contextClass basicNew
		numberOfSpacesInsideBlock: 3;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets:false;
		indentCharacter: #tabulation;
		keepBlockInMessage:false;
		retainBlankLinesBetweenStatements:false;
		minimumNewLinesBetweenStatements:1;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine:5;
		indentsForKeywords:1;
		newLineBeforeFirstKeyword:false;
		formatCommentWithStatements:true;
		maxLineLength:50
]

{ #category : #configurations }
BIEnlumineurBlockExpressionTest >> dontFormatCommentWithStatementConfiguration [

	^ self contextClass basicNew
		numberOfSpacesInsideBlock:1;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets:false;
		indentCharacter: #tabulation;
		keepBlockInMessage:false;
		retainBlankLinesBetweenStatements:false;
		minimumNewLinesBetweenStatements:1;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine:5;
		indentsForKeywords:1;
		newLineBeforeFirstKeyword:false;
		formatCommentWithStatements:false;
		maxLineLength:50;
		retainBlankLinesBeforeComments: false;
		useBasicCommentFormat: false
]

{ #category : #configurations }
BIEnlumineurBlockExpressionTest >> formatCommentWithStatementConfiguration [

	^ self contextClass basicNew
		numberOfSpacesInsideBlock:1;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets:false;
		indentCharacter: #tabulation;
		keepBlockInMessage:false;
		retainBlankLinesBetweenStatements:false;
		minimumNewLinesBetweenStatements:1;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine:5;
		indentsForKeywords:1;
		newLineBeforeFirstKeyword:false;
		formatCommentWithStatements:true;
		maxLineLength:50;
		retainBlankLinesBeforeComments: false;
		useBasicCommentFormat: false
]

{ #category : #configurations }
BIEnlumineurBlockExpressionTest >> fourSpaceIndentConfiguration [

	^ self contextClass basicNew
		numberOfSpacesInsideBlock: 1;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets:false;
		keepBlockInMessage:true;
		retainBlankLinesBetweenStatements:false;
		minimumNewLinesBetweenStatements:1;
		multiLineMessages: Array new;
		oneLineMessages:#(#to:do:);
		numberOfArgumentsForMultiLine:5;
		indentsForKeywords:1;
		newLineBeforeFirstKeyword:false;
		formatCommentWithStatements:true;
		maxLineLength:50;
		newLineAfterCascade:true;
		newLineBeforeFirstCascade: true;
		numberOfSpacesInIndent: 4;
		indentCharacter: #space
]

{ #category : #configurations }
BIEnlumineurBlockExpressionTest >> newLineBeforeEndBracketConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		numberOfSpacesInsideBlock:1;
		periodsAtEndOfBlock: false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets: true;
		indentCharacter: #tabulation;
		keepBlockInMessage: false;
		retainBlankLinesBetweenStatements: false;
		minimumNewLinesBetweenStatements: 1;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 5;
		indentsForKeywords: 1;
		newLineBeforeFirstKeyword: false;
		formatCommentWithStatements: true;
		maxLineLength: 50
]

{ #category : #configurations }
BIEnlumineurBlockExpressionTest >> noNewLineBeforeEndBracketConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		numberOfSpacesInsideBlock:1;
		periodsAtEndOfBlock: false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets: false;
		indentCharacter: #tabulation;
		keepBlockInMessage: false;
		retainBlankLinesBetweenStatements: false;
		minimumNewLinesBetweenStatements: 1;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 5;
		indentsForKeywords: 1;
		newLineBeforeFirstKeyword: false;
		formatCommentWithStatements: true;
		maxLineLength: 50
]

{ #category : #configurations }
BIEnlumineurBlockExpressionTest >> numberOfSpaceChangedAfterIndentCharacterConfiguration [

	^ self contextClass basicNew
		numberOfSpacesInsideBlock: 1;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets:false;
		keepBlockInMessage:true;
		retainBlankLinesBetweenStatements:false;
		minimumNewLinesBetweenStatements:1;
		multiLineMessages: Array new;
		oneLineMessages:#(#to:do:);
		numberOfArgumentsForMultiLine:5;
		indentsForKeywords:1;
		newLineBeforeFirstKeyword:false;
		formatCommentWithStatements:true;
		maxLineLength:50;
		newLineAfterCascade:true;
		newLineBeforeFirstCascade: true;
		numberOfSpacesInIndent: 1;
		indentCharacter: #space;
		numberOfSpacesInIndent: 2
]

{ #category : #configurations }
BIEnlumineurBlockExpressionTest >> oneSpaceIndentConfiguration [

	^ self contextClass basicNew
		numberOfSpacesInsideBlock: 1;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets:false;
		keepBlockInMessage:true;
		retainBlankLinesBetweenStatements:false;
		minimumNewLinesBetweenStatements:1;
		multiLineMessages: Array new;
		oneLineMessages:#(#to:do:);
		numberOfArgumentsForMultiLine:5;
		indentsForKeywords:1;
		newLineBeforeFirstKeyword:false;
		formatCommentWithStatements:true;
		maxLineLength:50;
		newLineAfterCascade:true;
		newLineBeforeFirstCascade: true;
		numberOfSpacesInIndent: 1;
		indentCharacter: #space
]

{ #category : #hooks }
BIEnlumineurBlockExpressionTest >> openBracket [
	^ '['
]

{ #category : #hooks }
BIEnlumineurBlockExpressionTest >> parser [
	^ RBParser
]

{ #category : #configurations }
BIEnlumineurBlockExpressionTest >> periodAtEndConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		numberOfSpacesInsideBlock:1;
		periodsAtEndOfBlock: true;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets: false;
		indentCharacter: #tabulation;
		keepBlockInMessage: false;
		retainBlankLinesBetweenStatements: false;
		minimumNewLinesBetweenStatements: 1;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 5;
		indentsForKeywords: 1;
		newLineBeforeFirstKeyword: false;
		formatCommentWithStatements: true;
		maxLineLength: 50
]

{ #category : #configurations }
BIEnlumineurBlockExpressionTest >> tabIndentConfiguration [

	^ self contextClass basicNew
		numberOfSpacesInsideBlock: 1;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets:false;
		keepBlockInMessage:true;
		retainBlankLinesBetweenStatements:false;
		minimumNewLinesBetweenStatements:1;
		multiLineMessages: Array new;
		oneLineMessages:#(#to:do:);
		numberOfArgumentsForMultiLine:5;
		indentsForKeywords:1;
		newLineBeforeFirstKeyword:false;
		formatCommentWithStatements:true;
		maxLineLength:50;
		newLineAfterCascade:true;
		newLineBeforeFirstCascade: true;
		indentCharacter: #tab
]

{ #category : #configurations }
BIEnlumineurBlockExpressionTest >> tabIndentIsnotAffectedConfiguration [

	^ self contextClass basicNew
		numberOfSpacesInsideBlock: 1;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets:false;
		keepBlockInMessage:true;
		retainBlankLinesBetweenStatements:false;
		minimumNewLinesBetweenStatements:1;
		multiLineMessages: Array new;
		oneLineMessages:#(#to:do:);
		numberOfArgumentsForMultiLine:5;
		indentsForKeywords:1;
		newLineBeforeFirstKeyword:false;
		formatCommentWithStatements:true;
		maxLineLength:50;
		newLineAfterCascade:true;
		newLineBeforeFirstCascade: true;
		indentCharacter: #tab;
		numberOfSpacesInIndent: 37
]

{ #category : #configurations }
BIEnlumineurBlockExpressionTest >> tabIndentIsnotAffectedConfiguration2 [

	^ self contextClass basicNew
		numberOfSpacesInsideBlock: 1;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets:false;
		keepBlockInMessage:true;
		retainBlankLinesBetweenStatements:false;
		minimumNewLinesBetweenStatements:1;
		multiLineMessages: Array new;
		oneLineMessages:#(#to:do:);
		numberOfArgumentsForMultiLine:5;
		indentsForKeywords:1;
		newLineBeforeFirstKeyword:false;
		formatCommentWithStatements:true;
		maxLineLength:50;
		newLineAfterCascade:true;
		newLineBeforeFirstCascade: true;
		numberOfSpacesInIndent: 37;
		indentCharacter: #tab
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testArgumentIsFormated [
	self validate: ':i|i' isFormattedAs: ' :i | i ' 
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testArgumentsAreFormated [
	
	self 
		validate:':i :j| i '
		isFormattedAs:' :i :j | i '.
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testArgumentsComments [
	
	self 
		validate:':i "aComment" :j "anotherComment"| i '
		isFormattedAs:
' :i "aComment" :j "anotherComment" | i '
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testDontFormatCommentWithStatement [
	self validate: '1 factorial. "aComment" 2 factorial'
	isFormattedAs: 
' 1 factorial "aComment".
2 factorial '
	with: #dontFormatCommentWithStatementConfiguration
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testDontFormatCommentWithStatement2 [
	self validate: ' "aComment" 1 factorial.  2 factorial'
	isFormattedAs: 
' "aComment"
1 factorial.
2 factorial '
	with: #dontFormatCommentWithStatementConfiguration
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testEndPeriodInside [
	
	self 
		validate:'2.'
		isFormattedAs:' 2. '
		with: #periodAtEndConfiguration
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testFormatBody [

	self 
		validate:' [1]. [ a:=1] '
		isFormattedAs:
' [ 1 ].
[ a := 1 ] '.
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testFormatCommentWithStatement [
	self validate: '1 factorial. "aComment" 2 factorial'
	isFormattedAs: 
' 1 factorial.	"aComment"
2 factorial '
	with: #formatCommentWithStatementConfiguration
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testFourSpaceIndent [
	| source |
	configurationSelector := #fourSpaceIndentConfiguration.
	source := self
		formatExpression:
			'1 to:10 do: [:i | i to: 10 do: [:j | Transcript show:i; show: j]]'.
	self
		assert: source
		equals:
'1 to: 10 do: [ :i | 
    i to: 10 do: [ :j | 
        Transcript
            show: i;
            show: j ] ]'
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testMultiline [

	self 
		validate: '1+3. 6 factorial '
		isFormattedAs: 
' 1 + 3.
6 factorial '
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testNewLineAfterComment [
	
	self 
		validate: '"aComment"1. 2'
		isFormattedAs: 
' "aComment"
1.
2 '
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testNewLineBeforeEndBrackets [

	self 
		validate:'3. 4'  
		isFormattedAs:
' 3.
4
'  		with: #newLineBeforeEndBracketConfiguration.
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testNoEndPeriodInside [

	self validate: '2.' isFormattedAs: ' 2 '
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testNoExtraSpaceAroundBlock [

	| expr source |
	expr := self parser parseExpression: '   ', self openBracket, '2', self closeBracket, '   '.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: self openBracket, ' 2 ', self closeBracket
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testNoExtraSpaceInside [

	self validate: '    2     ' isFormattedAs: ' 2 '
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testNoNewLineBeforeEndBrackets [

	self 
		validate: '3. 4'  
		isFormattedAs:
' 3.
4 '  with: #noNewLineBeforeEndBracketConfiguration.
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testNumberOfSpaces [

	self validate: '2' isFormattedAs: '   2   ' with: #configurationWithThreeSpaces
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testOneSpaceIndent [
	| source |
	configurationSelector := #oneSpaceIndentConfiguration.
	source := self
		formatExpression:
			'1 to:10 do: [:i | i to: 10 do: [:j | Transcript show:i; show: j]]'.
	self
		assert: source
		equals:
'1 to: 10 do: [ :i | 
 i to: 10 do: [ :j | 
  Transcript
   show: i;
   show: j ] ]'
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testSpace [

	self validate: '2' isFormattedAs: ' 2 '
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testTabIndent [
	| source |
	configurationSelector := #tabIndentConfiguration.
	source := self
		formatExpression:
			'1 to:10 do: [:i | i to: 10 do: [:j | Transcript show:i; show: j]]'.
	self
		assert: source
		equals:
'1 to: 10 do: [ :i | 
	i to: 10 do: [ :j | 
		Transcript
			show: i;
			show: j ] ]'
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testTabIndentIsNotAffectedByNumberOfSpace [
	| source |
	configurationSelector := #tabIndentIsnotAffectedConfiguration.
	source := self
		formatExpression:
			'1 to:10 do: [:i | i to: 10 do: [:j | Transcript show:i; show: j]]'.
	self
		assert: source
		equals:
'1 to: 10 do: [ :i | 
	i to: 10 do: [ :j | 
		Transcript
			show: i;
			show: j ] ]'
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testTabIndentIsNotAffectedByNumberOfSpace2 [
	| source |
	configurationSelector := #tabIndentIsnotAffectedConfiguration2.
	source := self
		formatExpression:
			'1 to:10 do: [:i | i to: 10 do: [:j | Transcript show:i; show: j]]'.
	self
		assert: source
		equals:
'1 to: 10 do: [ :i | 
	i to: 10 do: [ :j | 
		Transcript
			show: i;
			show: j ] ]'
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testnumberOfSpaceChangedAfterIndentCharacter [
	| source |
	configurationSelector := #numberOfSpaceChangedAfterIndentCharacterConfiguration.
	source := self
		formatExpression:
			'1 to:10 do: [:i | i to: 10 do: [:j | Transcript show:i; show: j]]'.
	self
		assert: source
		equals:
'1 to: 10 do: [ :i | 
  i to: 10 do: [ :j | 
    Transcript
      show: i;
      show: j ] ]'
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> validate: stringInsideBlock isFormattedAs: ExpectedStringInsideBlock [
	self validate: stringInsideBlock isFormattedAs: ExpectedStringInsideBlock with: #basicConfiguration
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> validate: stringInsideBlock isFormattedAs: ExpectedStringInsideBlock with: aConfiguration [
	| expr source |
	expr := self parser parseExpression: self openBracket ,stringInsideBlock,self closeBracket.
	configurationSelector := aConfiguration.
	source := self formatter format: expr.
	self assert: source equals: self openBracket,ExpectedStringInsideBlock,self closeBracket
]
