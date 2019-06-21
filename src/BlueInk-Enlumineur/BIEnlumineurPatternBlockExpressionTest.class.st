Class {
	#name : #BIEnlumineurPatternBlockExpressionTest,
	#superclass : #BIEnlumineurBlockExpressionTest,
	#category : #'BlueInk-Enlumineur-Tests'
}

{ #category : #hooks }
BIEnlumineurPatternBlockExpressionTest >> closeBracket [
	^'}'
]

{ #category : #hooks }
BIEnlumineurPatternBlockExpressionTest >> openBracket [
	^'`{'
]

{ #category : #hooks }
BIEnlumineurPatternBlockExpressionTest >> parserClass [
	^ RBPatternParser
]

{ #category : #test }
BIEnlumineurPatternBlockExpressionTest >> testDontFormatCommentWithStatement2 [
	| expr source |
	self flag: 'does PatternBlock can have comments'.
	configurationSelector := #dontFormatCommentWithStatementConfiguration.
	source := self formatExpression:'"aComment"`{ ""1 factorial. 2 factorial }'.
	self assert: source equals:'`{ "aComment"""1 factorial.
2 factorial }'
]

{ #category : #test }
BIEnlumineurPatternBlockExpressionTest >> testNewLineAfterComment [
	
	| expr source |
	self flag: 'does PatternBlock can have comments'.
	configurationSelector := #basicConfiguration.
	source := self formatExpression:'"aComment"`{ 1 . 2  }'.
	self assert: source equals:'`{ "aComment"1.
2 }'
]
