Class {
	#name : #BITemporariesExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #tests }
BITemporariesExpressionTest >> spaceForTemporariesConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
		newLinesAfterTemporaries: 0.
]

{ #category : #tests }
BITemporariesExpressionTest >> testTemporaries [

	| expr source |
	expr := RBParser parseExpression: ' |d e|'.
	configurationSelector := #spaceForTemporariesConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '| d e |'
	
]
