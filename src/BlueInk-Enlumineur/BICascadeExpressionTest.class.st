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
	newLineAfterCascade: true.
]

{ #category : #configurations }
BICascadeExpressionTest >> newLineBeforeCascadeConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
	newLineBeforeFirstCascade: true.
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
BICascadeExpressionTest >> testNewLineAfterCascade [
	| expr source |
	expr := RBParser parseExpression: 'Foo a;b;c'.
	configurationSelector := #newLineAfterCascadeConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'Foo
	a;
	b;
	c'
]

{ #category : #tests }
BICascadeExpressionTest >> testNewLineBeforeCascade [
	| expr source |
	expr := RBParser parseExpression: 'Foo a;b;c'.
	configurationSelector := #newLineBeforeCascadeConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'Foo
	a;
	b;
	c'
]

{ #category : #tests }
BICascadeExpressionTest >> testNoNewLineAfterCascade [
	| expr source |
	expr := RBParser parseExpression: 'Foo a;b;c'.
	configurationSelector := #noNewLineAfterCascadeConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'Foo
	a; b; c'
]

{ #category : #tests }
BICascadeExpressionTest >> testNoNewLineBeforeCascade [
	| expr source |
	expr := RBParser parseExpression: 'Foo a;b;c'.
	configurationSelector := #noNewLineBeforeCascadeConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'Foo a;
	b;
	c'
]
