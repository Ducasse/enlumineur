Class {
	#name : #BIEnlumineurContextTest,
	#superclass : #TestCase,
	#category : #'Enlumineur-Tests'
}

{ #category : #tests }
BIEnlumineurContextTest >> testNumberOfSpaces [

	| context |
	context := BIEnlumineurContext new. 
	self assert: context indentExtraSpaces equals: ''
]
