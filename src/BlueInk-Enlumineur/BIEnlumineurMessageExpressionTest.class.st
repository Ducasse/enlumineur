Class {
	#name : #BIEnlumineurMessageExpressionTest,
	#superclass : #BIEnlumineurTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> basicConfiguration [

	^ self contextClass basicNew
		indentString: '	';
		formatCommentWithStatements:false;
		multiLineMessages:Array new;
		oneLineMessages:Array new;
		numberOfArgumentsForMultiLine:10;
		indentsForKeywords: 0;
		maxLineLength: 50;
		newLineBeforeFirstKeyword:false;
		keepBlockInMessage:false
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> formatStatementsWithCommentsConfiguration [

	^ self contextClass basicNew
		indentString: '	';
		formatCommentWithStatements:true;
		multiLineMessages:Array new;
		oneLineMessages:Array new;
		numberOfArgumentsForMultiLine:10;
		indentsForKeywords: 0;
		maxLineLength: 50;
		newLineBeforeFirstKeyword:false;
		keepBlockInMessage:false
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> keepBlockInMessageConfiguration [

	^ self contextClass basicNew
		indentString: '	';
		formatCommentWithStatements:false;
		multiLineMessages:Array new;
		oneLineMessages:Array new;
		numberOfArgumentsForMultiLine:10;
		indentsForKeywords: 0;
		maxLineLength: 20;
		newLineBeforeFirstKeyword:false;
		keepBlockInMessage: true;
		numberOfSpacesInsideBlock:0;
		numberOfSpacesAfterCaretSymbolInReturn: 0;
		periodsAtEndOfBlock: false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets: false;
		retainBlankLinesBetweenStatements: false;
		minimumNewLinesBetweenStatements: 0
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> multiLineMessageConfiguration [

	^ self contextClass basicNew
		indentString: '	';
		formatCommentWithStatements:false;
		multiLineMessages:#(#multi:line:);
		oneLineMessages:Array new;
		numberOfArgumentsForMultiLine:10;
		indentsForKeywords: 1;
		maxLineLength: 50;
		newLineBeforeFirstKeyword:false;
		keepBlockInMessage:false
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> newLineBeforeFirstKeywordConfiguration [

	^ self contextClass basicNew
		indentString: '	';
		formatCommentWithStatements:false;
		multiLineMessages:Array new;
		oneLineMessages:Array new;
		numberOfArgumentsForMultiLine:10;
		indentsForKeywords: 0;
		maxLineLength: 50;
		newLineBeforeFirstKeyword:true;
		keepBlockInMessage:false
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> noIdentsForKeyWordConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"
	
	^ self contextClass basicNew
		indentString: '	';
		formatCommentWithStatements:false;
		multiLineMessages:Array new;
		oneLineMessages:Array new;
		maxLineLength: 50;
		newLineBeforeFirstKeyword:false;
		keepBlockInMessage:false;
		numberOfArgumentsForMultiLine:1;
		indentsForKeywords: 0
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> oneArgumentPerLineConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"
	
	^ self contextClass basicNew
		indentString: '	';
		formatCommentWithStatements:false;
		multiLineMessages:Array new;
		oneLineMessages:Array new;
		numberOfArgumentsForMultiLine:1;
		indentsForKeywords: 0;
		maxLineLength: 50;
		newLineBeforeFirstKeyword:false;
		keepBlockInMessage:false
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> oneIdentsForKeyWordConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
		numberOfArgumentsForMultiLine:1;
		indentsForKeywords: 1
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> oneLineMessageConfiguration [

	^ self contextClass basicNew
		indentString: '	';
		formatCommentWithStatements:false;
		multiLineMessages:Array new;
		oneLineMessages:#(#one:line:message:);
		numberOfArgumentsForMultiLine:10;
		indentsForKeywords: 0;
		maxLineLength: 50;
		newLineBeforeFirstKeyword:false;
		keepBlockInMessage:false
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testBinaryFormatParameter [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '1 + (3     factorial)'.
	self assert: source equals: '1 + 3 factorial'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testBinaryFormatReceiver [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: 'a:=''abc'' at: 2'.
	self assert: source equals: 'a := ''abc'' at: 2'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testBinaryMessageComments [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '1 + 1 "aComment"'.
	self assert: source equals: '1 + 1 "aComment"'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testBinaryMessageFormatCommentsWithStatement [
	| source |
	configurationSelector := #formatStatementsWithCommentsConfiguration.
	source := self formatExpression: '1 + 1 "aComment"'.
	self assert: source equals: '1 + 1'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testBinaryNoExtraSpacesAfter [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '1+2          '.
	self assert: source equals: '1 + 2'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testBinaryNoExtraSpacesBefore [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '   1+2'.
	self assert: source equals: '1 + 2'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testBinaryNoExtraSpacesBetween [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '1     +     2'.
	self assert: source equals: '1 + 2'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testBinaryOneArgumentPerLine [
	| source |
	configurationSelector := #oneArgumentPerLineConfiguration.
	source := self formatExpression: '1+2'.
	self
		assert: source
		equals:
			'1 + 2'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testIndentsForKeywords1 [
	| source |
	configurationSelector := #oneIdentsForKeyWordConfiguration.
	source := self formatExpression: 'a k1:1 k2:2 k3:3'.
	self
		assert: source
		equals:
			'a
	k1: 1
	k2: 2
	k3: 3'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testIndentsForKeywords2 [
	| source |
	configurationSelector := #twoIdentsForKeyWordConfiguration.
	source := self formatExpression: 'a k1:1 k2:2 k3:3'.
	self
		assert: source
		equals:
			'a
		k1: 1
		k2: 2
		k3: 3'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testKeepBlockInMessageMutlilineNewLine [
	| source |
	configurationSelector := #keepBlockInMessageConfiguration.
	source := self
		formatExpression: 'aBoolean  ifTrue:[ Transcript cr. Transcript cr. Transcript cr]'.
	self
		assert: source
		equals:
			'aBoolean
ifTrue:
	[Transcript cr. Transcript
	cr. Transcript cr]'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testKeepBlockInMessageMutlilineSpace [
	| source |
	configurationSelector := #keepBlockInMessageConfiguration.
	source := self
		formatExpression:
			'aBoolean ifTrue:[ 12 factorial. 12 factorial. 3
	factorial]'.
	self
		assert: source
		equals:
			'aBoolean
ifTrue: [12 factorial. 12
	factorial. 3
	factorial]'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testKeepBlockInMessageNotMultilineSpace [
	| source |
	configurationSelector := #keepBlockInMessageConfiguration.
	source := self formatExpression: 'aBoolean ifTrue:[^1]'.
	self
		assert: source
		equals:
			'aBoolean
ifTrue: [^1]'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testKeepBlockInMessageNotMutlilineNewLine [
	| source |
	configurationSelector := #keepBlockInMessageConfiguration.
	source := self
		formatExpression: 'aBoolean ifTrue:[LongLongLongExpression]'.
	self
		assert: source
		equals:
			'aBoolean
ifTrue:
	[LongLongLongExpression]'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testKeyWordFormatReceiver [
	| source |
	configurationSelector := #basicConfiguration.
	source := self
		formatExpression: '2 between: 4-2 and: 3     factorial'.
	self assert: source equals: '2 between: 4 - 2 and: 3 factorial'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testKeywordComments [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '1 between: 2"firstComment" and: 3 "secondComment"'.
	self assert: source equals: '1 between: 2 "firstComment" and: 3 "secondComment"'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testKeywordCommentsFormatCommentsWithStatement [
	| source |
	configurationSelector := #formatStatementsWithCommentsConfiguration.
	source := self formatExpression: '1 between: 2"firstComment" and: 3 "secondComment"'.
	self assert: source equals: '1 between: 2 and: 3'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testKeywordFormatParameter [
	| source |
	configurationSelector := #basicConfiguration.
	source := self
		formatExpression: '3 between:2      factorial and: 4+5'.
	self assert: source equals: '3 between: 2 factorial and: 4 + 5'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testKeywordNoExtraSpacesAfter [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '2 between: 1 and: 3          '.
	self assert: source equals: '2 between: 1 and: 3'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testKeywordNoExtraSpacesBefore [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '   2 between: 1 and: 3'.
	self assert: source equals: '2 between: 1 and: 3'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testKeywordNoExtraSpacesBetween [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '2      between:     1   and:    3'.
	self assert: source equals: '2 between: 1 and: 3'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testKeywordOneArgumentPerLine [
	| source |
	configurationSelector := #oneArgumentPerLineConfiguration.
	source := self formatExpression: '2      between:     1   and:    3'.
	self
		assert: source
		equals:
			'2
between: 1
and: 3'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testMultiLineMessage [
	| source |
	configurationSelector := #multiLineMessageConfiguration.
	source := self formatExpression: 'foo multi:1 line:2 '.
	self
		assert: source
		equals:
			'foo
	multi: 1
	line: 2'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testNewLineBeforeFirstKeyword [
	| source |
	configurationSelector := #newLineBeforeFirstKeywordConfiguration.
	source := self formatExpression: '2 between: 1 and: 3'.
	self
		assert: source
		equals:
			'2
between: 1 and: 3'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testNewLineBeforeFirstKeyword2 [
	| source |
	configurationSelector := #newLineBeforeFirstKeywordConfiguration.
	source := self formatExpression: '1+1'.
	self
		assert: source
		equals:'1 + 1'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testNoIndentsForKeywords [
	| source |
	configurationSelector := #noIdentsForKeyWordConfiguration.
	source := self formatExpression: 'a k1:1 k2:2 k3:3'.
	self
		assert: source
		equals:
			'a
k1: 1
k2: 2
k3: 3'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testOneLineMessage [
	| source |
	configurationSelector := #oneLineMessageConfiguration.
	source := self formatExpression: 'foo one:1 line:2 message:3'.
	self assert: source equals: 'foo one: 1 line: 2 message: 3'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testTooLongArgument [
	| source |
	configurationSelector := #tooLongArgumentConfiguration.
	source := self formatExpression: 'foo message: TooLongArgument'.
	self
		assert: source
		equals:
			'foo
message:
	TooLongArgument'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testTraditionalBinaryPrecedence [
	| source |
	configurationSelector := #traditionalBinaryPrecedenceConfiguration.
	source := self formatExpression: '2+3*4'.
	self assert: source equals: '(2 + 3) * 4'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testTraditionalBinaryPrecedence2 [
	| source |
	configurationSelector := #traditionalBinaryPrecedenceConfiguration.
	source := self formatExpression: '2*3+4'.
	self assert: source equals: '2 * 3 + 4'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testTraditionalBinaryPrecedence3 [
	| source |
	configurationSelector := #traditionalBinaryPrecedenceConfiguration.
	source := self formatExpression: '2+3*4+5 * 2'.
	self assert: source equals: '((2 + 3) * 4 + 5) * 2'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testUnaryFormatReceiver [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: 'a:=1 factorial'.
	self assert: source equals: 'a := 1 factorial'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testUnaryMessageComments [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '1 factorial "aComment"'.
	self assert: source equals: '1 factorial "aComment"'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testUnaryMessageFormatCommentsWithStatement [
	| source |
	configurationSelector := #formatStatementsWithCommentsConfiguration.
	source := self formatExpression: '1 factorial "aComment"'.
	self assert: source equals: '1 factorial'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testUnaryNoExtraSpacesAfter [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: 'Transcript cr        '.
	self assert: source equals: 'Transcript cr'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testUnaryNoExtraSpacesBefore [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '   Transcript cr'.
	self assert: source equals: 'Transcript cr'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testUnaryNoExtraSpacesBetween [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: 'Transcript        cr'.
	self assert: source equals: 'Transcript cr'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testUnaryNoExtraSpacesBetween2 [
	| source |
	configurationSelector := #basicConfiguration.
	source := self
		formatExpression: '2           factorial              factorial'.
	self assert: source equals: '2 factorial factorial'
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> tooLongArgumentConfiguration [

	^ self contextClass basicNew
		indentString: '	';
		formatCommentWithStatements:false;
		multiLineMessages:Array new;
		oneLineMessages:Array new;
		numberOfArgumentsForMultiLine:10;
		indentsForKeywords: 0;
		maxLineLength: 10;
		newLineBeforeFirstKeyword:false;
		keepBlockInMessage:false
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> traditionalBinaryPrecedenceConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
	indentString: '	';
	formatCommentWithStatements:false;
	multiLineMessages:Array new;
	oneLineMessages:Array new;
	numberOfArgumentsForMultiLine:10;
	indentsForKeywords: 0;
	maxLineLength: 50;
	newLineBeforeFirstKeyword:false;
	keepBlockInMessage:false;
	useTraditionalBinaryPrecedenceForParentheses:true;
	traditionalBinaryPrecedenceArray: #(#($| $& $?) #($= $~ $< $>) #($- $+) #($* $/ $% $\) #($@));
	stringInsideParentheses: ''
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> twoIdentsForKeyWordConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
	indentString: '	';
	formatCommentWithStatements:false;
	multiLineMessages:Array new;
	oneLineMessages:Array new;
	numberOfArgumentsForMultiLine:1;
	indentsForKeywords: 2;
	maxLineLength: 50;
	newLineBeforeFirstKeyword:false;
	keepBlockInMessage:false
]
