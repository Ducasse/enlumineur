Class {
	#name : #BILiteralValueExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #configurations }
BILiteralValueExpressionTest >> noSpaceForTemporariesConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
		newLinesAfterTemporaries: 0.
]

{ #category : #configurations }
BILiteralValueExpressionTest >> spaceForTemporariesConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
		newLinesAfterTemporaries: 0.
]

{ #category : #tests }
BILiteralValueExpressionTest >> testSpaces [

	| expr source |
	expr := RBParser parseExpression: '2'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '2'
	
]
