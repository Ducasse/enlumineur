Class {
	#name : #BIEnlumineurLiteralArrayExpressionTest,
	#superclass : #BIEnlumineurTest,
	#category : #'BlueInk-Enlumineur-Tests'
}

{ #category : #configurations }
BIEnlumineurLiteralArrayExpressionTest >> basicConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:false;
		numberOfSpacesInsideArray: 0;
		indentStyle: #tabulation;
		indentExtraSpaces: 0;
		maxLineLength: 70
]

{ #category : #configurations }
BIEnlumineurLiteralArrayExpressionTest >> oneSpaceConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:false;
		numberOfSpacesInsideArray: 1;
		indentStyle: #tabulation;
		indentExtraSpaces: 0;
		maxLineLength: 70
]

{ #category : #tests }
BIEnlumineurLiteralArrayExpressionTest >> testBigArray [
	| source |
	configurationSelector := #oneSpaceConfiguration.
	source := self formatExpression:
'#( #( #expr0 #expr1 #expr2 #expr3 #expr4 #expr5 #expr6 #expr7 #expr8 #expr9 #expr10 #expr11 #expr12 #expr13 #expr14 #expr15 #expr16 #expr17 #expr18 #expr19 #expr20 #expr21 #expr22 #expr23 #expr24 ) #( #expr25 #expr26 #expr27 #expr28 #expr29 #expr30 #expr31 #expr32 #expr33 #expr34 #expr35 #expr36 #expr37 #expr38 #expr39 #expr40 #expr41 #expr42 #expr43 #expr44 #expr45 #expr46 #expr47 #expr48 #expr49 ) )'.
	
	self assert: source equals:
'#( #( #expr0 #expr1 #expr2 #expr3 #expr4 #expr5 #expr6 #expr7 #expr8
      #expr9 #expr10 #expr11 #expr12 #expr13 #expr14 #expr15 #expr16
      #expr17 #expr18 #expr19 #expr20 #expr21 #expr22 #expr23 #expr24 )
   #( #expr25 #expr26 #expr27 #expr28 #expr29 #expr30 #expr31 #expr32
      #expr33 #expr34 #expr35 #expr36 #expr37 #expr38 #expr39 #expr40
      #expr41 #expr42 #expr43 #expr44 #expr45 #expr46 #expr47 #expr48
      #expr49 ) )'
]

{ #category : #tests }
BIEnlumineurLiteralArrayExpressionTest >> testByteArrayParenthesis [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '#[1 2 3]'.
	self assert: source equals: '#[1 2 3]'
]

{ #category : #tests }
BIEnlumineurLiteralArrayExpressionTest >> testNoExtraSpaceArroundParenthesis [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '#(  1 2 3    )  '.
	self assert: source equals: '#(1 2 3)'
]

{ #category : #tests }
BIEnlumineurLiteralArrayExpressionTest >> testNoExtraSpaceArroundParenthesis2 [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '#[  1 2 3    ]  '.
	self assert: source equals: '#[1 2 3]'
]

{ #category : #tests }
BIEnlumineurLiteralArrayExpressionTest >> testNoExtraSpaceBetweenValue [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '#(1     2       3)'.
	self assert: source equals: '#(1 2 3)'
]

{ #category : #tests }
BIEnlumineurLiteralArrayExpressionTest >> testNoExtraSpaceBetweenValue2 [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '#[1     2       3]'.
	self assert: source equals: '#[1 2 3]'
]

{ #category : #tests }
BIEnlumineurLiteralArrayExpressionTest >> testOneSpaceInsideArray [
	| source |
	configurationSelector := #oneSpaceConfiguration.
	source := self formatExpression: '#(1 2 3)'.
	self assert: source equals: '#( 1 2 3 )'
]

{ #category : #tests }
BIEnlumineurLiteralArrayExpressionTest >> testTwoSpacesInsideArray [
	| source |
	configurationSelector := #twoSpacesConfiguration.
	source := self formatExpression: '#(1 2 3)'.
	self assert: source equals: '#(  1 2 3  )'
]

{ #category : #configurations }
BIEnlumineurLiteralArrayExpressionTest >> twoSpacesConfiguration [

	^ self contextClass basicNew
		formatCommentWithStatements:false;
		numberOfSpacesInsideArray: 2;
		indentStyle: #tabulation;
		indentExtraSpaces: 0;
		maxLineLength: 70
]
