Class {
	#name : #BISequenceExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #configurations }
BISequenceExpressionTest >> dontRetainBlankLinesBetweenStatementsConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
	retainBlankLinesBetweenStatements: false.
]

{ #category : #configurations }
BISequenceExpressionTest >> retainBlankLinesBetweenStatementsConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
	retainBlankLinesBetweenStatements: true.
]

{ #category : #tests }
BISequenceExpressionTest >> testDontRetainBlankLines [
	| expr source |
	expr := RBParser parseExpression: '|a b| 
	
	a:=1.
	
	b:=a'.
	configurationSelector := #dontRetainBlankLinesBetweenStatementsConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |
a := 1.
b := a'
]

{ #category : #tests }
BISequenceExpressionTest >> testRetainBlankLines [
	| expr source |
	expr := RBParser parseExpression: '|a b| 
	
	a:=1.
	
	b:=a'.
	
	configurationSelector := #retainBlankLinesBetweenStatementsConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |
a := 1.

b := a'
]

{ #category : #tests }
BISequenceExpressionTest >> testRetainBlankLines2 [
	| expr source |
	expr := RBParser parseExpression: '|a b| 
	
	a:=1.
	
	
	b:=a'.
	configurationSelector := #retainBlankLinesBetweenStatementsConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |
a := 1.


b := a'
]

{ #category : #tests }
BISequenceExpressionTest >> testRetainBlankLines3 [
	| expr source |
	expr := RBParser parseExpression: '|a b| 
	
	a:=1.
	b:=a'.
	configurationSelector := #retainBlankLinesBetweenStatementsConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |
a := 1.
b := a'
]
