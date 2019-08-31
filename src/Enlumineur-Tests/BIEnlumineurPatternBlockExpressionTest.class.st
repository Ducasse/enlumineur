Class {
	#name : #BIEnlumineurPatternBlockExpressionTest,
	#superclass : #BIEnlumineurBlockExpressionTest,
	#category : #'Enlumineur-Tests'
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
