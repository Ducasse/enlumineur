Class {
	#name : #BICascadeExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #configurations }
BICascadeExpressionTest >> basicConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:true;
		newLineBeforeFirstCascade: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine:3;
		maxLineLength:50;
		keepBlockInMessage:false;
		newLineAfterCascade:false;
		indentString: '	'
]

{ #category : #configurations }
BICascadeExpressionTest >> multilineMessageConfiguration [
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
		indentString: '	';
		newLineBeforeFirstKeyword:false;
		stringInsideBlocks: ' ';
		retainBlankLinesBetweenStatements:false;
		minimumNewLinesBetweenStatements:1;
		indentsForKeywords:0;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets:false
]

{ #category : #configurations }
BICascadeExpressionTest >> newLineAfterCascadeConfiguration [
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
		indentString: '	';
		newLineBeforeFirstKeyword:false
]

{ #category : #configurations }
BICascadeExpressionTest >> newLineBeforeAndAfterCascadeConfiguration [
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
		indentString: '	';
		newLineBeforeFirstKeyword:false
]

{ #category : #configurations }
BICascadeExpressionTest >> newLineBeforeCascadeConfiguration [
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
		indentString: '	';
		newLineBeforeFirstKeyword:false

]

{ #category : #configurations }
BICascadeExpressionTest >> noNewLineAfterCascadeConfiguration [
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
		indentString: '	';
		newLineBeforeFirstKeyword:false
]

{ #category : #configurations }
BICascadeExpressionTest >> noNewLineBeforeCascadeConfiguration [
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
		indentString: '	';
		newLineBeforeFirstKeyword:false

]

{ #category : #tests }
BICascadeExpressionTest >> testCommentAfterMessages [
	| expr source |
	expr := RBParser parseExpression: 'Transcript show:1 "firstComment";
	cr "secondComment";
	cr "thirdComment"'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'Transcript show: 1; "secondComment"
		cr; "thirdComment"
		cr'
]

{ #category : #tests }
BICascadeExpressionTest >> testCommentBeforeMessage [
	| expr source |
	expr := RBParser parseExpression: 'Transcript show:1; "cr" cr'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'Transcript show: 1; "cr"
		cr'
]

{ #category : #tests }
BICascadeExpressionTest >> testFormatMessage [
	| expr source |
	expr := RBParser parseExpression: '1 *4; +1'.
	configurationSelector := #noNewLineAfterCascadeConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'1 * 4; + 1'
]

{ #category : #tests }
BICascadeExpressionTest >> testFormatMessageAndArgument [
	| expr source |
	expr := RBParser parseExpression: '1 between:2 and:5; +1'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'1 between: 2 and: 5; + 1'
]

{ #category : #tests }
BICascadeExpressionTest >> testFormatMultilineMessage [
	| expr source |
	expr := RBParser parseExpression: '1 between:2 and:5; to:4 do:[:each| each factorial. each + 1]'.
	configurationSelector := #multilineMessageConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'1 between: 2 and: 5; to: 4
		do:
		[ :each | 
		each factorial.
		each + 1 ]'
]

{ #category : #tests }
BICascadeExpressionTest >> testFormatReceiver [
	| expr source |
	expr := RBParser parseExpression: 'a:=1 factorial; +1'.
	configurationSelector := #noNewLineAfterCascadeConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'a := 1 factorial; + 1'
]

{ #category : #tests }
BICascadeExpressionTest >> testNewLineAfterCascade [
	| expr source |
	expr := RBParser parseExpression: 'Foo a;b;c'.
	configurationSelector := #newLineAfterCascadeConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'Foo a;
	b;
	c'
]

{ #category : #tests }
BICascadeExpressionTest >> testNewLineAfterCascade2 [
	| expr source |
	expr := RBParser parseExpression: 'OrderedCollection new add: #a;add:#b;yourself'.
	configurationSelector := #newLineAfterCascadeConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 
'OrderedCollection new add: #a;
	add: #b;
	yourself'
]

{ #category : #tests }
BICascadeExpressionTest >> testNewLineBeforeAndAfterCascade [
	| expr source |
	expr := RBParser parseExpression: 'Transcript cr;cr;cr'.
	configurationSelector := #newLineBeforeAndAfterCascadeConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'Transcript
	cr;
	cr;
	cr'
]

{ #category : #tests }
BICascadeExpressionTest >> testNewLineBeforeCascade [
	| expr source |
	expr := RBParser parseExpression: 'Foo a;b;c'.
	configurationSelector := #newLineBeforeCascadeConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 
'Foo
	a; b; c'
]

{ #category : #tests }
BICascadeExpressionTest >> testNewLineBeforeCascade2 [
	| expr source |
	expr := RBParser parseExpression: 'OrderedCollection new add: #a;add:#b;yourself'.
	configurationSelector := #newLineBeforeCascadeConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 
'OrderedCollection new
	add: #a; add: #b; yourself'
]

{ #category : #tests }
BICascadeExpressionTest >> testNoNewLineAfterCascade [
	| expr source |
	expr := RBParser parseExpression: 'Foo a;b;c'.
	configurationSelector := #noNewLineAfterCascadeConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'Foo a; b; c'
]

{ #category : #tests }
BICascadeExpressionTest >> testNoNewLineAfterCascade2 [
	| expr source |
	expr := RBParser parseExpression: 'OrderedCollection new add: #a;add:#b;yourself'.
	configurationSelector := #noNewLineAfterCascadeConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'OrderedCollection new add: #a; add: #b; yourself'.
]

{ #category : #tests }
BICascadeExpressionTest >> testNoNewLineBeforeCascade [
	| expr source |
	expr := RBParser parseExpression: 'Foo a;b;c'.
	configurationSelector := #noNewLineBeforeCascadeConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'Foo a; b; c'.
]

{ #category : #tests }
BICascadeExpressionTest >> testNoNewLineBeforeCascade2 [
	| expr source |
	expr := RBParser parseExpression: 'OrderedCollection new add: #a;add:#b;yourself'.
	configurationSelector := #noNewLineBeforeCascadeConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'OrderedCollection new add: #a; add: #b; yourself'.
]
