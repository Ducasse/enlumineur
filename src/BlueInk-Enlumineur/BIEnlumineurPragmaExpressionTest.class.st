Class {
	#name : #BIEnlumineurPragmaExpressionTest,
	#superclass : #BIEnlumineurTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #configuration }
BIEnlumineurPragmaExpressionTest >> basicConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:false;
		maxLineLength: 50;
		keepBlockInMessage: true
]

{ #category : #tests }
BIEnlumineurPragmaExpressionTest >> testPragmaNoExtraSpace [
	| expr source |
	expr := RBParser parsePragma:'<   Pragma   >'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '<Pragma>'
]

{ #category : #tests }
BIEnlumineurPragmaExpressionTest >> testPragmaNoExtraSpace2 [
	| expr source |
	expr := RBParser parsePragma:'<func:     ''(3+4)''       res:      7>'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '<func: ''(3+4)'' res: 7>'
]

{ #category : #tests }
BIEnlumineurPragmaExpressionTest >> testPragmaNoExtraSpaceBetweenMethodeAndArgument [
	| expr source |
	expr := RBParser parsePragma:'<primitive:    41>'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '<primitive: 41>'
]
