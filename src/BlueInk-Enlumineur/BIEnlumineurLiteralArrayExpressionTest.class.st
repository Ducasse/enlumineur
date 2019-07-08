Class {
	#name : #BIEnlumineurLiteralArrayExpressionTest,
	#superclass : #BIEnlumineurTest,
	#category : #'BlueInk-Enlumineur-Tests'
}

{ #category : #configurations }
BIEnlumineurLiteralArrayExpressionTest >> basicConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:false;
		numberOfSpacesInsideArray: 0
]

{ #category : #configurations }
BIEnlumineurLiteralArrayExpressionTest >> oneSpaceConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:false;
		numberOfSpacesInsideArray: 1
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

{ #category : #tests }
BIEnlumineurLiteralArrayExpressionTest >> testOneSpaceInsideArray [
	| source |
	configurationSelector := #oneSpaceConfiguration.
	source := self formatExpression: '#(1 2 3)'.
	self assert: source equals: '#( 1 2 3 )'
]

{ #category : #tests }
BIEnlumineurLiteralArrayExpressionTest >> testTwoSpacesInsideArray [
	| source |
	configurationSelector := #twoSpacesConfiguration.
	source := self formatExpression: '#(1 2 3)'.
	self assert: source equals: '#(  1 2 3  )'
]

{ #category : #configurations }
BIEnlumineurLiteralArrayExpressionTest >> twoSpacesConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:false;
		numberOfSpacesInsideArray: 2
]
