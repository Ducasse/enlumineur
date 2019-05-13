Class {
	#name : #BIParseErrorExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #tests }
BIParseErrorExpressionTest >> testParseError [

	| expr source |
	expr := RBParser parseFaultyExpression: '#(1 3 4'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: ''
]

{ #category : #tests }
BIParseErrorExpressionTest >> testParseError2 [

	| expr source |
	expr := RBParser parseFaultyExpression: '1 := '.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'1.
:= '
]
