Class {
	#name : #BIEnlumineurCascadeExpressionTest,
	#superclass : #BIEnlumineurTest,
	#category : #'BlueInk-Enlumineur-Tests'
}

{ #category : #configurations }
BIEnlumineurCascadeExpressionTest >> basicConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:true;
		newLineBeforeFirstCascade: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine:3;
		maxLineLength:50;
		keepBlockInMessage:false;
		newLineAfterCascade:false;
		indentStyle: #tabulation;
		indentExtraSpaces:0;
		indentsForKeywords: 1
]

{ #category : #configurations }
BIEnlumineurCascadeExpressionTest >> multilineMessageConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		newLineAfterCascade: true;
		newLineBeforeFirstCascade: true;
		formatCommentWithStatements:false;
		multiLineMessages:#(#multi:line:);
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine:3;
		maxLineLength:50;
		keepBlockInMessage:true;
		indentStyle: #tabulation;
		newLineBeforeFirstKeyword:false;
		numberOfSpacesInsideBlock:1;
		retainBlankLinesBetweenStatements:false;
		minimumNewLinesBetweenStatements:1;
		indentsForKeywords:0;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets:false;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurCascadeExpressionTest >> newLineAfterCascadeConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

"	^ self contextClass new

"

	^ self contextClass basicNew
		newLineAfterCascade: true;
		newLineBeforeFirstCascade: false;
		formatCommentWithStatements:false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine:3;
		maxLineLength:50;
		keepBlockInMessage:false;
		indentStyle: #tabulation;
		newLineBeforeFirstKeyword:false;
		indentExtraSpaces: 0
]

{ #category : #configurations }
BIEnlumineurCascadeExpressionTest >> newLineBeforeAndAfterCascadeConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		newLineAfterCascade: true;
		newLineBeforeFirstCascade: true;
		formatCommentWithStatements:false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine:3;
		maxLineLength:50;
		keepBlockInMessage:false;
		indentStyle: #tabulation;
		newLineBeforeFirstKeyword:false;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurCascadeExpressionTest >> newLineBeforeCascadeConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"		

	^ self contextClass basicNew
		newLineAfterCascade: false;
		newLineBeforeFirstCascade: true;
		formatCommentWithStatements:false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine:3;
		maxLineLength:50;
		keepBlockInMessage:false;
		indentStyle: #tabulation;
		newLineBeforeFirstKeyword:false;
		indentExtraSpaces:0

]

{ #category : #configurations }
BIEnlumineurCascadeExpressionTest >> noNewLineAfterCascadeConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		newLineAfterCascade: false;
		newLineBeforeFirstCascade: false;
		formatCommentWithStatements:false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine:3;
		maxLineLength:50;
		keepBlockInMessage:false;
		indentStyle: #tabulation;
		newLineBeforeFirstKeyword:false;
		indentExtraSpaces: 0
]

{ #category : #configurations }
BIEnlumineurCascadeExpressionTest >> noNewLineBeforeCascadeConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		newLineAfterCascade: false;
		newLineBeforeFirstCascade: false;
		formatCommentWithStatements:false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine:3;
		maxLineLength:50;
		keepBlockInMessage:false;
		indentStyle: #tabulation;
		newLineBeforeFirstKeyword:false

]

{ #category : #configurations }
BIEnlumineurCascadeExpressionTest >> spaceIndentConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:false;
		newLineAfterCascade:true;
		newLineBeforeFirstCascade: true;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine:3;
		maxLineLength:50;
		keepBlockInMessage:false;
		numberOfSpacesInIndent: 1;
		indentStyle: #space;
		indentExtraSpaces:0
]

{ #category : #tests }
BIEnlumineurCascadeExpressionTest >> testCommentAfterMessages [
	| source |
	configurationSelector := #basicConfiguration.
	source := self
		formatExpression:
			'Transcript show:1 "firstComment";
	cr "secondComment";
	cr "thirdComment"'.
	self
		assert: source
		equals:
'Transcript show: 1; "secondComment"cr; "thirdComment"
		cr'
]

{ #category : #tests }
BIEnlumineurCascadeExpressionTest >> testCommentBeforeMessage [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: 'Transcript show:1; "cr" cr'.
	self
		assert: source
		equals:
			'Transcript show: 1; "cr"cr'
]

{ #category : #tests }
BIEnlumineurCascadeExpressionTest >> testFormatArgument [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '1 between:2 + 2 and:5*5; +1'.
	self assert: source equals: '1 between: 2 + 2 and: 5 * 5; + 1'
]

{ #category : #tests }
BIEnlumineurCascadeExpressionTest >> testFormatMessage [
	| source |
	configurationSelector := #noNewLineAfterCascadeConfiguration.
	source := self formatExpression: '1 *4; +1'.
	self assert: source equals: '1 * 4; + 1'
]

{ #category : #tests }
BIEnlumineurCascadeExpressionTest >> testFormatMultilineMessage [
	| source |
	configurationSelector := #multilineMessageConfiguration.
	source := self
		formatExpression: '1 between:2 and:5; to:4 do:[:each| each factorial. each + 1]'.
	self
		assert: source
		equals:
'1
	between: 2 and: 5;
	to: 4 do: [ :each | 
		each factorial.
		each + 1 ]'
]

{ #category : #tests }
BIEnlumineurCascadeExpressionTest >> testFormatMultilineMessage2 [
	| source |
	configurationSelector := #multilineMessageConfiguration.
	source := self formatExpression: '1 factorial; multi:1 line:2'.
	self
		assert: source
		equals:
'1
	factorial;
	multi: 1
		line: 2'
]

{ #category : #tests }
BIEnlumineurCascadeExpressionTest >> testFormatReceiver [
	| source |
	configurationSelector := #noNewLineAfterCascadeConfiguration.
	source := self formatExpression: 'a:=1 factorial; +1'.
	self assert: source equals: 'a := 1 factorial; + 1'
]

{ #category : #tests }
BIEnlumineurCascadeExpressionTest >> testNewLineAfterCascade [
	| source |
	configurationSelector := #newLineAfterCascadeConfiguration.
	source := self formatExpression: 'Foo a;b;c'.
	self
		assert: source
		equals:
			'Foo a;
	b;
	c'
]

{ #category : #tests }
BIEnlumineurCascadeExpressionTest >> testNewLineAfterCascade2 [
	| source |
	configurationSelector := #newLineAfterCascadeConfiguration.
	source := self
		formatExpression: 'OrderedCollection new add: #a;add:#b;yourself'.
	self
		assert: source
		equals:
			'OrderedCollection new add: #a;
	add: #b;
	yourself'
]

{ #category : #tests }
BIEnlumineurCascadeExpressionTest >> testNewLineBeforeAndAfterCascade [
	| source |
	configurationSelector := #newLineBeforeAndAfterCascadeConfiguration.
	source := self formatExpression: 'Transcript cr;cr;cr'.
	self
		assert: source
		equals:
			'Transcript
	cr;
	cr;
	cr'
]

{ #category : #tests }
BIEnlumineurCascadeExpressionTest >> testNewLineBeforeCascade [
	| source |
	configurationSelector := #newLineBeforeCascadeConfiguration.
	source := self formatExpression: 'Foo a;b;c'.
	self
		assert: source
		equals:
			'Foo
	a; b; c'
]

{ #category : #tests }
BIEnlumineurCascadeExpressionTest >> testNewLineBeforeCascade2 [
	| source |
	configurationSelector := #newLineBeforeCascadeConfiguration.
	source := self
		formatExpression: 'OrderedCollection new add: #a;add:#b;yourself'.
	self
		assert: source
		equals:
			'OrderedCollection new
	add: #a; add: #b; yourself'
]

{ #category : #tests }
BIEnlumineurCascadeExpressionTest >> testNoNewLineAfterCascade [
	| source |
	configurationSelector := #noNewLineAfterCascadeConfiguration.
	source := self formatExpression: 'Foo a;b;c'.
	self assert: source equals: 'Foo a; b; c'
]

{ #category : #tests }
BIEnlumineurCascadeExpressionTest >> testNoNewLineAfterCascade2 [
	| source |
	configurationSelector := #noNewLineAfterCascadeConfiguration.
	source := self
		formatExpression: 'OrderedCollection new add: #a;add:#b;yourself'.
	self
		assert: source
		equals: 'OrderedCollection new add: #a; add: #b; yourself'
]

{ #category : #tests }
BIEnlumineurCascadeExpressionTest >> testNoNewLineBeforeCascade [
	| source |
	configurationSelector := #noNewLineBeforeCascadeConfiguration.
	source := self formatExpression: 'Foo a;b;c'.
	self assert: source equals: 'Foo a; b; c'
]

{ #category : #tests }
BIEnlumineurCascadeExpressionTest >> testNoNewLineBeforeCascade2 [
	| source |
	configurationSelector := #noNewLineBeforeCascadeConfiguration.
	source := self
		formatExpression: 'OrderedCollection new add: #a;add:#b;yourself'.
	self
		assert: source
		equals: 'OrderedCollection new add: #a; add: #b; yourself'
]

{ #category : #tests }
BIEnlumineurCascadeExpressionTest >> testOneSpaceIndent [
	| source |
	configurationSelector := #spaceIndentConfiguration.
	source := self
		formatExpression:
			'Transcript show:1; cr; cr'.
	self
		assert: source
		equals:
'Transcript
 show: 1;
 cr;
 cr'
]

{ #category : #tests }
BIEnlumineurCascadeExpressionTest >> testTooLongArgument [
	| source |
	configurationSelector := #tooLongArgumentConfiguration.
	source := self formatExpression: 'foo a;b: toLongArgument'.
	self
		assert: source
		equals:
'foo a; b:
	toLongArgument'
]

{ #category : #tests }
BIEnlumineurCascadeExpressionTest >> testTooLongArgument2 [
	| source |
	configurationSelector := #tooLongArgumentConfigurationWithNewLineAfterCascade.
	source := self formatExpression: 'foo a;b: toLongArgument'.
	self
		assert: source
		equals:
'foo a;
	b:
	toLongArgument'
]

{ #category : #configurations }
BIEnlumineurCascadeExpressionTest >> tooLongArgumentConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:true;
		newLineBeforeFirstCascade: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine:3;
		maxLineLength:10;
		keepBlockInMessage:false;
		newLineAfterCascade:false;
		indentStyle: #tabulation;
		indentExtraSpaces:0
]

{ #category : #configurations }
BIEnlumineurCascadeExpressionTest >> tooLongArgumentConfigurationWithNewLineAfterCascade [
	^ self contextClass basicNew
		formatCommentWithStatements:true;
		newLineBeforeFirstCascade: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine:3;
		maxLineLength:10;
		keepBlockInMessage:false;
		newLineAfterCascade:true;
		indentStyle: #tabulation;
		indentExtraSpaces:0
]
