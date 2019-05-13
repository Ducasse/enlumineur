Class {
	#name : #BIMessageExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #configurations }
BIMessageExpressionTest >> noIdentsForKeyWordConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
	numberOfArgumentsForMultiLine:1;
	indentsForKeywords: 0
]

{ #category : #configurations }
BIMessageExpressionTest >> oneArgumentPerLineConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
	numberOfArgumentsForMultiLine:1
]

{ #category : #configurations }
BIMessageExpressionTest >> oneIdentsForKeyWordConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
	numberOfArgumentsForMultiLine:1;
	indentsForKeywords: 1
]

{ #category : #tests }
BIMessageExpressionTest >> testBinaryFormatParameter [

	| expr source |
	expr := RBParser parseExpression: '1 + (3     factorial)'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '1 + 3 factorial'
	
]

{ #category : #tests }
BIMessageExpressionTest >> testBinaryFormatReceiver [

	| expr source |
	expr := RBParser parseExpression: '[:a|a] value: 2'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '[ :a | a ] value: 2'
	
]

{ #category : #tests }
BIMessageExpressionTest >> testBinaryNoExtraSpacesAfter [

	| expr source |
	expr := RBParser parseExpression: '1+2          '.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '1 + 2'
	
]

{ #category : #tests }
BIMessageExpressionTest >> testBinaryNoExtraSpacesBefore [

	| expr source |
	expr := RBParser parseExpression: '   1+2'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '1 + 2'
	
]

{ #category : #tests }
BIMessageExpressionTest >> testBinaryNoExtraSpacesBetween [

	| expr source |
	expr := RBParser parseExpression: '1     +     2'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '1 + 2'
	
]

{ #category : #tests }
BIMessageExpressionTest >> testBinaryOneArgumentPerLine [

	| expr source |
	expr := RBParser parseExpression: '1+2'.
	configurationSelector := #oneArgumentPerLineConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'1
	+ 2'
]

{ #category : #tests }
BIMessageExpressionTest >> testIndentsForKeywords1 [

	| expr source |
	expr := RBParser parseExpression: 'a k1:1 k2:2 k3:3'.
	configurationSelector := #oneIdentsForKeyWordConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'a
	k1: 1
	k2: 2
	k3: 3'
	
]

{ #category : #tests }
BIMessageExpressionTest >> testIndentsForKeywords2 [

	| expr source |
	expr := RBParser parseExpression: 'a k1:1 k2:2 k3:3'.
	configurationSelector := #twoIdentsForKeyWordConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'a
		k1: 1
		k2: 2
		k3: 3'
	
]

{ #category : #tests }
BIMessageExpressionTest >> testKeyWordFormatReceiver [

	| expr source |
	expr := RBParser parseExpression: '2 between: 4-2 and: 3     factorial'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'2 between: 4 - 2 and: 3 factorial'
]

{ #category : #tests }
BIMessageExpressionTest >> testKeywordFormatParameter [

	| expr source |
	expr := RBParser parseExpression: '3 between:2      factorial and: 4+5'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '3 between: 2 factorial and: 4 + 5'
	
]

{ #category : #tests }
BIMessageExpressionTest >> testKeywordNoExtraSpacesAfter [

	| expr source |
	expr := RBParser parseExpression: '2 between: 1 and: 3          '.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '2 between: 1 and: 3'
	
]

{ #category : #tests }
BIMessageExpressionTest >> testKeywordNoExtraSpacesBefore [

	| expr source |
	expr := RBParser parseExpression: '   2 between: 1 and: 3'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '2 between: 1 and: 3'
	
]

{ #category : #tests }
BIMessageExpressionTest >> testKeywordNoExtraSpacesBetween [

	| expr source |
	expr := RBParser parseExpression: '2      between:     1   and:    3'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '2 between: 1 and: 3'
	
]

{ #category : #tests }
BIMessageExpressionTest >> testKeywordOneArgumentPerLine [

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
BIMessageExpressionTest >> testNoIndentsForKeywords [

	| expr source |
	expr := RBParser parseExpression: 'a k1:1 k2:2 k3:3'.
	configurationSelector := #noIdentsForKeyWordConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'a
k1: 1
k2: 2
k3: 3'	
]

{ #category : #tests }
BIMessageExpressionTest >> testTraditionalBinaryPrecedence [

	| expr source |
	expr := RBParser parseExpression: '2+3*4'.
	configurationSelector := #traditionalBinaryPrecedenceConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '(2 + 3) * 4'
]

{ #category : #tests }
BIMessageExpressionTest >> testTraditionalBinaryPrecedence2 [

	| expr source |
	expr := RBParser parseExpression: '2*3+4'.
	configurationSelector := #traditionalBinaryPrecedenceConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '2 * 3 + 4'
]

{ #category : #tests }
BIMessageExpressionTest >> testTraditionalBinaryPrecedence3 [

	| expr source |
	expr := RBParser parseExpression: '2+3*4+5 * 2'.
	configurationSelector := #traditionalBinaryPrecedenceConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '((2 + 3) * 4 + 5) * 2'
]

{ #category : #tests }
BIMessageExpressionTest >> testUnaryFormatReceiver [

	| expr source |
	expr := RBParser parseExpression: '[1] value'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '[ 1 ] value'
	
]

{ #category : #tests }
BIMessageExpressionTest >> testUnaryNoExtraSpacesAfter [

	| expr source |
	expr := RBParser parseExpression: 'Transcript cr        '.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'Transcript cr'
	
]

{ #category : #tests }
BIMessageExpressionTest >> testUnaryNoExtraSpacesBefore [

	| expr source |
	expr := RBParser parseExpression: '   Transcript cr'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'Transcript cr'
	
]

{ #category : #tests }
BIMessageExpressionTest >> testUnaryNoExtraSpacesBetween [

	| expr source |
	expr := RBParser parseExpression: 'Transcript        cr'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: 'Transcript cr'
	
]

{ #category : #tests }
BIMessageExpressionTest >> testUnaryNoExtraSpacesBetween2 [

	| expr source |
	expr := RBParser parseExpression: '2           factorial              factorial'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '2 factorial factorial'
	
]

{ #category : #configurations }
BIMessageExpressionTest >> traditionalBinaryPrecedenceConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
	traditionalBinaryPrecedenceArray: #(#($| $& $?) #($= $~ $< $>) #($- $+) #($* $/ $% $\) #($@))
]

{ #category : #configurations }
BIMessageExpressionTest >> twoIdentsForKeyWordConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
	numberOfArgumentsForMultiLine:1;
	indentsForKeywords: 2
]
