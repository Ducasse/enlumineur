Class {
	#name : #BIEnlumineurVariableExpressionTest,
	#superclass : #BIEnlumineurTest,
	#category : #'BlueInk-Enlumineur-Tests'
}

{ #category : #configuration }
BIEnlumineurVariableExpressionTest >> basicConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:false
]

{ #category : #tests }
BIEnlumineurVariableExpressionTest >> testNoExtraSpaces [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '    a     '.
	self assert: source equals: 'a'
]

{ #category : #tests }
BIEnlumineurVariableExpressionTest >> testSpaces [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: 'a'.
	self assert: source equals: 'a'
]
