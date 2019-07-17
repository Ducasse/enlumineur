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
