Class {
	#name : #BIMessageExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #configurations }
BIMessageExpressionTest >> oneArgumentPerLineConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
	numberOfArgumentsForMultiLine:1
]

{ #category : #tests }
BIMessageExpressionTest >> testNoExtraSpacesAfter [

	| expr source |
	expr := RBParser parseExpression: 'Transcript cr        '.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'Transcript cr'
	
]

{ #category : #tests }
BIMessageExpressionTest >> testNoExtraSpacesAfter2 [

	| expr source |
	expr := RBParser parseExpression: '1+2          '.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '1 + 2'
	
]

{ #category : #tests }
BIMessageExpressionTest >> testNoExtraSpacesAfter3 [

	| expr source |
	expr := RBParser parseExpression: '2 between: 1 and: 3          '.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '2 between: 1 and: 3'
	
]

{ #category : #tests }
BIMessageExpressionTest >> testNoExtraSpacesBefore [

	| expr source |
	expr := RBParser parseExpression: '   Transcript cr'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'Transcript cr'
	
]

{ #category : #tests }
BIMessageExpressionTest >> testNoExtraSpacesBefore2 [

	| expr source |
	expr := RBParser parseExpression: '   1+2'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '1 + 2'
	
]

{ #category : #tests }
BIMessageExpressionTest >> testNoExtraSpacesBefore3 [

	| expr source |
	expr := RBParser parseExpression: '   2 between: 1 and: 3'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '2 between: 1 and: 3'
	
]

{ #category : #tests }
BIMessageExpressionTest >> testNoExtraSpacesBetween [

	| expr source |
	expr := RBParser parseExpression: 'Transcript        cr'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'Transcript cr'
	
]

{ #category : #tests }
BIMessageExpressionTest >> testNoExtraSpacesBetween2 [

	| expr source |
	expr := RBParser parseExpression: '1     +     2'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '1 + 2'
	
]

{ #category : #tests }
BIMessageExpressionTest >> testNoExtraSpacesBetween3 [

	| expr source |
	expr := RBParser parseExpression: '2      between:     1   and:    3'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '2 between: 1 and: 3'
	
]

{ #category : #tests }
BIMessageExpressionTest >> testNoExtraSpacesBetween4 [

	| expr source |
	expr := RBParser parseExpression: '2           factorial              factorial'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '2 factorial factorial'
	
]

{ #category : #tests }
BIMessageExpressionTest >> testOneArgumentPerLine [

	| expr source |
	expr := RBParser parseExpression: '2      between:     1   and:    3'.
	configurationSelector := #oneArgumentPerLineConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'2
	between: 1
	and: 3'
]

{ #category : #tests }
BIMessageExpressionTest >> testOneArgumentPerLine2 [

	| expr source |
	expr := RBParser parseExpression: '1+2'.
	configurationSelector := #oneArgumentPerLineConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'1
	+ 2'
]
