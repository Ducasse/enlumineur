Class {
	#name : #BIEnlumineurContextTest,
	#superclass : #TestCase,
	#category : #'BlueInk-Enlumineur-Tests'
}

{ #category : #tests }
BIEnlumineurContextTest >> testNumberOfSpaces [

	| context |
	context := BIEnlumineurContext new. 
	self assert: (context stringFromSpaceNumber: 4) equals: '    '.
	self assert: (context stringFromSpaceNumber: 1) equals: ' '.
	self assert: (context stringFromSpaceNumber: 0) equals: ''.
]
