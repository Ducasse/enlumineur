Extension { #name : #RBBlockNode }

{ #category : #'*EnlumineurFormatter' }
RBBlockNode >> allStatements [
	"including temp variable definition."
	^ (self temporaries asOrderedCollection addAll: self statements)
		addAll: super allStatements;
		yourself

]
