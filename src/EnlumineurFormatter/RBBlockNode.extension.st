Extension { #name : #RBBlockNode }

{ #category : #'*EnlumineurFormatter' }
RBBlockNode >> allStatements [
	"including temp variable definition."
	^ (self temporaries asOrderedCollection addAll: self statements)
		addAll: super allStatements;
		yourself

]

{ #category : #'*EnlumineurFormatter' }
RBBlockNode >> hasArguments [

	^ arguments isNotEmpty
]

{ #category : #'*EnlumineurFormatter' }
RBBlockNode >> hasTemporaries [

	^ self temporaries isNotEmpty
]
