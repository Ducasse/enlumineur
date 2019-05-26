Class {
	#name : #MyRewriter,
	#superclass : #Object,
	#category : #'BlueInk-Enlumineur-ToIntegrateToPharo'
}

{ #category : #'as yet unclassified' }
MyRewriter >> rewrite [ 
	"self new rewrite"
	| rewriter ast ok |
	rewriter := RBParseTreeRewriter new.
	rewriter replaceMethod: self searchPattern with: self targetPattern.
	ast := (BIArrayExpressionTest>>#testNoExtraSpaceAroundPeriod) parseTree.
	ok := rewriter executeTree: ast.
	^ ok ifFalse: [ 'did not work' ]
		ifTrue: [ ast formattedCode ]
]

{ #category : #'as yet unclassified' }
MyRewriter >> searchPattern [

	^ '`selector
| expr source |
expr := self parseExpression:  `#input.
configurationSelector := `#configuration.
`@.st1.
self assert: source equals: `#output'
]

{ #category : #'as yet unclassified' }
MyRewriter >> targetPattern [

	^ '`selector
| source |
configurationSelector := `#configuration.
source := self formatExpression:  `#input.
`@.st1.
self assert: source equals: `#output'
]
