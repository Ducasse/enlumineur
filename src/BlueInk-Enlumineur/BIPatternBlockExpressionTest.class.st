Class {
	#name : #BIPatternBlockExpressionTest,
	#superclass : #BIBlockExpressionTest,
	#category : #'BlueInk-Enlumineur-ToIntegrateToPharo'
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
