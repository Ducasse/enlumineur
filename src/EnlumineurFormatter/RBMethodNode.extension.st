Extension { #name : #RBMethodNode }

{ #category : #'*EnlumineurFormatter' }
RBMethodNode >> allStatements [
	"return the statements including variable definition."
	^ (self temporaries asOrderedCollection addAll: self statements)
		addAll: super allStatements;
		yourself

]

{ #category : #'*EnlumineurFormatter' }
RBMethodNode >> hasTemporaries [
	^ self temporaries isNotEmpty
]
