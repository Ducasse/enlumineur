Class {
	#name : #BIPatternBlockExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #tests }
BIPatternBlockExpressionTest >> testPatternBlockArgumentIsFormated [

	| expr source |
	expr := RBPatternParser parseExpression: '`{:i|i}'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals:'`{ :i | i }'
]

{ #category : #tests }
BIPatternBlockExpressionTest >> testPatternBlockArgumentsAreFormated [

	| expr source |
	expr := RBPatternParser parseExpression: '`{:i :j|i}'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals:'`{ :i :j | i }'
]

{ #category : #tests }
BIPatternBlockExpressionTest >> testPatternBlockMultiLine [

	| expr source |
	expr := RBPatternParser parseExpression: '`{1+3. 6 factorial}'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'`{ 1 + 3.
6 factorial }'
]

{ #category : #tests }
BIPatternBlockExpressionTest >> testPatternBlockNoExtraSpace [

	| expr source |
	expr := RBPatternParser parseExpression: '`{   a  :=  1  }'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals:'`{ a := 1 }'
]

{ #category : #tests }
BIPatternBlockExpressionTest >> testPatternBlockSpace [

	| expr source |
	expr := RBPatternParser parseExpression: '`{a:=1}'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals:'`{ a := 1 }'
]
