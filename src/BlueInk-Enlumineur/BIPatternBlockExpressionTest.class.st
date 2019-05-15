Class {
	#name : #BIPatternBlockExpressionTest,
	#superclass : #BIBlockExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #accesing }
BIPatternBlockExpressionTest >> closeBracket [
	^'}'
]

{ #category : #accesing }
BIPatternBlockExpressionTest >> openBracket [
	^'`{'
]

{ #category : #accesing }
BIPatternBlockExpressionTest >> parser [
	^ RBPatternParser
]
