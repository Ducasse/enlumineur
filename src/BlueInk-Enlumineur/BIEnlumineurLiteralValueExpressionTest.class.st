Class {
	#name : #BIEnlumineurLiteralValueExpressionTest,
	#superclass : #BIEnlumineurTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #configurations }
BIEnlumineurLiteralValueExpressionTest >> basicConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:false
]

{ #category : #tests }
BIEnlumineurLiteralValueExpressionTest >> testNoExtraSpaces [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '    2     '.
	self assert: source equals: '2'
]

{ #category : #tests }
BIEnlumineurLiteralValueExpressionTest >> testNotLitteral [

	| expr source |
	expr := RBLiteralValueNode value: Transcript. 
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '''<an unprintable nonliteral value>'''
	
]

{ #category : #tests }
BIEnlumineurLiteralValueExpressionTest >> testSpaces [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '2'.
	self assert: source equals: '2'
]
