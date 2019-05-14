Class {
	#name : #BISequenceExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #configurations }
BISequenceExpressionTest >> dontRetainBlankLinesBeforeCommentsConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
		retainBlankLinesBeforeComments: false
]

{ #category : #configurations }
BISequenceExpressionTest >> dontRetainBlankLinesBetweenStatementsConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
	retainBlankLinesBetweenStatements: false
]

{ #category : #configurations }
BISequenceExpressionTest >> periodAsTerminatorConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
	periodsAtEndOfBlock:true;
	periodsAtEndOfMethod:true
]

{ #category : #configurations }
BISequenceExpressionTest >> retainBlankLinesBeforeCommentsConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
		retainBlankLinesBeforeComments: true
]

{ #category : #configurations }
BISequenceExpressionTest >> retainBlankLinesBetweenStatementsConfiguration [
	"Here we can control explicitely the configuration we want."

	" String streamContents: [:s |
			BIPrettyPrinterContext new storeOn: s]"

	^ self contextClass new
	retainBlankLinesBetweenStatements: true
]

{ #category : #tests }
BISequenceExpressionTest >> testCommentAfterTemporaries [
	| expr source |
	expr := RBParser parseExpression: '|a b| "comment"'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |
"comment"
'
]

{ #category : #tests }
BISequenceExpressionTest >> testCommentBetweenStatements [
	| expr source |
	expr := RBParser parseExpression: '|a b| a := 1. "comment" b := 2'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |
a := 1.	"comment"
b := 2'
]

{ #category : #tests }
BISequenceExpressionTest >> testCommentBetweenTemporariesAndStatement [
	| expr source |
	expr := RBParser parseExpression: '|a b| "comment" a := 1'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |
"comment"
a := 1'
]

{ #category : #tests }
BISequenceExpressionTest >> testDontRetainBlankLinesBeforeComments [
	| expr source |
	expr := RBParser parseExpression: '|a b|
	a :=1.
	"Comment"
	b :=2'.
	configurationSelector := #dontRetainBlankLinesBeforeCommentsConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |
a := 1.	"Comment"
b := 2'
]

{ #category : #tests }
BISequenceExpressionTest >> testDontRetainBlankLinesBetweenStatements [
	| expr source |
	expr := RBParser parseExpression: '|a b| 
	
	a:=1.
	
	b:=a'.
	configurationSelector := #dontRetainBlankLinesBetweenStatementsConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |
a := 1.
b := a'
]

{ #category : #tests }
BISequenceExpressionTest >> testFormatEachStatement [
	| expr source |
	expr := RBParser parseExpression:
'|a b|
a:=1.
b:=a'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |
a := 1.
b := a'
]

{ #category : #tests }
BISequenceExpressionTest >> testNewLineAfterEachStatement [
	| expr source |
	expr := RBParser parseExpression: '|a b| a := 1. b := a'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |
a := 1.
b := a'
]

{ #category : #tests }
BISequenceExpressionTest >> testNewLineForStatements [
	| expr source |
	expr := RBParser parseExpression: '|a b| a:=2.b:=3'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |
a := 2.
b := 3'
]

{ #category : #tests }
BISequenceExpressionTest >> testNoPeriodAtEndOfBlock [
	| expr source |
	expr := RBParser parseExpression: '|a b| [1.].'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |
[ 1 ]'
]

{ #category : #tests }
BISequenceExpressionTest >> testNoPeriodAtEndOfMethode [
	| expr source |
	expr := RBParser parseExpression: '|a b| 6 factorial'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |
6 factorial'
]

{ #category : #tests }
BISequenceExpressionTest >> testPeriodAtEndOfBlock [
	| expr source |
	expr := RBParser parseExpression: '|a b| [1.].'.
	configurationSelector := #periodAsTerminatorConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |
[ 1. ].'
]

{ #category : #tests }
BISequenceExpressionTest >> testPeriodAtEndOfMethode [
	| expr source |
	expr := RBParser parseExpression: '|a b| 6 factorial'.
	configurationSelector := #periodAsTerminatorConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |
6 factorial.'
]

{ #category : #tests }
BISequenceExpressionTest >> testRetainBlankLinesBeforeComments [
	| expr source |
	expr := RBParser parseExpression: '|a b|
	a :=1.
	"Comment"
	b :=2'.
	configurationSelector := #retainBlankLinesBeforeCommentsConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |
a := 1.
"Comment"
b := 2'
]

{ #category : #tests }
BISequenceExpressionTest >> testRetainBlankLinesBetweenStatements [
	| expr source |
	expr := RBParser parseExpression: '|a b| 
	
	a:=1.
	
	b:=a'.
	
	configurationSelector := #retainBlankLinesBetweenStatementsConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |
a := 1.

b := a'
]

{ #category : #tests }
BISequenceExpressionTest >> testRetainBlankLinesBetweenStatements2 [
	| expr source |
	expr := RBParser parseExpression: '|a b| 
	
	a:=1.
	
	
	b:=a'.
	configurationSelector := #retainBlankLinesBetweenStatementsConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |
a := 1.


b := a'
]

{ #category : #tests }
BISequenceExpressionTest >> testRetainBlankLinesBetweenStatements3 [
	| expr source |
	expr := RBParser parseExpression: '|a b| 
	
	a:=1.
	b:=a'.
	configurationSelector := #retainBlankLinesBetweenStatementsConfiguration.
	source := self formatter format: expr.
	self assert: source equals:
'| a b |
a := 1.
b := a'
]
