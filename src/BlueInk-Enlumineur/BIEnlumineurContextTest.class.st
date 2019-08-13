Class {
	#name : #BIEnlumineurContextTest,
	#superclass : #TestCase,
	#category : #'BlueInk-Enlumineur-Tests'
}

{ #category : #tests }
BIEnlumineurContextTest >> testNumberOfSpaces [

	| context |
	context := BIEnlumineurContext new. 
	self assert: (context numberOfSpaces: 4) equals: '    '.
	self assert: (context numberOfSpaces: 1) equals: ' '.
	self assert: (context numberOfSpaces: 0) equals: ''.
]
