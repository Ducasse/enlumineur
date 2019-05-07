Class {
	#name : #BISequenceExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #tests }
BISequenceExpressionTest >> noNewLinesAfterTemporariesConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
	newLinesAfterTemporaries:0
]

{ #category : #tests }
BISequenceExpressionTest >> testNewLineAfterTemporaries [
	| expr source |
	expr := RBParser parseExpression: '|a|'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a |
'
]

{ #category : #tests }
BISequenceExpressionTest >> testNewLineAfterTemporaries2 [
	| expr source |
	expr := RBParser parseExpression: '|a| a:=1'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a |
a := 1'
]

{ #category : #tests }
BISequenceExpressionTest >> testNoNewLineAfterTemporaries [
	| expr source |
	expr := RBParser parseExpression: '|a|'.
	configurationSelector := #noNewLinesAfterTemporariesConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a |'
]

{ #category : #tests }
BISequenceExpressionTest >> testNoNewLineAfterTemporaries2 [
	| expr source |
	expr := RBParser parseExpression: '|a| a:=1'.
	configurationSelector := #noNewLinesAfterTemporariesConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a |a := 1'
]

{ #category : #tests }
BISequenceExpressionTest >> testSpaceBetweenTemporaries [
	| expr source |
	expr := RBParser parseExpression: '|a|'.
	configurationSelector := #noNewLinesAfterTemporariesConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a |'
]

{ #category : #tests }
BISequenceExpressionTest >> testSpaceBetweenTemporaries2 [
	| expr source |
	expr := RBParser parseExpression: '|a b|'.
	configurationSelector := #noNewLinesAfterTemporariesConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |'
]
