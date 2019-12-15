Extension { #name : #RBProgramNodeTest }

{ #category : #'*EnlumineurFormatter-Tests' }
RBProgramNodeTest >> testAllStatementsAssignment [
	| tree stats |
	tree := self parserClass parseMethod: 
			'methodName
				
				x := 33'.
	stats := tree allStatements.
	self assert: stats size equals: 2.
	self flag: #todo. "why two"
]

{ #category : #'*EnlumineurFormatter-Tests' }
RBProgramNodeTest >> testAllStatementsBlockWithReturn [
	| tree stats |
	tree := self parserClass parseMethod: 
			'methodName
				^ [ ^ self ] '.
	stats := tree allStatements.
	self assert: stats size equals: 6.
	self flag: #todo. "Why 6"
 
]

{ #category : #'*EnlumineurFormatter-Tests' }
RBProgramNodeTest >> testAllStatementsBlockWithTemps [
	| tree stats |
	tree := self parserClass parseMethod: 
			'methodName
				^ [ | tmp | tmp := 88 ] '.
	stats := tree allStatements.
	self assert: stats size equals: 6.
	self flag: #todo. "Why 6"
 
]

{ #category : #'*EnlumineurFormatter-Tests' }
RBProgramNodeTest >> testAllStatementsDynamicArray [
	| tree stats |
	tree := self parserClass parseMethod: 
			'methodName
				
				{ 1 . self send1 . self send2} '.
	stats := tree allStatements.
	self assert: stats size equals: 8.
	self flag: #todo. "why 8"
]

{ #category : #'*EnlumineurFormatter-Tests' }
RBProgramNodeTest >> testAllStatementsReturns [
	| tree stats |
	tree := self parserClass parseMethod: 
			'methodName
				^ self '.
	stats := tree allStatements.
	self assert: stats size equals: 2.
	self flag: #todo. "Why 2"
 
]

{ #category : #'*EnlumineurFormatter-Tests' }
RBProgramNodeTest >> testAllStatementsReturnsMultiple [
	| tree stats |
	tree := self parserClass parseMethod: 
			'methodName
				1 ifTrue: [ ^ self ].
				^ self '.
	stats := tree allStatements.
	self assert: stats size equals: 8.
	self flag: #todo. "Why 8?"

 
]

{ #category : #'*EnlumineurFormatter-Tests' }
RBProgramNodeTest >> testAllStatementsSimpleBlock [
	| tree stats |
	tree := self parserClass parseMethod: 
			'methodName
				^ [ 8 + 4 ] '.
	stats := tree allStatements.
	self assert: stats size equals: 6.
	self flag: #todo. "Why 6"
 
]

{ #category : #'*EnlumineurFormatter-Tests' }
RBProgramNodeTest >> testAllStatementsTemps [
	| tree stats |
	tree := self parserClass parseMethod: 
			'methodName
				| tmp1 tmp2 |
				tmp1 + tmp2'.
	stats := tree allStatements.
	self assert: stats size equals: 2.
	self flag: #todo. "I would like to get 3"
]

{ #category : #'*EnlumineurFormatter-Tests' }
RBProgramNodeTest >> testAllStatementsTwoMessages [
	| tree stats |
	tree := self parserClass parseMethod: 
			'methodName
				
				1 send1 send2'.
	stats := tree allStatements.
	self assert: stats size equals: 2.
]

{ #category : #'*EnlumineurFormatter-Tests' }
RBProgramNodeTest >> testNumberOfSentMessages [
	| tree messages |
	tree := self parserClass parseMethod: 
			'methodName
				| temp |
				1 send1 send2; send3.
				temp := [:each | {4 send4} send5].
				temp send6.
				0 ifTrue: [ 1 ]'.
	messages := tree sentMessages.
	self assert: messages size equals: 7.
	"we count ifTrue:"
	1 to: 6 do:
		[ :i | self assert: (messages includes: ('send' , i printString) asSymbol) ]
]
