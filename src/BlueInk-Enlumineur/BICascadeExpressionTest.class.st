Class {
	#name : #BICascadeExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #configurations }
BICascadeExpressionTest >> newLineAfterCascadeConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
		newLineAfterCascade: true;
		newLineBeforeFirstCascade: false.
]

{ #category : #configurations }
BICascadeExpressionTest >> newLineBeforeAndAfterCascadeConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
		newLineAfterCascade: true;
		newLineBeforeFirstCascade: true.
]

{ #category : #configurations }
BICascadeExpressionTest >> newLineBeforeCascadeConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
		newLineBeforeFirstCascade: true;
		newLineAfterCascade: false.
]

{ #category : #configurations }
BICascadeExpressionTest >> noNewLineAfterCascadeConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
		newLineAfterCascade: false.
]

{ #category : #configurations }
BICascadeExpressionTest >> noNewLineBeforeCascadeConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
		newLineBeforeFirstCascade: false.
]

{ #category : #tests }
BICascadeExpressionTest >> testFormatMessage [
	| expr source |
	expr := RBParser parseExpression: '1 *4; +1'.
	configurationSelector := #noNewLineAfterCascadeConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'1
	* 4; + 1'
]

{ #category : #tests }
BICascadeExpressionTest >> testFormatMessageAndArgument [
	| expr source |
	expr := RBParser parseExpression: '1 between:2 and:5; +1'.
	configurationSelector := #newLineBeforeAndAfterCascadeConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'1
	between: 2 and: 5;
	+ 1'
]

{ #category : #tests }
BICascadeExpressionTest >> testFormatMultilineMessage [
	| expr source |
	expr := RBParser parseExpression: '1 between:2 and:5; to:4 do:[:each| each factorial. each + 1]'.
	configurationSelector := #newLineBeforeAndAfterCascadeConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'1
	between: 2 and: 5;
	to: 4 do: [ :each | 
			each factorial.
			each + 1 ]'
]

{ #category : #tests }
BICascadeExpressionTest >> testFormatReceiver [
	| expr source |
	expr := RBParser parseExpression: '[1]value factorial; +1'.
	configurationSelector := #noNewLineAfterCascadeConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'[ 1 ] value
	factorial; + 1'
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
'Foo
	a; b; c'
]

{ #category : #tests }
BICascadeExpressionTest >> testNoNewLineAfterCascade2 [
	| expr source |
	expr := RBParser parseExpression: 'OrderedCollection new add: #a;add:#b;yourself'.
	configurationSelector := #noNewLineAfterCascadeConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'OrderedCollection new
	add: #a; add: #b; yourself'.
]

{ #category : #tests }
BICascadeExpressionTest >> testNoNewLineBeforeCascade [
	| expr source |
	expr := RBParser parseExpression: 'Foo a;b;c'.
	configurationSelector := #noNewLineBeforeCascadeConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'Foo a;
	b;
	c'.
]

{ #category : #tests }
BICascadeExpressionTest >> testNoNewLineBeforeCascade2 [
	| expr source |
	expr := RBParser parseExpression: 'OrderedCollection new add: #a;add:#b;yourself'.
	configurationSelector := #noNewLineBeforeCascadeConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'OrderedCollection new add: #a;
	add: #b;
	yourself'.
]
