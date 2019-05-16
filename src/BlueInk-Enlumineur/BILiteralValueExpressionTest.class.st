Class {
	#name : #BILiteralValueExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #configurations }
BILiteralValueExpressionTest >> basicConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:false
]

{ #category : #tests }
BILiteralValueExpressionTest >> testNoExtraSpaces [

	| expr source |
	expr := RBParser parseExpression: '    2     '.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '2'
	
]

{ #category : #tests }
BILiteralValueExpressionTest >> testNotLitteral [

	| expr source |
	expr := RBLiteralValueNode value: Transcript. 
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '''<an unprintable nonliteral value>'''
	
]

{ #category : #tests }
BILiteralValueExpressionTest >> testSpaces [

	| expr source |
	expr := RBParser parseExpression: '2'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '2'
	
]
