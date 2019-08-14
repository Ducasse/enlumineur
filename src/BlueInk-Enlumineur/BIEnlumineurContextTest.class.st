Class {
	#name : #BIEnlumineurContextTest,
	#superclass : #TestCase,
	#category : #'BlueInk-Enlumineur-Tests'
}

{ #category : #tests }
BIEnlumineurContextTest >> testNumberOfSpaces [

	| context |
	context := BIEnlumineurContext new. 
	self assert: context indentExtraSpaces equals: ''
]
