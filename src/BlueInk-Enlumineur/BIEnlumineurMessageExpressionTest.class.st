Class {
	#name : #BIEnlumineurMessageExpressionTest,
	#superclass : #BIEnlumineurTest,
	#category : #'BlueInk-Enlumineur-Tests'
}

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> basicConfiguration [

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false;
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
		formatCommentWithStatements: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 10;
		indentsForKeywords: 1;
		maxLineLength: 70;
		newLineBeforeFirstKeyword: false;
		keepBlockInMessage: true;
		numberOfSpacesInsideBlock: 1;
		numberOfSpacesAfterCaretSymbolInReturn: 1;
		periodsAtEndOfBlock: false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets: false;
		retainBlankLinesBetweenStatements: false;
		minimumNewLinesBetweenStatements: 1;
		indentExtraSpaces:0;
		newLineBeforeFirstCascade: true;
		numberOfSpacesInsideParentheses: 1 ;
		newLineAfterCascade: true
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> blockAndParenthesesInMessageConfiguration [
	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 10;
		indentsForKeywords: 1;
		maxLineLength: 70;
		newLineBeforeFirstKeyword: true;
		keepBlockInMessage: true;
		numberOfSpacesInsideBlock: 1;
		numberOfSpacesAfterCaretSymbolInReturn: 0;
		periodsAtEndOfBlock: false;
		periodsAtEndOfMethod: false;
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
		formatCommentWithStatements: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 10;
		indentsForKeywords: 1;
		maxLineLength: 70;
		newLineBeforeFirstKeyword: true;
		keepBlockInMessage: true;
		numberOfSpacesInsideBlock: 1;
		numberOfSpacesAfterCaretSymbolInReturn: 0;
		periodsAtEndOfBlock: false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets: false;
		retainBlankLinesBetweenStatements: false;
		minimumNewLinesBetweenStatements: 1;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> blockInMessageTooLongConfiguration [
	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 10;
		indentsForKeywords: 1;
		maxLineLength: 20;
		newLineBeforeFirstKeyword: true;
		keepBlockInMessage: true;
		numberOfSpacesInsideBlock: 1;
		numberOfSpacesAfterCaretSymbolInReturn: 0;
		periodsAtEndOfBlock: false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets: false;
		retainBlankLinesBetweenStatements: false;
		minimumNewLinesBetweenStatements: 1;
		indentExtraSpaces: 0
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> dontKeepBlockInMessageConfiguration [
	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 10;
		indentsForKeywords: 1;
		maxLineLength: 70;
		newLineBeforeFirstKeyword: true;
		keepBlockInMessage: false;
		numberOfSpacesInsideBlock: 1;
		numberOfSpacesAfterCaretSymbolInReturn: 0;
		periodsAtEndOfBlock: false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets: false;
		retainBlankLinesBetweenStatements: false;
		minimumNewLinesBetweenStatements: 1;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> extraIndentWithThreeSpacesInsideParenthesesConfiguration [
	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 10;
		indentsForKeywords: 0;
		maxLineLength: 70;
		newLineBeforeFirstKeyword: false;
		keepBlockInMessage: true;
		numberOfSpacesInsideBlock: 1;
		numberOfSpacesAfterCaretSymbolInReturn: 0;
		periodsAtEndOfBlock: false;
		periodsAtEndOfMethod: false;
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
BIEnlumineurMessageExpressionTest >> ifTrueIfFalseMutlilineMessageConfiguration [
	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements: false;
		multiLineMessages:#(#ifTrue:ifFalse:);
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 10;
		indentsForKeywords: 1;
		maxLineLength: 70;
		newLineBeforeFirstKeyword: true;
		keepBlockInMessage: true;
		numberOfSpacesInsideBlock: 1;
		numberOfSpacesAfterCaretSymbolInReturn: 0;
		periodsAtEndOfBlock: false;
		periodsAtEndOfMethod: false;
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
		formatCommentWithStatements: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 10;
		indentsForKeywords: 1;
		maxLineLength: 70;
		newLineBeforeFirstKeyword: true;
		keepBlockInMessage: true;
		numberOfSpacesInsideBlock: 1;
		numberOfSpacesAfterCaretSymbolInReturn: 0;
		periodsAtEndOfBlock: false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets: false;
		retainBlankLinesBetweenStatements: false;
		minimumNewLinesBetweenStatements: 1;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> littleMaxLineLengthConfiguration [
	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 10;
		indentsForKeywords: 1;
		maxLineLength: 20;
		newLineBeforeFirstKeyword: true;
		keepBlockInMessage: true;
		numberOfSpacesInsideBlock: 1;
		numberOfSpacesAfterCaretSymbolInReturn: 0;
		periodsAtEndOfBlock: false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets: false;
		retainBlankLinesBetweenStatements: false;
		minimumNewLinesBetweenStatements: 1;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> multiLineMessageConfiguration [
	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements: false;
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
		formatCommentWithStatements:false;
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
		formatCommentWithStatements: false;
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
	formatCommentWithStatements:false;
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
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine: 1;
		indentsForKeywords: 0;
		maxLineLength: 50;
		newLineBeforeFirstKeyword: true;
		keepBlockInMessage: false;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> oneIdentsForKeyWordConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
		newLineBeforeFirstKeyword: true;
		numberOfArgumentsForMultiLine: 1;
		indentsForKeywords: 1
]

{ #category : #configurations }
BIEnlumineurMessageExpressionTest >> oneLineMessageConfiguration [

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false;
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
BIEnlumineurMessageExpressionTest >> shortMaxLineLengthConfiguration [

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentWithStatements:false;
		multiLineMessages:Array new;
		oneLineMessages:Array new;
		numberOfArgumentsForMultiLine:10;
		indentsForKeywords: 1;
		maxLineLength: 13;
		newLineBeforeFirstKeyword:false;
		keepBlockInMessage:false;
		indentExtraSpaces:0
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
'1
+ 2'
]

{ #category : #tests }
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

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testBlockParameterWhenTheLineWillBeTooLong [
	| source |
	configurationSelector := #blockInMessageTooLongConfiguration.
	source := self formatExpression: 'aMessage take:[ :i | i]'.
	self
		assert: source
		equals: 
'aMessage take:
	[ :i | i ]'
]

{ #category : #tests }
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

{ #category : #tests }
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

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testKeywordOnMultipleLine3 [
	| source |
	configurationSelector := #blockAndCascadeInMessageConfiguration.
	source := self formatExpression: 'aBoolean ifTrue:[ tmp := tmp + a. ^ tmp] ifFalse:[ ^ 0 ]'.
	self assert: source equals:
'aBoolean ifTrue: [ 
		tmp := tmp + a.
		^ tmp ]
	ifFalse: [ ^ 0 ]'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testKeywordOnMultipleLine4 [
	| source |
	configurationSelector := #blockAndCascadeInMessageConfiguration.
	source := self formatExpression: 'aBoolean ifTrue:[ tmp := tmp + a. ^ tmp] ifFalse:[ tmp := tmp + a. ^tmp]'.
	self assert: source equals:
'aBoolean ifTrue: [ 
		tmp := tmp + a.
		^ tmp ]
	ifFalse: [ 
		tmp := tmp + a.
		^ tmp ]'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testKeywordOnMultipleLine5 [
	| source |
	configurationSelector := #blockAndCascadeInMessageConfiguration.
	source := self formatExpression: 'aBoolean ifTrue:[ ^ 1] ifFalse:[ tmp := tmp + a. ^tmp]'.
	self assert: source equals:
'aBoolean ifTrue: [ ^ 1 ] ifFalse: [ 
	tmp := tmp + a.
	^ tmp ]'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testKeywordOnTheSameLine [
	| source |
	configurationSelector := #blockInMessageConfiguration.
	source := self formatExpression: '1 to: 100 do: [ :i | transcript show: i ]'.
	self assert: source equals: '1 to: 100 do: [ :i | transcript show: i ]'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testKeywordOnTheSameLine2 [
	| source |
	configurationSelector := #blockAndCascadeInMessageConfiguration.
	source := self formatExpression: '1 to: 100 by: 2 do: [ :i | transcript show: i]'.
	self assert: source equals: '1 to: 100 by: 2 do: [ :i | transcript show: i ]'
]

{ #category : #tests }
BIEnlumineurMessageExpressionTest >> testKeywordOnTheSameLine3 [
	| source |
	configurationSelector := #blockAndCascadeInMessageConfiguration.
	source := self formatExpression: 'aBoolean ifTrue:[ ^ 1] ifFalse:[ ^ 0 ]'.
	self assert: source equals: 'aBoolean ifTrue: [ ^ 1 ] ifFalse: [ ^ 0 ]'
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

{ #category : #tests }
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
		formatCommentWithStatements: false;
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
		formatCommentWithStatements:false;
		multiLineMessages:Array new;
		oneLineMessages:Array new;
		numberOfArgumentsForMultiLine:10;
		indentsForKeywords: 0;
		maxLineLength: 50;
		newLineBeforeFirstKeyword:false;
		keepBlockInMessage:false;
		indentExtraSpaces: 0
]
