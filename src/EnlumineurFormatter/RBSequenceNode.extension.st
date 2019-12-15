Extension { #name : #RBSequenceNode }

{ #category : #'*EnlumineurFormatter' }
RBSequenceNode >> allStatements [
	^ (statements asOrderedCollection)
		addAll: super allStatements;
		yourself

]
