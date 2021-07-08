Class {
	#name : #BIEnlumineurInlineCommentTest,
	#superclass : #BIEnlumineurTest,
	#category : #'Enlumineur-Tests'
}

{ #category : #asserting }
BIEnlumineurInlineCommentTest >> assert: anRBNode hasEqualCommentsAtEqualNodesAs: anotherRBNode [
	self assert: anRBNode comments equals: anotherRBNode comments.
	self
		assert: anRBNode children size
		equals: anotherRBNode children size.
	anRBNode children
		with: anotherRBNode children
		do: [ :a :b | self assert: a hasEqualCommentsAtEqualNodesAs: b ]
]

{ #category : #configurations }
BIEnlumineurInlineCommentTest >> bigMethodeConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass basicNew
		indentStyle: #tabulation;
		formatCommentCloseToStatements: false;
		useBasicCommentFormat: false;
		maxLineLength: 80;
		periodAtEndOfBlock: false;
		periodAtEndOfMethod: false;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		indentsForKeywords: 1;
		keepBlockInMessage: true;
		retainBlankLinesBetweenStatements: false;
		minimumNewLinesBetweenStatements: 1;
		newLineBeforeFirstCascade: true;
		newLineAfterCascade: true;
		numberOfArgumentsForMultiLine: 4;
		numberOfNewLinesAfterTemporaries: 1;
		numberOfSpacesInsideBlock: 0;
		lineUpBlockBrackets: true;
		numberOfNewLinesAfterMethodSignature: 1;
		numberOfNewLinesAfterMethodComment: 1;
		newLineBeforeFirstKeyword:true;
		indentExtraSpaces:0;
		numberOfSpacesAfterCaretSymbolInReturn: 0;
		retainBlankLinesBeforeComments: false;
		methodSignatureOnMultipleLines: false;
		numberOfSpacesInsideParentheses: 0;
		numberOfSpacesInsideArray: 0;
		numberOfSpacesBeforeDotInDynamicArray: 0
]

{ #category : #'as yet unclassified' }
BIEnlumineurInlineCommentTest >> syntaxOnAPostcard: x [
	"A ""complete"" Pharo syntax"

	<syntaxOn: #postcard>
	| y byteArray |
	true & (false not & nil isNil)
		ifFalse: [ self perform: #add with: x ].
	y := thisContext stack size + super size.
	byteArray := #[2 2r100 8r20 16rFF].
	{-42.
	#($a #a #'I''m' 'a' 1.0 1.23e2 3.14s2 1)}
		do: [ :each | 
			| var |
			var := Transcript
				show: each class name;
				show: each printString ].
	^ x < y
]

{ #category : #'as yet unclassified' }
BIEnlumineurInlineCommentTest >> syntaxOnAPostcardWithCommentsEverywhere: x [
	<syntaxOn: #postcard>
	| y "1" byteArray "2" |
	((true "3" & (false "4" not "5" & nil "6" isNil "7") "8") "9"
		ifFalse: [ (self "10" perform: #add "11" with: x "12") "13" ] "14") "15".
	(y "22" := ((thisContext "16" stack "17") size "18" + super "19" size "20") "21") "23".
	(byteArray "25" := #[2 2r100 8r20 16rFF] "24") "26".
	({-42 "27".
	#($a #a #'I''m' 'a' 1.0 1.23e2 3.14s2 1) "28"} "29"
		do: [ :each "30" | 
			| var "31" |
			(var "39" := (Transcript "32"
				show: (each "33" class "34") name "35";
				show: each "36" printString "37") "38") "40" ] "41") "42".
	^ (x "43" < y "44") "45"
]

{ #category : #tests }
BIEnlumineurInlineCommentTest >> testBasic [
	| expr formattedSource formattedExpr |
	expr := RBParser parseMethod: 'aMethod a"within expression"b"after expression"."between statements"c."before return"^d"after return"'.
	configurationSelector := #bigMethodeConfiguration.
	formattedSource := self formatter format: expr.
	formattedExpr := RBParser parseMethod: formattedSource.
	self assert: formattedExpr hasEqualCommentsAtEqualNodesAs: expr.
	self assert: formattedSource equals:
'aMethod
	a "within expression" b "after expression".
	"between statements" c.
	"before return" ^ d "after return"'
]

{ #category : #tests }
BIEnlumineurInlineCommentTest >> testComplex [
	| expr comments formattedSource formattedExpr |
	expr := RBParser
		parseMethod: (self class >> #syntaxOnAPostcardWithCommentsEverywhere:) sourceCode.
	comments := self visitNodeCollectingCommentsDepthFirst: expr.
	self assert: comments isNotEmpty.
	comments
		withIndexDo: [ :e :i | self assert: e contents asInteger equals: i ].
	configurationSelector := #bigMethodeConfiguration.
	formattedSource := self formatter format: expr.
	formattedExpr := RBParser parseMethod: formattedSource.
	self assert: formattedExpr hasEqualCommentsAtEqualNodesAs: expr.
	self
		assert: formattedSource
		equals: (self class >> #syntaxOnAPostcardWithCommentsEverywhere:) sourceCode
]

{ #category : #visiting }
BIEnlumineurInlineCommentTest >> visitNodeCollectingCommentsDepthFirst: anRBNode [
	| children |
	(anRBNode isValue
		and: [ anRBNode parent isMethod not
				and: [ anRBNode parent isPragma not
						and: [ anRBNode parent isLiteralArray not
								and: [ anRBNode parent isCascade not ] ] ] ])
		ifTrue: [ self assert: anRBNode comments size equals: 1 ]
		ifFalse: [ self assert: anRBNode comments isEmpty ].
	children := (anRBNode isMessage
		and: [ anRBNode parent isCascade
				and: [ anRBNode ~~ anRBNode parent children first ] ])
		ifTrue: [ anRBNode children copyWithoutFirst ]
		ifFalse: [ anRBNode children ].
	^ (children
		flatCollect: [ :e | self visitNodeCollectingCommentsDepthFirst: e ])
		, anRBNode comments
]
