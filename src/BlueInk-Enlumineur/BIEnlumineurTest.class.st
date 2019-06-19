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

{ #category : #test }
BIEnlumineurTest >> testLookAheadCodeIsResetWhenChangingConfiguration [
	| prettyPrinterInstance context1 context2 astNode res1 res2 |
	context1 := BIEnlumineurContext new.
	context2 := BIEnlumineurContext new lineUpBlockBrackets: true.
	prettyPrinterInstance := BIEnlumineur new installNewContext: context1.
	astNode := RBParser parseExpression: 
	'1 to: 4 do: [ :i | 
		Transcript
			show: i;
			cr;
			cr]'.
	
	res1 := prettyPrinterInstance format: astNode.
	res2 := (prettyPrinterInstance installNewContext: context2) format: astNode.
	
	self deny: res1 equals: res2
]
