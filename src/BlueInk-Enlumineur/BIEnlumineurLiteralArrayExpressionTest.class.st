Class {
	#name : #BIEnlumineurLiteralArrayExpressionTest,
	#superclass : #BIEnlumineurTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #configurations }
BIEnlumineurLiteralArrayExpressionTest >> basicConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:false
]

{ #category : #tests }
BIEnlumineurLiteralArrayExpressionTest >> testByteArrayParenthesis [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '#[1 2 3]'.
	self assert: source equals: '#[1 2 3]'
]

{ #category : #tests }
BIEnlumineurLiteralArrayExpressionTest >> testNoExtraSpaceArroundParenthesis [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '#(  1 2 3    )  '.
	self assert: source equals: '#(1 2 3)'
]

{ #category : #tests }
BIEnlumineurLiteralArrayExpressionTest >> testNoExtraSpaceArroundParenthesis2 [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '#[  1 2 3    ]  '.
	self assert: source equals: '#[1 2 3]'
]

{ #category : #tests }
BIEnlumineurLiteralArrayExpressionTest >> testNoExtraSpaceBetweenValue [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '#(1     2       3)'.
	self assert: source equals: '#(1 2 3)'
]

{ #category : #tests }
BIEnlumineurLiteralArrayExpressionTest >> testNoExtraSpaceBetweenValue2 [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '#[1     2       3]'.
	self assert: source equals: '#[1 2 3]'
]
