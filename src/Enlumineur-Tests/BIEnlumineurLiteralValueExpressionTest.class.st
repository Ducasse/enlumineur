Class {
	#name : #BIEnlumineurLiteralValueExpressionTest,
	#superclass : #BIEnlumineurTest,
	#category : #'Enlumineur-Tests'
}

{ #category : #configurations }
BIEnlumineurLiteralValueExpressionTest >> basicConfiguration [

	^ self contextClass basicNew
		formatCommentCloseToStatements: false
		
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
BIEnlumineurLiteralValueExpressionTest >> testNumbers [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: ' 3.141592653589793 '.
	self assert: source equals: '3.141592653589793'
	

]

{ #category : #tests }
BIEnlumineurLiteralValueExpressionTest >> testSpaces [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '2'.
	self assert: source equals: '2'
]

{ #category : #tests }
BIEnlumineurLiteralValueExpressionTest >> testString [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: ' ''Pharo'' '.
	self assert: source equals: '''Pharo'''
]

{ #category : #tests }
BIEnlumineurLiteralValueExpressionTest >> testTrue [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: ' true '.
	self assert: source equals: 'true'
]
