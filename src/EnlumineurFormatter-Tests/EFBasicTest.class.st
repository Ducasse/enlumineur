Class {
	#name : #EFBasicTest,
	#superclass : #EFTest,
	#category : #'EnlumineurFormatter-Tests'
}

{ #category : #test }
EFBasicTest >> testLookAheadCodeIsResetWhenChangingConfiguration [
	"This is a test to show that the formatter got a problem with a cache. When we execute two formatting passes one after the other and changed the context. Some nodes are not formatted with the new context but with the old. This is due to a cache used by the formatter."
	
	| prettyPrinterInstance context1 context2 astNode res1 res2 |
	context1 := EFContext new.
	context2 := EFContext new lineUpBlockBrackets: true.
	prettyPrinterInstance := EFFormatter new installNewContext: context1.
	astNode := RBParser parseExpression: 
	'1 to: 4 do: [ :i | 
		Transcript
			show: i;
			cr;
			cr]'.
	
	res1 := prettyPrinterInstance format: astNode.
	res2 := (prettyPrinterInstance installNewContext: context2) format: astNode.
	
	self deny: res1 equals: res2
]
