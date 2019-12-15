Extension { #name : #RBArrayNode }

{ #category : #'*EnlumineurFormatter' }
RBArrayNode >> allStatements [
	^ (statements asOrderedCollection)
		addAll: super allStatements;
		yourself

]
