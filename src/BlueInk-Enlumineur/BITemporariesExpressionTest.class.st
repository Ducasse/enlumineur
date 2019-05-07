Class {
	#name : #BITemporariesExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #tests }
BITemporariesExpressionTest >> newLinesAfterTemporariesConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
		newLinesAfterTemporaries: 1.
]

{ #category : #tests }
BITemporariesExpressionTest >> noNewLinesAfterTemporariesConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
		newLinesAfterTemporaries: 0.
]

{ #category : #tests }
BITemporariesExpressionTest >> spaceForTemporariesConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
		newLinesAfterTemporaries: 0.
]

{ #category : #tests }
BITemporariesExpressionTest >> testNewLineAfterTemporaries [

	| expr source |
	expr := RBParser parseExpression: ' |d e|'.
	configurationSelector := #newLinesAfterTemporariesConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| d e |
'
	
]

{ #category : #tests }
BITemporariesExpressionTest >> testNoNewLineAfterTemporaries [

	| expr source |
	expr := RBParser parseExpression: ' |d e|'.
	configurationSelector := #noNewLinesAfterTemporariesConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| d e |'
	
]

{ #category : #tests }
BITemporariesExpressionTest >> testSpaceBetweenTemporaries [
	| expr source |
	expr := RBParser parseExpression: '|a|'.
	configurationSelector := #noNewLinesAfterTemporariesConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a |'
]

{ #category : #tests }
BITemporariesExpressionTest >> testSpaceBetweenTemporaries2 [
	| expr source |
	expr := RBParser parseExpression: '|a b|'.
	configurationSelector := #noNewLinesAfterTemporariesConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |'
]
