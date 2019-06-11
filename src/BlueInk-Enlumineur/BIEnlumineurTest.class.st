Class {
	#name : #BIEnlumineurTest,
	#superclass : #ParametrizedTestCase,
	#instVars : [
		'configurationSelector',
		'formatterClass',
		'contextClass'
	],
	#category : #'BlueInk-Enlumineur'
}

{ #category : #'building suites' }
BIEnlumineurTest class >> testParameters [

	^ ParametrizedTestMatrix new
			addCase: { #formatterClass -> BIEnlumineur. #contextClass -> BIEnlumineurContext };
		yourself.
]

{ #category : #hooks }
BIEnlumineurTest >> contextClass [
	^ contextClass
]

{ #category : #hooks }
BIEnlumineurTest >> contextClass: aContextClass [
	contextClass := aContextClass
]

{ #category : #hooks }
BIEnlumineurTest >> formatExpression: anExpression [

	| expr |
	expr := self parseExpression: anExpression.
	^ self formatter format: expr.
	
]

{ #category : #hooks }
BIEnlumineurTest >> formatter [
	^ self formatterClass new
		installNewContext: (self perform: configurationSelector)
		yourself
]

{ #category : #hooks }
BIEnlumineurTest >> formatterClass [
	self flag: #todo. "change to have BIConfigurableFormatter"
	^ formatterClass
]

{ #category : #hooks }
BIEnlumineurTest >> formatterClass: aFormatterClass [
	formatterClass := aFormatterClass
]

{ #category : #hooks }
BIEnlumineurTest >> parseExpression: anExpression [

	^ self parser parseExpression: anExpression
]

{ #category : #hooks }
BIEnlumineurTest >> parser [
	^ RBParser
]
