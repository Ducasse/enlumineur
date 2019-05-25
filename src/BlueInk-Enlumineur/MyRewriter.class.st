Class {
	#name : #MyRewriter,
	#superclass : #Object,
	#category : #'BlueInk-Enlumineur-ToIntegrateToPharo'
}

{ #category : #'as yet unclassified' }
MyRewriter >> rewrite [ 
	"self new rewrite"
	| rewriter ast rewrote |
	rewriter := RBParseTreeRewriter new.
	rewriter replaceMethod: self searchPattern with: self targetPattern.
	ast := (BIArrayExpressionTest>>#testFormatElement) ast.
	rewrote := rewriter executeTree: ast.
	rewrote ifFalse: [ ^ 'did not work' ].
	^ rewrote formattedCode
]

{ #category : #'as yet unclassified' }
MyRewriter >> searchPattern [

	^ '`selector
| expr source |
`var := self parseExpression:  `#input.
configurationSelector := `#configuration.
`@.st1.
self assert: source equals: `#output'
]

{ #category : #'as yet unclassified' }
MyRewriter >> targetPattern [

	^ '`selector
| source |
configurationSelector := `#configuration.
`var := self formatExpression:  `#input.
`@.st1.
self assert: source equals: `#output'
]
