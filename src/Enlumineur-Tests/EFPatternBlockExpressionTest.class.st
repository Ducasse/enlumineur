Class {
	#name : #EFPatternBlockExpressionTest,
	#superclass : #EFBlockExpressionTest,
	#category : #'Enlumineur-Tests'
}

{ #category : #hooks }
EFPatternBlockExpressionTest >> closeBracket [
	^'}'
]

{ #category : #hooks }
EFPatternBlockExpressionTest >> openBracket [
	^'`{'
]

{ #category : #hooks }
EFPatternBlockExpressionTest >> parserClass [
	^ RBPatternParser
]
