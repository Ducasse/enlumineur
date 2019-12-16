Extension { #name : #RBMethodNodeTest }

{ #category : #'*EnlumineurFormatter-Tests' }
RBMethodNodeTest >> testBlockHasArguments [

	| tree |
	tree := self parseMethod: 'foo 
		[ :arg | 
		abd + cde 
		]'.

	self assert: tree body statements first hasArguments
	

]

{ #category : #'*EnlumineurFormatter-Tests' }
RBMethodNodeTest >> testBlockHasTemporaries [

	| tree |
	tree := self parseMethod: 'foo 
		[ 
		| tmp |
		abd + cde 
		]'.

	self deny: tree hasTemporaries.
	self assert: tree body statements first hasTemporaries
	

]

{ #category : #'*EnlumineurFormatter-Tests' }
RBMethodNodeTest >> testMethodsHasTemporaries [

	| tree |
	tree := self parseMethod: 'foo: abd bar: cde  
		| tmp |
^ abd + cde'.

	self assert: tree hasTemporaries
	

]
