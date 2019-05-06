Class {
	#name : #BICascadeExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #'as yet unclassified' }
BICascadeExpressionTest >> NewLineAfterCascadeConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
	newLineAfterCascade: true.
]

{ #category : #'as yet unclassified' }
BICascadeExpressionTest >> NewLineBeforeCascadeConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
	newLineBeforeFirstCascade: true.
]

{ #category : #'as yet unclassified' }
BICascadeExpressionTest >> NoNewLineAfterCascadeConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
	newLineAfterCascade: false.
]

{ #category : #'as yet unclassified' }
BICascadeExpressionTest >> NoNewLineBeforeCascadeConfiguration [
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
	configurationSelector := #NewLineAfterCascadeConfiguration.
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
	configurationSelector := #NewLineBeforeCascadeConfiguration.
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
	configurationSelector := #NoNewLineAfterCascadeConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'Foo
	a; b; c'
]

{ #category : #tests }
BICascadeExpressionTest >> testNoNewLineBeforeCascade [
	| expr source |
	expr := RBParser parseExpression: 'Foo a;b;c'.
	configurationSelector := #NoNewLineBeforeCascadeConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'Foo a;
	b;
	c'
]
