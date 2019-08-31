Extension { #name : #BIConfigurableFormatter }

{ #category : #'*EnlumineurUI' }
BIConfigurableFormatter class >> defaultPrettyPrintContext [
	^ DefaultPrettyPrintContext
]

{ #category : #'*EnlumineurUI' }
BIConfigurableFormatter class >> defaultPrettyPrintContext: aContext [
	DefaultPrettyPrintContext := aContext  
]

{ #category : #'*EnlumineurUI' }
BIConfigurableFormatter class >> settingGroup [
	^ #blueInkFormatter
]
