Class {
	#name : #BIPatternBlockExpressionTest,
	#superclass : #BIBlockExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #hooks }
BIPatternBlockExpressionTest >> closeBracket [
	^'}'
]

{ #category : #hooks }
BIPatternBlockExpressionTest >> openBracket [
	^'`{'
]

{ #category : #hooks }
BIPatternBlockExpressionTest >> parser [
	^ RBPatternParser
]
