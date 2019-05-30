Class {
	#name : #MyRewriter,
	#superclass : #Object,
	#category : #'BlueInk-Enlumineur-ToIntegrateToPharo'
}

{ #category : #'as yet unclassified' }
MyRewriter >> rewrite [ 
	"self new rewrite"
	| rewriter ok method |
	rewriter := RBParseTreeRewriter new.
	rewriter replaceMethod: self searchPattern with: self targetPattern.
	method := (BIArrayExpressionTest>>#testNoExtraSpaceAroundPeriod).
	ok := rewriter executeTree: method parseTree.
	ok ifFalse: [ ^ 'did not work' ].
	Author 
		useAuthor: 'Refactoring'
		during: [  
			self halt.
			method origin 
				compile: rewriter tree formattedCode 
				classified: method protocol ]
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
self assert: source equals: `#output'
]
