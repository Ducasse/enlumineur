Class {
	#name : #BILiteralExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #tests }
BILiteralExpressionTest >> noSpaceForTemporariesConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
		newLinesAfterTemporaries: 0.
]

{ #category : #tests }
BILiteralExpressionTest >> spaceForTemporariesConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
		newLinesAfterTemporaries: 0.
]

{ #category : #tests }
BILiteralExpressionTest >> testSpaces [

	| expr source |
	expr := RBParser parseExpression: '2'.
	configurationSelector := #noSpaceForTemporariesConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '2'
	
]
