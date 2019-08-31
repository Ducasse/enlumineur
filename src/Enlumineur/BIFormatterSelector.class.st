"
Should probably move somewhere else
This class should be eliminated when we remove the blueink formatter. 



"
Class {
	#name : #BIFormatterSelector,
	#superclass : #Object,
	#classInstVars : [
		'formatterClass'
	],
	#category : #'Enlumineur-Settings'
}

{ #category : #accessing }
BIFormatterSelector class >> formatterClass [
	^ RBProgramNode formatterClass 
]

{ #category : #accessing }
BIFormatterSelector class >> formatterClass: aFormatterClass [
	formatterClass := aFormatterClass.
	RBProgramNode formatterClass: aFormatterClass 
]

{ #category : #accessing }
BIFormatterSelector class >> formatters [
	^ "RBProgramNodeVisitor subclasses
		select: [ :each | [each isPrettyPrinter] on: MessageNotUnderstood do: [false]]"
		RBProgramNodeVisitor subclasses select: [ :each | each name endsWith: 'Formatter' ]
]

{ #category : #initialization }
BIFormatterSelector class >> initialize [
	self formatterClass: RBProgramNode formatterClass 
]

{ #category : #settings }
BIFormatterSelector class >> settingGroup [
	^ #formatterSelector
]

{ #category : #settings }
BIFormatterSelector class >> settingsFormatter: aBuilder [
	(aBuilder pickOne: #formatterClass)
		label: #formatter;
		domainValues:self formatters ;
		description: 'the formatter selector'.
]

{ #category : #settings }
BIFormatterSelector class >> settingsOn: aBuilder [
	<systemsettings>
	(aBuilder group: self settingGroup)
		target: self;
		parent: #codeBrowsing;
		label: 'BlueInk Formatter Selector';
		description: 'Settings related to formatter';
		with: [ self settingsFormatter: aBuilder ]
]
