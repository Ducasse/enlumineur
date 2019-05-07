Class {
	#name : #BIMethodeValueExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #configuration }
BIMethodeValueExpressionTest >> oneArgumentPerLineConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
	numberOfArgumentsForMultiLine:1
]

{ #category : #tests }
BIMethodeValueExpressionTest >> testNoExtraSpacesAfter [

	| expr source |
	expr := RBParser parseExpression: 'Transcript cr        '.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'Transcript cr'
	
]

{ #category : #tests }
BIMethodeValueExpressionTest >> testNoExtraSpacesAfter2 [

	| expr source |
	expr := RBParser parseExpression: '1+2          '.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '1 + 2'
	
]

{ #category : #tests }
BIMethodeValueExpressionTest >> testNoExtraSpacesAfter3 [

	| expr source |
	expr := RBParser parseExpression: '2 between: 1 and: 3          '.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '2 between: 1 and: 3'
	
]

{ #category : #tests }
BIMethodeValueExpressionTest >> testNoExtraSpacesBefore [

	| expr source |
	expr := RBParser parseExpression: '   Transcript cr'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'Transcript cr'
	
]

{ #category : #tests }
BIMethodeValueExpressionTest >> testNoExtraSpacesBefore2 [

	| expr source |
	expr := RBParser parseExpression: '   1+2'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '1 + 2'
	
]

{ #category : #tests }
BIMethodeValueExpressionTest >> testNoExtraSpacesBefore3 [

	| expr source |
	expr := RBParser parseExpression: '   2 between: 1 and: 3'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '2 between: 1 and: 3'
	
]

{ #category : #tests }
BIMethodeValueExpressionTest >> testNoExtraSpacesBetween [

	| expr source |
	expr := RBParser parseExpression: 'Transcript        cr'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'Transcript cr'
	
]

{ #category : #tests }
BIMethodeValueExpressionTest >> testNoExtraSpacesBetween2 [

	| expr source |
	expr := RBParser parseExpression: '1     +     2'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '1 + 2'
	
]

{ #category : #tests }
BIMethodeValueExpressionTest >> testNoExtraSpacesBetween3 [

	| expr source |
	expr := RBParser parseExpression: '2      between:     1   and:    3'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '2 between: 1 and: 3'
	
]

{ #category : #tests }
BIMethodeValueExpressionTest >> testNoExtraSpacesBetween4 [

	| expr source |
	expr := RBParser parseExpression: '2           factorial              factorial'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '2 factorial factorial'
	
]

{ #category : #tests }
BIMethodeValueExpressionTest >> testOneArgumentPerLine [

	| expr source |
	expr := RBParser parseExpression: '2      between:     1   and:    3'.
	configurationSelector := #oneArgumentPerLineConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'2
	between: 1
	and: 3'
	
]
