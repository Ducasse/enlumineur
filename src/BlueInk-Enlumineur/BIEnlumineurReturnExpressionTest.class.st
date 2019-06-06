Class {
	#name : #BIEnlumineurReturnExpressionTest,
	#superclass : #BIEnlumineurTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #configuration }
BIEnlumineurReturnExpressionTest >> basicConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:false;
		stringFollowingReturn: ' '
]

{ #category : #tests }
BIEnlumineurReturnExpressionTest >> testReturnFormatValue [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '    ^a:=1   '.
	self assert: source equals: '^ a := 1'
]

{ #category : #tests }
BIEnlumineurReturnExpressionTest >> testReturnHasNoExtraSpace [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '    ^a   '.
	self assert: source equals: '^ a'
]

{ #category : #tests }
BIEnlumineurReturnExpressionTest >> testReturnHasNoExtraSpaceInside [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: ' ^    a'.
	self assert: source equals: '^ a'
]

{ #category : #tests }
BIEnlumineurReturnExpressionTest >> testReturnHasNoPeriod [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '^a.'.
	self assert: source equals: '^ a'
]

{ #category : #tests }
BIEnlumineurReturnExpressionTest >> testReturnHasSpaceBetween [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '^a'.
	self assert: source equals: '^ a'
]
