Class {
	#name : #EFBenchTest,
	#superclass : #TestCase,
	#category : #'EnlumineurFormatter-Tests'
}

{ #category : #tests }
EFBenchTest >> basicMethod [
	1 to: 10 do: [:i | Transcript show:i ; cr ;cr]
 
]

{ #category : #resources }
EFBenchTest >> longNestedMethod [

	self foo: [ :b1 | 
		b1 value: [ :b2 |  
			b2 value: [ :b3 |  
				b2 value: [ :b4 |  
				b3 value: [ :b5 |  
				b4 value: [ :b6 |  
				b5 value:  [ :b7 |  
				b6 value: [ :b8|  
				b7 value: [ :b9 |  
				b8 value: [ :b10 |  
				b9 value:  2] ] ] ]] ] ] ] ] ]
]

{ #category : #resources }
EFBenchTest >> longNestedMethodShort [
  | b0 |
  self value: [:b1 |  b0 value: [:b2 |  b1 value: [:b3 |  b2 value: [:b4 |  b3 value: [:b5 |  b4 value: [:b6 |  b5 value: [:b7 |  b7 value: 2 ] ] ] ] ] ] ]
]

{ #category : #tests }
EFBenchTest >> testBasicBlueInk [

	BIConfigurableFormatter format: (EFBenchTest >> #basicMethod) ast 
]

{ #category : #tests }
EFBenchTest >> testBasicEF [

	EFFormatter format: (EFBenchTest >> #basicMethod) ast 
]

{ #category : #tests }
EFBenchTest >> testEF [
  "
	[ EFFormatter format: (EFBenchTest >> #longNestedMethodShort) ast ] bench  '0.159 per second'

  [ RBSimpleFormatter format: (EFBenchTest >> #longNestedMethodShort) ast ] bench 
	>>>'15597.361 per second'
	
  [ BIConfigurableFormatter  format: (EFBenchTest >> #longNestedMethodShort) ast ] bench  '7341.000 per second'

	"
]
