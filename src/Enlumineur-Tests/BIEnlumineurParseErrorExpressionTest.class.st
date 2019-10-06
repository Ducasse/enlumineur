Class {
	#name : #BIEnlumineurParseErrorExpressionTest,
	#superclass : #BIEnlumineurTest,
	#category : #'Enlumineur-Tests'
}

{ #category : #configuration }
BIEnlumineurParseErrorExpressionTest >> basicConfiguration [

	^ self contextClass basicNew
		formatCommentCloseToStatements:false;
		retainBlankLinesBetweenStatements: false;
		minimumNewLinesBetweenStatements:0;
		periodAtEndOfBlock:false;
		periodAtEndOfMethod:false
]

{ #category : #tests }
BIEnlumineurParseErrorExpressionTest >> testParseError [

	| expr source |
	expr := RBParser parseFaultyExpression: '#(1 3 4'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '(1 3 4'
]

{ #category : #tests }
BIEnlumineurParseErrorExpressionTest >> testParseError2 [

	| expr source |
	expr := RBParser parseFaultyExpression: '1 := '.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'1. := '
]
