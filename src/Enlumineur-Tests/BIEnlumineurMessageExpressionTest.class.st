Class {
	#name : #BIEnlumineurMessageExpressionTest,
	#superclass : #BIEnlumineurTest,
	#category : #'Enlumineur-Tests'
}

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> basicConfiguration [

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentCloseToStatements:false;
		multiLineMessages:Array new;
		oneLineMessages:Array new;
		numberOfArgumentsForMultiLine:10;
		indentsForKeywords: 0;
		maxLineLength: 70;
		newLineBeforeFirstKeyword:false;
		keepBlockInMessage:false;
		indentExtraSpaces: 0
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> blockAndCascadeInMessageConfiguration [
	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentCloseToStatements: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 10;
		indentsForKeywords: 1;
		maxLineLength: 70;
		newLineBeforeFirstKeyword: false;
		keepBlockInMessage: true;
		numberOfSpacesInsideBlock: 1;
		numberOfSpacesAfterCaretSymbolInReturn: 1;
		periodAtEndOfBlock: false;
		periodAtEndOfMethod: false;
		lineUpBlockBrackets: false;
		retainBlankLinesBetweenStatements: false;
		minimumNewLinesBetweenStatements: 1;
		indentExtraSpaces:0;
		newLineBeforeFirstCascade: true;
		numberOfSpacesInsideParentheses: 0 ;
		newLineAfterCascade: true
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> blockAndParenthesesInMessageConfiguration [
	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentCloseToStatements: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 10;
		indentsForKeywords: 1;
		maxLineLength: 70;
		newLineBeforeFirstKeyword: true;
		keepBlockInMessage: true;
		numberOfSpacesInsideBlock: 1;
		numberOfSpacesAfterCaretSymbolInReturn: 0;
		periodAtEndOfBlock: false;
		periodAtEndOfMethod: false;
		lineUpBlockBrackets: false;
		retainBlankLinesBetweenStatements: false;
		minimumNewLinesBetweenStatements: 1;
		indentExtraSpaces:0;
		newLineBeforeFirstCascade: true;
		numberOfSpacesInsideParentheses: 1 ;
		newLineAfterCascade: true
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> blockInMessageConfiguration [
	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentCloseToStatements: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 10;
		indentsForKeywords: 1;
		maxLineLength: 70;
		newLineBeforeFirstKeyword: true;
		keepBlockInMessage: true;
		numberOfSpacesInsideBlock: 1;
		numberOfSpacesAfterCaretSymbolInReturn: 0;
		periodAtEndOfBlock: false;
		periodAtEndOfMethod: false;
		lineUpBlockBrackets: false;
		retainBlankLinesBetweenStatements: false;
		minimumNewLinesBetweenStatements: 1;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> blockInMessageTooLongConfiguration [
	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentCloseToStatements: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 10;
		indentsForKeywords: 1;
		maxLineLength: 20;
		newLineBeforeFirstKeyword: true;
		keepBlockInMessage: true;
		numberOfSpacesInsideBlock: 1;
		numberOfSpacesAfterCaretSymbolInReturn: 0;
		periodAtEndOfBlock: false;
		periodAtEndOfMethod: false;
		lineUpBlockBrackets: false;
		retainBlankLinesBetweenStatements: false;
		minimumNewLinesBetweenStatements: 1;
		indentExtraSpaces: 0
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> dontKeepBlockInMessageConfiguration [
	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentCloseToStatements: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 10;
		indentsForKeywords: 1;
		maxLineLength: 70;
		newLineBeforeFirstKeyword: true;
		keepBlockInMessage: false;
		numberOfSpacesInsideBlock: 1;
		numberOfSpacesAfterCaretSymbolInReturn: 0;
		periodAtEndOfBlock: false;
		periodAtEndOfMethod: false;
		lineUpBlockBrackets: false;
		retainBlankLinesBetweenStatements: false;
		minimumNewLinesBetweenStatements: 1;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> extraIndentWithThreeSpacesInsideParenthesesConfiguration [
	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentCloseToStatements: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 10;
		indentsForKeywords: 0;
		maxLineLength: 70;
		newLineBeforeFirstKeyword: false;
		keepBlockInMessage: true;
		numberOfSpacesInsideBlock: 1;
		numberOfSpacesAfterCaretSymbolInReturn: 0;
		periodAtEndOfBlock: false;
		periodAtEndOfMethod: false;
		lineUpBlockBrackets: false;
		retainBlankLinesBetweenStatements: false;
		minimumNewLinesBetweenStatements: 1;
		indentExtraSpaces:0;
		newLineBeforeFirstCascade: true;
		numberOfSpacesInsideParentheses: 3 ;
		newLineAfterCascade: true
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> formatStatementsWithCommentsConfiguration [

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentCloseToStatements:true;
		multiLineMessages:Array new;
		oneLineMessages:Array new;
		numberOfArgumentsForMultiLine:10;
		indentsForKeywords: 0;
		maxLineLength: 50;
		newLineBeforeFirstKeyword:false;
		keepBlockInMessage:false
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> ifTrueIfFalseMutlilineMessageConfiguration [
	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentCloseToStatements: false;
		multiLineMessages:#(#ifTrue:ifFalse:);
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 10;
		indentsForKeywords: 1;
		maxLineLength: 70;
		newLineBeforeFirstKeyword: true;
		keepBlockInMessage: true;
		numberOfSpacesInsideBlock: 1;
		numberOfSpacesAfterCaretSymbolInReturn: 0;
		periodAtEndOfBlock: false;
		periodAtEndOfMethod: false;
		lineUpBlockBrackets: false;
		retainBlankLinesBetweenStatements: false;
		minimumNewLinesBetweenStatements: 1;
		indentExtraSpaces:0;
		newLineBeforeFirstCascade: true;
		numberOfSpacesInsideParentheses: 1 ;
		newLineAfterCascade: true
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> keepBlockInMessageConfiguration [
	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentCloseToStatements: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 10;
		indentsForKeywords: 1;
		maxLineLength: 70;
		newLineBeforeFirstKeyword: true;
		keepBlockInMessage: true;
		numberOfSpacesInsideBlock: 1;
		numberOfSpacesAfterCaretSymbolInReturn: 0;
		periodAtEndOfBlock: false;
		periodAtEndOfMethod: false;
		lineUpBlockBrackets: false;
		retainBlankLinesBetweenStatements: false;
		minimumNewLinesBetweenStatements: 1;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> littleMaxLineLengthConfiguration [
	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentCloseToStatements: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 10;
		indentsForKeywords: 1;
		maxLineLength: 20;
		newLineBeforeFirstKeyword: true;
		keepBlockInMessage: true;
		numberOfSpacesInsideBlock: 1;
		numberOfSpacesAfterCaretSymbolInReturn: 0;
		periodAtEndOfBlock: false;
		periodAtEndOfMethod: false;
		lineUpBlockBrackets: false;
		retainBlankLinesBetweenStatements: false;
		minimumNewLinesBetweenStatements: 1;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> multiLineMessageConfiguration [
	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentCloseToStatements: false;
		multiLineMessages: #(#multi:line:);
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 10;
		indentsForKeywords: 1;
		maxLineLength: 50;
		newLineBeforeFirstKeyword: true;
		keepBlockInMessage: false;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> newLineBeforeFirstKeywordConfiguration [

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentCloseToStatements:false;
		multiLineMessages:Array new;
		oneLineMessages:Array new;
		numberOfArgumentsForMultiLine:10;
		indentsForKeywords: 0;
		maxLineLength: 50;
		newLineBeforeFirstKeyword:true;
		keepBlockInMessage:false;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> noIdentsForKeyWordConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentCloseToStatements: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		maxLineLength: 50;
		newLineBeforeFirstKeyword: true;
		keepBlockInMessage: false;
		numberOfArgumentsForMultiLine: 1;
		indentsForKeywords: 0;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> noTraditionalBinaryPrecedenceConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
	indentStyle: #tabulation;
	formatCommentCloseToStatements:false;
	multiLineMessages:Array new;
	oneLineMessages:Array new;
	numberOfArgumentsForMultiLine:10;
	indentsForKeywords: 0;
	maxLineLength: 50;
	newLineBeforeFirstKeyword:false;
	keepBlockInMessage:false;
	useTraditionalBinaryPrecedenceForParentheses:false;
	traditionalBinaryPrecedenceArray: #(#($| $& $?) #($= $~ $< $>) #($- $+) #($* $/ $% $\) #($@));
	numberOfSpacesInsideParentheses: 0;
	indentExtraSpaces: 0
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> oneArgumentPerLineConfiguration [

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentCloseToStatements: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 1;
		indentsForKeywords: 0;
		maxLineLength: 50;
		newLineBeforeFirstKeyword: true;
		keepBlockInMessage: false;
		indentExtraSpaces: 0;
		numberOfSpacesInsideParentheses: 0;
		configureForTraditionalBinaryPrecedence 
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> oneIdentsForKeyWordConfiguration [

	^ self contextClass new
		newLineBeforeFirstKeyword: true;
		numberOfArgumentsForMultiLine: 1;
		indentsForKeywords: 1
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> oneLineMessageConfiguration [

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentCloseToStatements:false;
		multiLineMessages:Array new;
		oneLineMessages:#(#one:line:message:);
		numberOfArgumentsForMultiLine:2;
		indentsForKeywords: 0;
		maxLineLength: 50;
		newLineBeforeFirstKeyword:false;
		keepBlockInMessage:false;
		indentExtraSpaces: 0
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> parentheseConfiguration [

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentCloseToStatements:false;
		multiLineMessages:Array new;
		oneLineMessages:Array new;
		numberOfArgumentsForMultiLine:10;
		indentsForKeywords: 0;
		maxLineLength: 70;
		newLineBeforeFirstKeyword:false;
		keepBlockInMessage:false;
		indentExtraSpaces: 0;
		configureForTraditionalBinaryPrecedence;
		numberOfSpacesInsideParentheses: 0
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> shortMaxLineLengthConfiguration [

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentCloseToStatements:false;
		multiLineMessages:Array new;
		oneLineMessages:Array new;
		numberOfArgumentsForMultiLine:10;
		indentsForKeywords: 1;
		maxLineLength: 13;
		newLineBeforeFirstKeyword:false;
		keepBlockInMessage:false;
		indentExtraSpaces:0
]

{ #category : #'test binary' }
BIEnlumineurMessageExpressionTest >> testBinaryFormatParameter [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '1 + (3     factorial)'.
	self assert: source equals: '1 + 3 factorial'
]

{ #category : #'test binary' }
BIEnlumineurMessageExpressionTest >> testBinaryFormatReceiver [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: 'a:=''abc'' + 2'.
	self assert: source equals: 'a := ''abc'' + 2'
]

{ #category : #'test binary' }
BIEnlumineurMessageExpressionTest >> testBinaryMessageComments [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '1 + 1 "aComment"'.
	self assert: source equals: '1 + 1 "aComment"'
]

{ #category : #'test binary' }
BIEnlumineurMessageExpressionTest >> testBinaryMessageFormatCommentsWithStatement [
	| source |
	self flag: #toCheck. "Why would we lose the comment?"
	configurationSelector := #formatStatementsWithCommentsConfiguration.
	source := self formatExpression: '1 + 1 "aComment"'.
	self assert: source equals: '1 + 1'
]

{ #category : #'test binary' }
BIEnlumineurMessageExpressionTest >> testBinaryNoExtraSpacesAfter [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '1+2          '.
	self assert: source equals: '1 + 2'
]

{ #category : #'test binary' }
BIEnlumineurMessageExpressionTest >> testBinaryNoExtraSpacesBefore [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '   1+2'.
	self assert: source equals: '1 + 2'
]

{ #category : #'test binary' }
BIEnlumineurMessageExpressionTest >> testBinaryNoExtraSpacesBetween [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '1     +     2'.
	self assert: source equals: '1 + 2'
]

{ #category : #'test binary' }
BIEnlumineurMessageExpressionTest >> testBinaryOneArgumentPerLine [
	| source |
	configurationSelector := #oneArgumentPerLineConfiguration.
	source := self formatExpression: '1+2'.
	self
		assert: source
		equals:
'1
+ 2'
]

{ #category : #'test binary' }
BIEnlumineurMessageExpressionTest >> testBinaryOneArgumentPerLine2 [
	| source |
	configurationSelector := #oneArgumentPerLineConfiguration.
	source := self formatExpression: '(1+2)*3'.
	self
		assert: source
		equals: 
 '(1
 + 2)
* 3'		
]

{ #category : #'test block arg' }
BIEnlumineurMessageExpressionTest >> testBlockParameterOnTheMethodLineWhenMultiline [
	| source |
	configurationSelector := #keepBlockInMessageConfiguration.
	source := self
		formatExpression: '1 to: 10 do:[ :i | Transcript show:i. Transcript cr. Transcript cr]'.
	self
		assert: source
		equals:
'1 to: 10 do: [ :i | 
	Transcript show: i.
	Transcript cr.
	Transcript cr ]'
]

{ #category : #'test block arg' }
BIEnlumineurMessageExpressionTest >> testBlockParameterWhenTheLineWillBeTooLong [
	| source |
	configurationSelector := #blockInMessageTooLongConfiguration.
	source := self formatExpression: 'aMessage take:[ :i | i factorial]'.
	self
		assert: source
		equals: 
'aMessage take: [ :i | 
	i factorial ]'
]

{ #category : #'test block arg' }
BIEnlumineurMessageExpressionTest >> testBlockParameterWhenTheLineWillBeTooLong2 [
	| source |
	configurationSelector := #blockInMessageTooLongConfiguration.
	source := self formatExpression: 'aMessage take:[ :iiiiiiiiiiiiiii | i factorial]'.
	self
		assert: source
		equals:
'aMessage take: [ 
	:iiiiiiiiiiiiiii | 
	i factorial ]'
]

{ #category : #'test block arg' }
BIEnlumineurMessageExpressionTest >> testBlockParameterWhenTheLineWillNotBeTooLong [
	| source |
	configurationSelector := #blockInMessageConfiguration.
	source := self formatExpression: 'aMessage take:[ :i | i]'.
	self assert: source equals: 'aMessage take: [ :i | i ]'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testDontKeepBlockInMessage [
	| source |
	configurationSelector := #dontKeepBlockInMessageConfiguration.
	source := self
		formatExpression:
			'aBoolean ifTrue:[ :i | i := i factorial. Transcript show:i ]'.
	self
		assert: source
		equals:
'aBoolean ifTrue:
	[ :i | 
	i := i factorial.
	Transcript show: i ]'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testDontKeepBlockInMessage2 [
	| source |
	configurationSelector := #dontKeepBlockInMessageConfiguration.
	source := self
		formatExpression:
			'aBoolean ifTrue:[ :i | i ]'.
	self
		assert: source
		equals:
'aBoolean ifTrue: [ :i | i ]'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testDontKeepBlockInMessage3 [
	| source |
	configurationSelector := #dontKeepBlockInMessageConfiguration.
	source := self
		formatExpression:
			'aBoolean ifTrue:[ Transcript cr. Transcript cr ]'.
	self
		assert: source
		equals:
'aBoolean ifTrue:
	[ Transcript cr.
	Transcript cr ]'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testExtraIndentInParentheses [
	| source |
	configurationSelector := #blockAndParenthesesInMessageConfiguration.
	source := self formatExpression: '( [ :i | 	i factorial; +3 ] value: 15 )*3'.
	self assert: source equals:
'( [ :i | 
  i
	  factorial;
	  + 3 ] value: 15 ) * 3'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testExtraIndentInParenthesesWhenThreeSpacesInsideParentheses [
	| source |
	configurationSelector := #extraIndentWithThreeSpacesInsideParenthesesConfiguration.
	source := self formatExpression:'( [ :i | 	i factorial; +3 ] value: 15 )*3'.
	self assert: source equals:
'(   [ :i | 
    i
	    factorial;
	    + 3 ] value: 15   ) * 3'
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
BIEnlumineurMessageExpressionTest >> testKeepBlockInMessage [
	| source |
	configurationSelector := #keepBlockInMessageConfiguration.
	source := self
		formatExpression:
			'aBoolean ifTrue:[ :i | i := i factorial. Transcript show:i ]'.
	self
		assert: source
		equals:
'aBoolean ifTrue: [ :i | 
	i := i factorial.
	Transcript show: i ]'
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
'aBoolean ifTrue: [ 
	Transcript cr.
	Transcript cr.
	Transcript cr ]'
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
'aBoolean ifTrue: [ 
	12 factorial.
	12 factorial.
	3 factorial ]'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testKeepBlockInMessageNotMultilineSpace [
	| source |
	configurationSelector := #keepBlockInMessageConfiguration.
	source := self formatExpression: 'aBoolean ifTrue:[^1]'.
	self
		assert: source
		equals:
			'aBoolean ifTrue: [ ^1 ]'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testKeepBlockInMessageNotMutlilineNewLine [
	| source |
	configurationSelector := #littleMaxLineLengthConfiguration.
	source := self
		formatExpression: 'aBoolean ifTrue:[LongLongLongExpression]'.
	self
		assert: source
		equals:
			'aBoolean ifTrue: [ 
	LongLongLongExpression ]'
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordComments [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '1 between: 2"firstComment" and: 3 "secondComment"'.
	self assert: source equals: '1 between: 2 "firstComment" and: 3 "secondComment"'
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordCommentsFormatCommentsWithStatement [
	| source |
	self flag: #toCheck. "why no more comment." 
	configurationSelector := #formatStatementsWithCommentsConfiguration.
	source := self formatExpression: '1 between: 2"firstComment" and: 3 "secondComment"'.
	self assert: source equals: '1 between: 2 and: 3'
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordFormatParameter [
	| source |
	configurationSelector := #basicConfiguration.
	source := self
		formatExpression: '3 between:2      factorial and: 4+5'.
	self assert: source equals: '3 between: 2 factorial and: 4 + 5'
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordFormatReceiver [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '2 between: 4-2 and: 3     factorial'.
	self assert: source equals: '2 between: 4 - 2 and: 3 factorial'
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordFormatReceiver2 [
	| source |
	configurationSelector := #parentheseConfiguration.
	source := self formatExpression: '(2 between: 4-2 and: 3)     factorial'.
	self assert: source equals: '(2 between: 4 - 2 and: 3) factorial'
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordFormatReceiver3 [
	| source |
	configurationSelector := #parentheseConfiguration.
	source := self formatExpression: '(d at: 2)factorial'.
	self assert: source equals: '(d at: 2) factorial'
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordFormatReceiverAssignment [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: 'a:=''abc'' at: 2'.
	self assert: source equals: 'a := ''abc'' at: 2'
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordNoExtraSpacesAfter [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '2 between: 1 and: 3          '.
	self assert: source equals: '2 between: 1 and: 3'
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordNoExtraSpacesBefore [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '   2 between: 1 and: 3'.
	self assert: source equals: '2 between: 1 and: 3'
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordNoExtraSpacesBetween [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '2      between:     1   and:    3'.
	self assert: source equals: '2 between: 1 and: 3'
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordOnMultipleLine [
	| source |
	configurationSelector := #blockAndCascadeInMessageConfiguration.
	source := self formatExpression: '1 to: 100 by: 2 do: [ :i | transcript show: i;cr; cr]'.
	self assert: source equals:
'1 to: 100 by: 2 do: [ :i | 
	transcript
		show: i;
		cr;
		cr ]'
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordOnMultipleLine10 [
	| source |
	configurationSelector := #blockAndCascadeInMessageConfiguration.
	source := self formatExpression:
'foo
	bar: [ 
		1 + 2.
		2 + 2 ]
	bar3: 5.'.
	self assert: source equals:
'foo
	bar: [ 
		1 + 2.
		2 + 2 ]
	bar3: 5'
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordOnMultipleLine11 [
	| source |
	configurationSelector := #blockAndCascadeInMessageConfiguration.
	source := self formatExpression:
'foo bar3: 5 bar2: [ 
	1 + 1.
	2 + 2 ]'.
	self assert: source equals:
'foo bar3: 5 bar2: [ 
	1 + 1.
	2 + 2 ]'
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordOnMultipleLine12 [
	| source |
	configurationSelector := #blockAndCascadeInMessageConfiguration.
	source := self formatExpression:
'foo
	bar3: 5
	bar: [ 
		1 + 2.
		2 + 2 ]
	bar3: 5'.
	self assert: source equals:
'foo
	bar3: 5
	bar: [ 
		1 + 2.
		2 + 2 ]
	bar3: 5'
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordOnMultipleLine13 [
	| source |
	configurationSelector := #blockAndCascadeInMessageConfiguration.
	source := self formatExpression:
'foo bar3: 5 bar3: 5 bar2: [ 
	1 + 1.
	2 + 2 ]'.
	self assert: source equals:
'foo bar3: 5 bar3: 5 bar2: [ 
	1 + 1.
	2 + 2 ]'
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordOnMultipleLine14 [
	| source |
	configurationSelector := #blockAndCascadeInMessageConfiguration.
	source := self formatExpression:
'foo
	bar: [ 
		1 + 2.
		2 + 2 ]
	bar3: 5 
	bar3: 5'.
	self assert: source equals:
'foo
	bar: [ 
		1 + 2.
		2 + 2 ]
	bar3: 5
	bar3: 5'.
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordOnMultipleLine15 [
	| source |
	configurationSelector := #blockAndCascadeInMessageConfiguration.
	source := self formatExpression:
'self
		indent:
			(self do:[1. 2])
		around: [ 1. 2 ]'.
	self assert: source equals:
'self
	indent: (self do: [ 
			 1.
			 2 ])
	around: [ 
		1.
		2 ]'
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordOnMultipleLine2 [
	| source |
	configurationSelector := #ifTrueIfFalseMutlilineMessageConfiguration.
	source := self formatExpression: 'aBoolean ifTrue:[ ^ 1] ifFalse:[ tmp := tmp + a. ^tmp]'.
	self assert: source equals:
'aBoolean
	ifTrue: [ ^1 ]
	ifFalse: [ 
		tmp := tmp + a.
		^tmp ]'
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordOnMultipleLine3 [
	| source |
	configurationSelector := #blockAndCascadeInMessageConfiguration.
	source := self formatExpression: 'aBoolean ifTrue:[ tmp := tmp + a. ^ tmp] ifFalse:[ ^ 0 ]'.
	self assert: source equals:
'aBoolean
	ifTrue: [ 
		tmp := tmp + a.
		^ tmp ]
	ifFalse: [ ^ 0 ]'
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordOnMultipleLine4 [
	| source |
	configurationSelector := #blockAndCascadeInMessageConfiguration.
	source := self formatExpression: 'aBoolean ifTrue:[ tmp := tmp + a. ^ tmp] ifFalse:[ tmp := tmp + a. ^tmp]'.
	self assert: source equals:
'aBoolean
	ifTrue: [ 
		tmp := tmp + a.
		^ tmp ]
	ifFalse: [ 
		tmp := tmp + a.
		^ tmp ]'
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordOnMultipleLine5 [
	| source |
	configurationSelector := #blockAndCascadeInMessageConfiguration.
	source := self formatExpression: 'aBoolean ifTrue:[ ^ 1] ifFalse:[ tmp := tmp + a. ^tmp]'.
	self assert: source equals:
'aBoolean ifTrue: [ ^ 1 ] ifFalse: [ 
	tmp := tmp + a.
	^ tmp ]'
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordOnMultipleLine6 [
	| source |
	configurationSelector := #blockAndCascadeInMessageConfiguration.
	source := self formatExpression:
'foo 
	bar: [ 
		1 + 2.
		2 + 2 ]
	bar2: [ 
		1 + 1.
		2 + 2 ]
	bar3: 5'.
	self assert: source equals:
'foo
	bar: [ 
		1 + 2.
		2 + 2 ]
	bar2: [ 
		1 + 1.
		2 + 2 ]
	bar3: 5'
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordOnMultipleLine7 [
	| source |
	configurationSelector := #blockAndCascadeInMessageConfiguration.
	source := self formatExpression:
'foo 
	bar3: 5
	bar: [ 
		1 + 2.
		2 + 2 ]
	bar2: [ 
		1 + 1.
		2 + 2 ]'.
	self assert: source equals:
'foo
	bar3: 5
	bar: [ 
		1 + 2.
		2 + 2 ]
	bar2: [ 
		1 + 1.
		2 + 2 ]'
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordOnMultipleLine8 [
	| source |
	configurationSelector := #blockAndCascadeInMessageConfiguration.
	source := self formatExpression:
'foo
	bar: [ 
		1 + 2.
		2 + 2 ]
	bar3: 5
	bar2: [ 
		1 + 1.
		2 + 2 ]'.
	self assert: source equals:
'foo
	bar: [ 
		1 + 2.
		2 + 2 ]
	bar3: 5
	bar2: [ 
		1 + 1.
		2 + 2 ]'.
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordOnMultipleLine9 [
	| source |
	configurationSelector := #blockAndCascadeInMessageConfiguration.
	source := self formatExpression:
'foo
	bar3: 5
	bar: [ 
		1 + 2.
		2 + 2 ]
	bar2: [ 
		1 + 1.
		2 + 2 ]
	bar3: 5'.
	self assert: source equals:
'foo
	bar3: 5
	bar: [ 
		1 + 2.
		2 + 2 ]
	bar2: [ 
		1 + 1.
		2 + 2 ]
	bar3: 5'
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordOnTheSameLine [
	| source |
	configurationSelector := #blockInMessageConfiguration.
	source := self formatExpression: '1 to: 100 do: [ :i | Transcript show: i ]'.
	self assert: source equals: '1 to: 100 do: [ :i | Transcript show: i ]'
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordOnTheSameLine2 [
	| source |
	configurationSelector := #blockAndCascadeInMessageConfiguration.
	source := self formatExpression: '1 to: 100 by: 2 do: [ :i | Transcript show: i]'.
	self assert: source equals: '1 to: 100 by: 2 do: [ :i | Transcript show: i ]'
]

{ #category : #'tests keyword' }
BIEnlumineurMessageExpressionTest >> testKeywordOnTheSameLine3 [
	| source |
	configurationSelector := #blockAndCascadeInMessageConfiguration.
	source := self formatExpression: 'aBoolean ifTrue:[ ^ 1] ifFalse:[ ^ 0 ]'.
	self assert: source equals: 'aBoolean ifTrue: [ ^ 1 ] ifFalse: [ ^ 0 ]'
]

{ #category : #'tests keyword' }
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
			'2 between: 1 and: 3'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testNewLineBeforeFirstKeywordDoesntAffectBinary [
	| source |
	configurationSelector := #newLineBeforeFirstKeywordConfiguration.
	source := self formatExpression: '1+1'.
	self
		assert: source
		equals:'1 + 1'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testNewLineBeforeStatementsWhenMultilineBlock [
	| source |
	configurationSelector := #keepBlockInMessageConfiguration.
	source := self
		formatExpression:
			'x = 0 ifFalse: [ tan := y asFloat / x asFloat.
	theta := tan arcCos ]'.
	self
		assert: source
		equals:
'x = 0 ifFalse: [ 
	tan := y asFloat / x asFloat.
	theta := tan arcCos ]'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testNewLineWhenSelectorAndBeginingOfParametersWillBeTooLong [
	| source |
	configurationSelector := #blockAndParenthesesInMessageConfiguration.
	source := self formatExpression:
'(newLineBetweenArguments and: [ aMessageNode isKeyword ]) ifTrue: [ self
	indentsForKeywords ]
	ifFalse: [ 0 ]'.
	self assert: source equals:
'( newLineBetweenArguments and: [ aMessageNode isKeyword ] )
	ifTrue: [ self indentsForKeywords ]
	ifFalse: [ 0 ]'.
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
BIEnlumineurMessageExpressionTest >> testNoNewLineBetweenVariableAndIfTrue [
	| source |
	configurationSelector := #blockInMessageConfiguration.
	source := self formatExpression: 'x
		ifTrue: [ 
			  aBitBlt copyBitsColor: foreColorVal
				  alpha: foreColorAlpha
				  gammaTable: gammaTable
				  ungammaTable: gammaInverseTable ]'.
	self assert: source equals: 
'x ifTrue: [ 
	aBitBlt
		copyBitsColor: foreColorVal
		alpha: foreColorAlpha
		gammaTable: gammaTable
		ungammaTable: gammaInverseTable ]'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testNoNewLineForBeginingOfATooLongArgument [
	| source |
	configurationSelector := #basicConfiguration.
	source := self
		formatExpression: 'self parseMethod: 	''a
b'''.
	self assert: source equals: 'self parseMethod: ''a
b'''
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testNoNewLineForBeginingOfATooLongArgument2 [
	| source |
	configurationSelector := #basicConfiguration.
	source := self
		formatExpression: 'self
		parseMethod:
			''foo: abd bar: cde  
^ abd + cde'''.
	self assert: source equals:
'self parseMethod: ''foo: abd bar: cde  
^ abd + cde'''
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testNoTraditionalBinaryPrecedence [
	| source |
	configurationSelector := #noTraditionalBinaryPrecedenceConfiguration.
	source := self formatExpression: '2+3*4'.
	self assert: source equals: '2 + 3 * 4'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testNoTraditionalBinaryPrecedence2 [
	| source |
	configurationSelector := #noTraditionalBinaryPrecedenceConfiguration.
	source := self formatExpression: '(2 + 3) * 4'.
	self assert: source equals: '2 + 3 * 4'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testNoTraditionalBinaryPrecedence3 [
	| source |
	configurationSelector := #noTraditionalBinaryPrecedenceConfiguration.
	source := self formatExpression: '2+3*4+5 * 2'.
	self assert: source equals: '2 + 3 * 4 + 5 * 2'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testOneLineMessage [
	| source |
	configurationSelector := #oneLineMessageConfiguration.
	source := self formatExpression: 'foo one:1 line:2 message:3'.
	self assert: source equals: 'foo one: 1 line: 2 message: 3'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testSpacesInsideParentheses [
	| source |
	configurationSelector := #twoSpacesInsideParenthesesConfiguration.
	source := self formatExpression: '1+(2*3)'.
	self assert: source equals: '1 + (  2 * 3  )'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testTooLongArgument [
	| source |
	configurationSelector := #shortMaxLineLengthConfiguration.
	source := self formatExpression: 'foo message: TooLongArgument'.
	self
		assert: source
		equals:
'foo message:
	TooLongArgument'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testTooLongLineWithArgument [
	| source |
	configurationSelector := #shortMaxLineLengthConfiguration.
	source := self formatExpression: 'foo message: argument'.
	self
		assert: source
		equals:
'foo message:
	argument'
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

{ #category : #'test unary' }
BIEnlumineurMessageExpressionTest >> testUnaryFormatReceiver [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: 'a:=1 factorial'.
	self assert: source equals: 'a := 1 factorial'
]

{ #category : #'test unary' }
BIEnlumineurMessageExpressionTest >> testUnaryFormatReceiver2 [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: 'a:=1 factorial foo bar'.
	self assert: source equals: 'a := 1 factorial foo bar'
]

{ #category : #'test unary' }
BIEnlumineurMessageExpressionTest >> testUnaryMessageComments [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '1 factorial "aComment"'.
	self assert: source equals: '1 factorial "aComment"'
]

{ #category : #'test unary' }
BIEnlumineurMessageExpressionTest >> testUnaryMessageFormatCommentsWithStatement [
	| source |
	self flag: #toCheck. "why do we lose this comment"
	configurationSelector := #formatStatementsWithCommentsConfiguration.
	source := self formatExpression: '1 factorial "aComment"'.
	self assert: source equals: '1 factorial'
]

{ #category : #'test unary' }
BIEnlumineurMessageExpressionTest >> testUnaryNoExtraSpacesAfter [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: 'Transcript cr        '.
	self assert: source equals: 'Transcript cr'
]

{ #category : #'test unary' }
BIEnlumineurMessageExpressionTest >> testUnaryNoExtraSpacesAfter2 [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: 'Transcript cr cr cr       '.
	self assert: source equals: 'Transcript cr cr cr'
]

{ #category : #'test unary' }
BIEnlumineurMessageExpressionTest >> testUnaryNoExtraSpacesBefore [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '   Transcript cr'.
	self assert: source equals: 'Transcript cr'
]

{ #category : #'test unary' }
BIEnlumineurMessageExpressionTest >> testUnaryNoExtraSpacesBetween [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: 'Transcript        cr'.
	self assert: source equals: 'Transcript cr'
]

{ #category : #'test unary' }
BIEnlumineurMessageExpressionTest >> testUnaryNoExtraSpacesBetween2 [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: 'Transcript        cr cr       cr     cr'.
	self assert: source equals: 'Transcript cr cr cr cr'
]

{ #category : #'test unary' }
BIEnlumineurMessageExpressionTest >> testUnaryTooLongArgument [
	| source |
	configurationSelector := #shortMaxLineLengthConfiguration.
	source := self formatExpression: 'foo messageTooLongUnaryyyy'.
	self
		assert: source
		equals:
'foo
	messageTooLongUnaryyyy'
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> traditionalBinaryPrecedenceConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
	indentStyle: #tabulation;
	formatCommentCloseToStatements:false;
	multiLineMessages:Array new;
	oneLineMessages:Array new;
	numberOfArgumentsForMultiLine:10;
	indentsForKeywords: 0;
	maxLineLength: 50;
	newLineBeforeFirstKeyword:false;
	keepBlockInMessage:false;
	configureForTraditionalBinaryPrecedence;
	numberOfSpacesInsideParentheses: 0;
	indentExtraSpaces: 0
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> twoIdentsForKeyWordConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentCloseToStatements: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 1;
		indentsForKeywords: 2;
		maxLineLength: 50;
		newLineBeforeFirstKeyword: true;
		keepBlockInMessage: false;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> twoSpacesInsideParenthesesConfiguration [

	^ self contextClass basicNew
		numberOfSpacesInsideParentheses: 2;
		indentStyle: #tabulation;
		formatCommentCloseToStatements:false;
		multiLineMessages:Array new;
		oneLineMessages:Array new;
		numberOfArgumentsForMultiLine:10;
		indentsForKeywords: 0;
		maxLineLength: 50;
		newLineBeforeFirstKeyword:false;
		keepBlockInMessage:false;
		indentExtraSpaces: 0
]
