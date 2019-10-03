Class {
	#name : #BIEnlumineurBlockExpressionTest,
	#superclass : #BIEnlumineurTest,
	#category : #'Enlumineur-Tests'
}

{ #category : #configurations }
BIEnlumineurBlockExpressionTest >> basicConfiguration [

	^ self contextClass basicNew
		numberOfSpacesInsideBlock: 1;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets:false;
		indentStyle: #tabulation;
		keepBlockInMessage:true;
		retainBlankLinesBetweenStatements:false;
		minimumNewLinesBetweenStatements:1;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine:5;
		indentsForKeywords:1;
		newLineBeforeFirstKeyword:false;
		formatCommentWithStatements:true;
		maxLineLength:50;
		indentExtraSpaces: 0
]

{ #category : #configurations }
BIEnlumineurBlockExpressionTest >> blockWithTemporariesConfiguration [

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
		indentStyle: #tabulation;
		newLinesAfterTemporaries: 1;
		indentExtraSpaces:0
]

{ #category : #helpers }
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
		indentStyle: #tabulation;
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
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurBlockExpressionTest >> doNotKeepBlockInMessageConfiguration [

	^ self contextClass basicNew
		numberOfSpacesInsideBlock: 1;
		periodsAtEndOfBlock: false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets: false;
		indentStyle: #tabulation;
		keepBlockInMessage: false;
		retainBlankLinesBetweenStatements: false;
		minimumNewLinesBetweenStatements: 1;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 5;
		indentsForKeywords: 1;
		newLineBeforeFirstKeyword: false;
		formatCommentWithStatements: true;
		maxLineLength: 50;
		indentExtraSpaces: 0
]

{ #category : #configurations }
BIEnlumineurBlockExpressionTest >> dontFormatCommentWithStatementConfiguration [

	^ self contextClass basicNew
		numberOfSpacesInsideBlock:1;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets:false;
		indentStyle: #tabulation;
		keepBlockInMessage:true;
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
		useBasicCommentFormat: false;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurBlockExpressionTest >> formatCommentWithStatementConfiguration [

	^ self contextClass basicNew
		numberOfSpacesInsideBlock:1;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets:false;
		indentStyle: #tabulation;
		keepBlockInMessage:true;
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
		useBasicCommentFormat: false;
		indentExtraSpaces: 0
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
		indentStyle: #space;
		indentExtraSpaces: 0
]

{ #category : #configurations }
BIEnlumineurBlockExpressionTest >> multiLineConfiguration [

	^ self contextClass basicNew
		numberOfSpacesInsideBlock:1;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets:false;
		indentStyle: #tabulation;
		keepBlockInMessage:false;
		retainBlankLinesBetweenStatements:false;
		retainBlankLinesBeforeComments:false;
		minimumNewLinesBetweenStatements:1;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine:5;
		indentsForKeywords:1;
		newLineBeforeFirstKeyword:false;
		formatCommentWithStatements:true;
		maxLineLength:50;
		useBasicCommentFormat:false;
		indentExtraSpaces:0;
		newLineBeforeFirstCascade: true;
		newLineAfterCascade: true
]

{ #category : #configurations }
BIEnlumineurBlockExpressionTest >> multiLineWithThreeSpacesInsideBlockConfiguration [

	^ self contextClass basicNew
		numberOfSpacesInsideBlock:3;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets:false;
		indentStyle: #tabulation;
		keepBlockInMessage:false;
		retainBlankLinesBetweenStatements:false;
		retainBlankLinesBeforeComments:false;
		minimumNewLinesBetweenStatements:1;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine:5;
		indentsForKeywords:1;
		newLineBeforeFirstKeyword:false;
		formatCommentWithStatements:true;
		maxLineLength:50;
		useBasicCommentFormat:false;
		indentExtraSpaces:0;
		newLineBeforeFirstCascade: true;
		newLineAfterCascade: true
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
		indentStyle: #tabulation;
		keepBlockInMessage: true;
		retainBlankLinesBetweenStatements: false;
		minimumNewLinesBetweenStatements: 1;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 5;
		indentsForKeywords: 1;
		newLineBeforeFirstKeyword: false;
		formatCommentWithStatements: true;
		maxLineLength: 50;
		indentExtraSpaces:0
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
		indentStyle: #tabulation;
		keepBlockInMessage: true;
		retainBlankLinesBetweenStatements: false;
		minimumNewLinesBetweenStatements: 1;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 5;
		indentsForKeywords: 1;
		newLineBeforeFirstKeyword: false;
		formatCommentWithStatements: true;
		maxLineLength: 50;
		indentExtraSpaces:0
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
		indentStyle: #space;
		numberOfSpacesInIndent: 2;
		indentExtraSpaces:0
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
		indentStyle: #space;
		indentExtraSpaces:0
]

{ #category : #helpers }
BIEnlumineurBlockExpressionTest >> openBracket [
	^ '['
]

{ #category : #helpers }
BIEnlumineurBlockExpressionTest >> parserClass [
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
		indentStyle: #tabulation;
		keepBlockInMessage: false;
		retainBlankLinesBetweenStatements: false;
		minimumNewLinesBetweenStatements: 1;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 5;
		indentsForKeywords: 1;
		newLineBeforeFirstKeyword: false;
		formatCommentWithStatements: true;
		maxLineLength: 50;
		indentExtraSpaces:0
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
		indentStyle: #tabulation;
		indentExtraSpaces:0
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
		indentStyle: #tabulation;
		numberOfSpacesInIndent: 37;
		indentExtraSpaces:0
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
BIEnlumineurBlockExpressionTest >> testDoNotKeepBlockInMessageConfiguration [
	
	self validate: ':i | i to: 10 do: [:j | Transcript show:i. Transcript show: j]'
		isFormattedAs: ' :i | 
i to: 10 do:
	[ :j | 
	Transcript show: i.
	Transcript show: j ] '
	with: #doNotKeepBlockInMessageConfiguration.
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testDontFormatCommentWithStatement [
	self
		validate: '1 factorial. "aComment" 2 factorial'
		isFormattedAs:
			' 
1 factorial "aComment".
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
		validate: ' [1]. [ a:=1] '
		isFormattedAs:
			' 
[ 1 ].
[ a := 1 ] '
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testFormatCommentWithStatement [
	self
		validate: '1 factorial. "aComment" 2 factorial'
		isFormattedAs:
			' 
1 factorial. "aComment"
2 factorial '
		with: #formatCommentWithStatementConfiguration
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testFourSpaceIndent [
	self
		validate: ':i | i to: 10 do: [:j | Transcript show:i; show: j]'
		isFormattedAs:
' :i | 
i to: 10 do: [ :j | 
    Transcript
        show: i;
        show: j ] '
		with: #fourSpaceIndentConfiguration
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testMultiline [

	self 
		validate: '1+3. 6 factorial '
		isFormattedAs: 
' 
1 + 3.
6 factorial '
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testNewLineAfterFirstBracketWhenMultilineWithArguments [

	self 
		validate: ':i | i+3. i factorial '
		isFormattedAs: 
' :i | 
i + 3.
i factorial '
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testNewLineAfterFirstBracketWhenMultilineWithTemporaries [

	self 
		validate: '| tmp | 1+3. 6 factorial '
		isFormattedAs: 
' 
| tmp |
1 + 3.
6 factorial '
with: #blockWithTemporariesConfiguration
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testNewLineBeforeEndBrackets [

	self 
		validate:'3. 4'  
		isFormattedAs:
' 
3.
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
	expr := self parserClass parseExpression: '   ', self openBracket, '2', self closeBracket, '   '.
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
' 
3.
4 '  with: #noNewLineBeforeEndBracketConfiguration.
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testNotTooLongBlockBody [
	self validate: 'short' isFormattedAs: ' short ' with: #tooLongStatementConfiguration
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testNumberOfSpaces [

	self validate: '2' isFormattedAs: '   2   ' with: #configurationWithThreeSpaces
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testOneSpaceIndent [
	
	self validate: ':i | i to: 10 do: [:j | Transcript show:i; show: j]'
		isFormattedAs: ' :i | 
i to: 10 do: [ :j | 
 Transcript
  show: i;
  show: j ] '
	with: #oneSpaceIndentConfiguration.
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testSpace [

	self validate: '2' isFormattedAs: ' 2 '
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testTabIndent [
	self validate: ':i | i to: 10 do: [:j | Transcript show:i; show: j]'
	isFormattedAs: ' :i | 
i to: 10 do: [ :j | 
	Transcript
		show: i;
		show: j ] '
	 with: #tabIndentConfiguration
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testTabIndentIsNotAffectedByNumberOfSpace [

	self validate: ':i | i to: 10 do: [:j | Transcript show:i; show: j]'
	 isFormattedAs: ' :i | 
i to: 10 do: [ :j | 
	Transcript
		show: i;
		show: j ] '
	 with: #tabIndentIsnotAffectedConfiguration
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testTooLongBlockBody [
	self validate: 'tooLongStatement' isFormattedAs:
' 
tooLongStatement ' with: #tooLongStatementConfiguration
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testTooLongBlockBodyWithArgument [
	self validate: ':i | tooLongStatement' isFormattedAs:
' :i | 
tooLongStatement ' with: #tooLongStatementConfiguration
]

{ #category : #test }
BIEnlumineurBlockExpressionTest >> testnumberOfSpaceChangedAfterIndentCharacter [

	self validate: ':i | i to: 10 do: [:j | Transcript show:i; show: j]'
	isFormattedAs: ' :i | 
i to: 10 do: [ :j | 
  Transcript
    show: i;
    show: j ] '
	with: #numberOfSpaceChangedAfterIndentCharacterConfiguration
]

{ #category : #configurations }
BIEnlumineurBlockExpressionTest >> tooLongStatementConfiguration [

	^ self contextClass basicNew
		numberOfSpacesInsideBlock: 1;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets:false;
		indentStyle: #tabulation;
		keepBlockInMessage:true;
		retainBlankLinesBetweenStatements:false;
		minimumNewLinesBetweenStatements:1;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine:5;
		indentsForKeywords:1;
		newLineBeforeFirstKeyword:false;
		formatCommentWithStatements:true;
		maxLineLength:10;
		indentExtraSpaces: 0
]

{ #category : #helpers }
BIEnlumineurBlockExpressionTest >> validate: stringInsideBlock isFormattedAs: expectedStringInsideBlock [
	self 
		validate: stringInsideBlock 
		isFormattedAs: expectedStringInsideBlock 
		with: #basicConfiguration
]

{ #category : #helpers }
BIEnlumineurBlockExpressionTest >> validate: stringInsideBlock isFormattedAs: expectedStringInsideBlock with: aConfiguration [

	| expr source |
	expr := self parserClass parseExpression: self openBracket , stringInsideBlock, self closeBracket.
	configurationSelector := aConfiguration.
	source := self formatter format: expr.
	self assert: source equals: self openBracket , expectedStringInsideBlock , self closeBracket
]
