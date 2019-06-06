Class {
	#name : #BIEnlumineurPatternBlockExpressionTest,
	#superclass : #BIEnlumineurBlockExpressionTest,
	#category : #'BlueInk-Enlumineur'
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
BIEnlumineurPatternBlockExpressionTest >> parser [
	^ RBPatternParser
]
