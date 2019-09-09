"
I'm a new pretty printer for Pharo.
I started as a copy of the BlueInk pretty printer. To avoid to break everything we clone BIPrettyPrinter and started to evolve 
and made sure that all the tests are in sync with the implementation. 

Note that we are nice guys since we implemented 180 tests for the old pretty printer.
Now such tests can not be systematically applied on Enlumineur this is why we cloned them too. 

Pay attention my name should finish with Formatter so that the Settings proposes me to the user along with the other formatters.


"
Class {
	#name : #BIEnlumineurFormatter,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'codeStream',
		'indent',
		'lookaheadCode',
		'originalSource',
		'lineStart',
		'context',
		'isInCascadeNode',
		'isInMethodNode',
		'temporaryLookAheadCode'
	],
	#classVars : [
		'DefaultPrettyPrintContext',
		'FormatAsYouReadPolicy'
	],
	#category : #'Enlumineur-Core'
}

{ #category : #private }
BIEnlumineurFormatter class >> announceASettingChange [
	SystemAnnouncer uniqueInstance announce: BISettingsChanged 
]

{ #category : #private }
BIEnlumineurFormatter class >> defaultPrettyPrintContext [
	^ DefaultPrettyPrintContext
]

{ #category : #accessing }
BIEnlumineurFormatter class >> defaultPrettyPrintContext: aContext [ 
	DefaultPrettyPrintContext := aContext 
]

{ #category : #public }
BIEnlumineurFormatter class >> format: aParseTree [ 
	^self format: aParseTree withIndents: 0
]

{ #category : #public }
BIEnlumineurFormatter class >> format: aParseTree withIndents: anInteger [ 
	^ self new
		indent: anInteger;
		format: aParseTree
]

{ #category : #accessing }
BIEnlumineurFormatter class >> formatAsYouReadPolicy [
	^ FormatAsYouReadPolicy
]

{ #category : #accessing }
BIEnlumineurFormatter class >> formatAsYouReadPolicy: anObject [
	FormatAsYouReadPolicy := anObject
]

{ #category : #accessing }
BIEnlumineurFormatter class >> formatCommentWithStatements [
	^ DefaultPrettyPrintContext formatCommentWithStatements
]

{ #category : #accessing }
BIEnlumineurFormatter class >> formatCommentWithStatements: aBoolean [
	DefaultPrettyPrintContext formatCommentWithStatements: aBoolean.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurFormatter class >> indentString [
	^ DefaultPrettyPrintContext indentString
]

{ #category : #accessing }
BIEnlumineurFormatter class >> indentStyle [
	^ DefaultPrettyPrintContext indentStyle
]

{ #category : #accessing }
BIEnlumineurFormatter class >> indentStyle: aSymbole [
	DefaultPrettyPrintContext indentStyle: aSymbole.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurFormatter class >> indentsForKeywords [
	^ DefaultPrettyPrintContext indentsForKeywords
]

{ #category : #accessing }
BIEnlumineurFormatter class >> indentsForKeywords: anInteger [
	DefaultPrettyPrintContext indentsForKeywords: anInteger.
	self announceASettingChange
]

{ #category : #initialization }
BIEnlumineurFormatter class >> initialize [
	"self initialize"

	FormatAsYouReadPolicy := false.
	DefaultPrettyPrintContext := BIEnlumineurContext new
]

{ #category : #private }
BIEnlumineurFormatter class >> isPrettyPrinter [
	^ true
]

{ #category : #accessing }
BIEnlumineurFormatter class >> keepBlockInMessage [
	^ DefaultPrettyPrintContext keepBlockInMessage
]

{ #category : #accessing }
BIEnlumineurFormatter class >> keepBlockInMessage: aBoolean [
	DefaultPrettyPrintContext keepBlockInMessage: aBoolean.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurFormatter class >> lineUpBlockBrackets [
	^ DefaultPrettyPrintContext lineUpBlockBrackets
]

{ #category : #accessing }
BIEnlumineurFormatter class >> lineUpBlockBrackets: aBoolean [
	DefaultPrettyPrintContext lineUpBlockBrackets: aBoolean.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurFormatter class >> maxLineLength [
	^ DefaultPrettyPrintContext maxLineLength
]

{ #category : #accessing }
BIEnlumineurFormatter class >> maxLineLength: anInteger [
	DefaultPrettyPrintContext maxLineLength: anInteger.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurFormatter class >> methodSignatureOnMultipleLines [
	^ DefaultPrettyPrintContext methodSignatureOnMultipleLines
]

{ #category : #accessing }
BIEnlumineurFormatter class >> methodSignatureOnMultipleLines: aBoolean [
	DefaultPrettyPrintContext methodSignatureOnMultipleLines: aBoolean.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurFormatter class >> minimumNewLinesBetweenStatements [
	^ DefaultPrettyPrintContext minimumNewLinesBetweenStatements
]

{ #category : #accessing }
BIEnlumineurFormatter class >> minimumNewLinesBetweenStatements: anInteger [
	DefaultPrettyPrintContext minimumNewLinesBetweenStatements: anInteger.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurFormatter class >> multiLineMessages [
	^ DefaultPrettyPrintContext multiLineMessages printString
]

{ #category : #accessing }
BIEnlumineurFormatter class >> multiLineMessages: aString [
	DefaultPrettyPrintContext multiLineMessages: (self compiler evaluate: aString).
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurFormatter class >> newLineAfterCascade [
	^ DefaultPrettyPrintContext newLineAfterCascade
]

{ #category : #accessing }
BIEnlumineurFormatter class >> newLineAfterCascade: aBoolean [
	DefaultPrettyPrintContext newLineAfterCascade: aBoolean.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurFormatter class >> newLineBeforeFirstCascade [
	^ DefaultPrettyPrintContext newLineBeforeFirstCascade
]

{ #category : #accessing }
BIEnlumineurFormatter class >> newLineBeforeFirstCascade: aBoolean [
	DefaultPrettyPrintContext newLineBeforeFirstCascade: aBoolean.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurFormatter class >> newLineBeforeFirstKeyword [
	^ DefaultPrettyPrintContext newLineBeforeFirstKeyword
]

{ #category : #accessing }
BIEnlumineurFormatter class >> newLineBeforeFirstKeyword: aBoolean [
	DefaultPrettyPrintContext newLineBeforeFirstKeyword: aBoolean.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurFormatter class >> newLinesAfterMethodComment [
	^ DefaultPrettyPrintContext newLinesAfterMethodComment
]

{ #category : #accessing }
BIEnlumineurFormatter class >> newLinesAfterMethodComment: anInteger [
	DefaultPrettyPrintContext newLinesAfterMethodComment: anInteger.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurFormatter class >> newLinesAfterMethodPattern [
	^ DefaultPrettyPrintContext newLinesAfterMethodPattern
]

{ #category : #accessing }
BIEnlumineurFormatter class >> newLinesAfterMethodPattern: anInteger [
	DefaultPrettyPrintContext newLinesAfterMethodPattern: anInteger.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurFormatter class >> newLinesAfterTemporaries [
	^ DefaultPrettyPrintContext newLinesAfterTemporaries
]

{ #category : #accessing }
BIEnlumineurFormatter class >> newLinesAfterTemporaries: anInteger [
	DefaultPrettyPrintContext newLinesAfterTemporaries: anInteger.
	self announceASettingChange
]

{ #category : #settings }
BIEnlumineurFormatter class >> notInstalledCandidateForRemoval [
	"this method is for sync with guille and stef and we will remove it when ok"
	
	"(aBuilder setting: #periodsAsTerminators)
				label: 'Periods as terminators'.
	for the moment the UI does not work at ALL when selecting as terminators:
	It does not automatically select end of method and end of block.
	Probably the settings UI does not manage dependencies between settings so we will simply remove it."			
			
	
			
]

{ #category : #accessing }
BIEnlumineurFormatter class >> numberOfArgumentsForMultiLine [
	^ DefaultPrettyPrintContext numberOfArgumentsForMultiLine
]

{ #category : #accessing }
BIEnlumineurFormatter class >> numberOfArgumentsForMultiLine: anInteger [
	DefaultPrettyPrintContext numberOfArgumentsForMultiLine: anInteger.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurFormatter class >> numberOfSpacesAfterCaretSymbolInReturn [
	^ DefaultPrettyPrintContext numberOfSpacesAfterCaretSymbolInReturn
]

{ #category : #accessing }
BIEnlumineurFormatter class >> numberOfSpacesAfterCaretSymbolInReturn: anInteger [
	DefaultPrettyPrintContext numberOfSpacesAfterCaretSymbolInReturn: anInteger.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurFormatter class >> numberOfSpacesBeforeDotInDynamicArray [
	^ DefaultPrettyPrintContext numberOfSpacesBeforeDotInDynamicArray
]

{ #category : #accessing }
BIEnlumineurFormatter class >> numberOfSpacesInIndent [
	^ DefaultPrettyPrintContext numberOfSpacesInIndent
]

{ #category : #accessing }
BIEnlumineurFormatter class >> numberOfSpacesInIndent: anInteger [
	DefaultPrettyPrintContext numberOfSpacesInIndent: anInteger.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurFormatter class >> numberOfSpacesInsideArray [
	^ DefaultPrettyPrintContext numberOfSpacesInsideArray
]

{ #category : #accessing }
BIEnlumineurFormatter class >> numberOfSpacesInsideArray: anInteger [
	DefaultPrettyPrintContext numberOfSpacesInsideArray: anInteger.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurFormatter class >> numberOfSpacesInsideBlock [
	^ DefaultPrettyPrintContext numberOfSpacesInsideBlock
]

{ #category : #accessing }
BIEnlumineurFormatter class >> numberOfSpacesInsideBlock: anInteger [
	DefaultPrettyPrintContext numberOfSpacesInsideBlock: anInteger.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurFormatter class >> numberOfSpacesInsideParentheses [
	^ DefaultPrettyPrintContext numberOfSpacesInsideParentheses
]

{ #category : #accessing }
BIEnlumineurFormatter class >> numberOfSpacesInsideParentheses: anInteger [
	DefaultPrettyPrintContext numberOfSpacesInsideParentheses: anInteger.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurFormatter class >> oneLineMessages [
	^ DefaultPrettyPrintContext oneLineMessages printString
]

{ #category : #accessing }
BIEnlumineurFormatter class >> oneLineMessages: aString [
	DefaultPrettyPrintContext oneLineMessages: (self compiler evaluate: aString).
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurFormatter class >> periodsAtEndOfBlock [
	^ DefaultPrettyPrintContext periodsAtEndOfBlock
]

{ #category : #accessing }
BIEnlumineurFormatter class >> periodsAtEndOfBlock: aBoolean [
	DefaultPrettyPrintContext periodsAtEndOfBlock: aBoolean.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurFormatter class >> periodsAtEndOfMethod [
	^ DefaultPrettyPrintContext periodsAtEndOfMethod
]

{ #category : #accessing }
BIEnlumineurFormatter class >> periodsAtEndOfMethod: aBoolean [
	DefaultPrettyPrintContext periodsAtEndOfMethod: aBoolean.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurFormatter class >> retainBlankLinesBeforeComments [
	^ DefaultPrettyPrintContext retainBlankLinesBeforeComments
]

{ #category : #accessing }
BIEnlumineurFormatter class >> retainBlankLinesBeforeComments: aBoolean [
	DefaultPrettyPrintContext retainBlankLinesBeforeComments: aBoolean.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurFormatter class >> retainBlankLinesBetweenStatements [
	^ DefaultPrettyPrintContext retainBlankLinesBetweenStatements
]

{ #category : #accessing }
BIEnlumineurFormatter class >> retainBlankLinesBetweenStatements: aBoolean [
	DefaultPrettyPrintContext retainBlankLinesBetweenStatements: aBoolean.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurFormatter class >> selectorAndArgumentCombinedMaxSize [
	^ DefaultPrettyPrintContext selectorAndArgumentCombinedMaxSize
]

{ #category : #accessing }
BIEnlumineurFormatter class >> selectorAndArgumentCombinedMaxSize: anInteger [
	DefaultPrettyPrintContext selectorAndArgumentCombinedMaxSize: anInteger.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurFormatter class >> settingGroup [
	^ #blueInkEnlumineur
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsAlignBlockBrackets: aBuilder [

	(aBuilder setting: #lineUpBlockBrackets)
		label: 'Align block brackets';
		description: 'Place a newLine before closing a multiline block.
This gives a C-like syntax. Pharo 

When lineUpBlockBrackets is true

1 to: 4 do: [ Transcript
		show: i;
		cr
	]

When lineUpBlockBrackets is false
1 to: 4 do: [ Transcript
		show: i;
		cr ]
'
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsFormatCommentWithExpression: aBuilder [
	
	(aBuilder setting: #formatCommentWithStatements)
		label: 'Place comment close to expression';
		description: 'This setting places a comment close to an expression before the separator. 
	
When formatCommentWithStatements is set to true
 1+1."We do an addition" 2+2

When formatCommentWithStatements is set to false
 1+1"We do an addition". 2+2'.
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsIndentStyle:aBuilder [

	(aBuilder pickOne: #indentStyle)
		label: 'Indent Style';
		domainValues:#(#tabulation #space);
		description: 'the represention of an indentation,
		it can be space or tabulation
Exemple:
aBoolean
	ifTrue:[^1]
	ifFalse:[^0] is the result for tabulation.'.
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsIndentsForKeywords: aBuilder [ 
	
	(aBuilder setting: #indentsForKeywords)
		label: 'Indents for keywords';
		description: 'Number of indentations before each keywords of a multiline message . 
For example:
aBoolean:
		ifTrue:[^1]
		ifFalse:[^0]
is the result for 2 indents'.
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsKeepBlockInMessage: aBuilder [
	
	(aBuilder setting: #keepBlockInMessage)
		label: 'Keep block in message';
		description: 'keep the begining of the block on the line of the message
Example:
1 to: 4 do: [ :i | 
		Transcript
			show: i;cr]
		is the result for true
		
1 to: 4 do:
	[ :i | 
	Transcript
		show: i;
		cr ]
		is the result for false'.
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsMaxLineLength: aBuilder [

	(aBuilder setting: #maxLineLength)
		label: 'Max line length';
		description: 'the maximum possible length of a line
For example:
1 + 2 + 3 + 4
	+ 5 + 6
is the result for 14'.
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsMethodSignatureOnMultipleLines: aBuilder [

	(aBuilder setting: #methodSignatureOnMultipleLines)
		label: 'Method signature on multiple lines';
		description: 'Write a multilines method signature on multiple lines only if set to true,
		(a method signature is multilines, depends of the setting selectorAndArgumentCombinedMaxSize).
For example:
myMethod:arg
	foo:bar
is the result if True and if selectorAndArgumentCombinedMaxSize is 6'.
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsMinimumNewLinesBetweenStatements: aBuilder [

	(aBuilder setting: #minimumNewLinesBetweenStatements)
		label: 'Minimum new lines between statements';
		description: 'the number of new lines between each statement
for example:
	1+1.
	
	2+2.
	
	3+3
is the result if the setting is set to 2'.
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsMultiLineMessages: aBuilder [

	(aBuilder setting: #multiLineMessages)
		label: 'Multi line messages';
		description: 'An array containing all the messages that should be written on multiple line
Example:
aBoolean
	ifTrue: [ ^ 1 ]
	ifFalse: [ ^ 0 ]
is the result if #ifTrue:ifFalse is in the array'.
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsNewLineAfterCascade: aBuilder [

	(aBuilder setting: #newLineAfterCascade)
		label: 'New line after cascade';
		description: 'pass a new line after each messages in a cascade
Examples:

OrderedCollection new
	add: 1; add: 2; add: 3
	is the result of the setting is set to false

OrderedCollection new
	add: 1;
	add: 2;
	add: 3
	is the result of the setting is set to true
'.
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsNewLineBeforeFirstCascade: aBuilder [

	(aBuilder setting: #newLineBeforeFirstCascade)
		label: 'New line before cascade';
		description: 'pass a new line before the messages in a cascade
Examples:

OrderedCollection new add: 1;
	add: 2;
	add: 3
	is the result of the setting is set to false

OrderedCollection new
	add: 1;
	add: 2;
	add: 3
	is the result of the setting is set to true'.
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsNewLineBeforeFirstKeyword: aBuilder [

	(aBuilder setting: #newLineBeforeFirstKeyword)
		label: 'New line before first keyword';
		description: 'pass a new line before the first keyword parameter of a message
Examples:

1
between: 0 and: 4
is the result if the setting is set to true
	
1 between: 0 and: 4
is the result if the setting is set to false'.
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsNewLinesAfterMethodComment: aBuilder [

	(aBuilder setting: #newLinesAfterMethodComment)
		label: 'New lines after method comment';
		description: 'number of new lines after the comment of the method
Example:
myMethode
	"myComment"

	^ true
is the result for 2 new lines'
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsNewLinesAfterMethodSignature: aBuilder [

	(aBuilder setting: #newLinesAfterMethodPattern)
		label: 'New lines after method signature';
		description: 'number of new lines after the method signature
Example:
myMethode: arg

	^ true
is the result for 2 new lines'
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsNewLinesAfterTemporaries: aBuilder [

	(aBuilder setting: #newLinesAfterTemporaries)
		label: 'New lines after temporaries';
		description: 'number of new lines after the temporaries declaration
Example:
myMethode
	| a |

	a := 1
is the result for 2 new lines'
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsNumberOfArgumentsForMultiLine: aBuilder [ 
	
	(aBuilder setting: #numberOfArgumentsForMultiLine)
		label: 'Number of arguments for multiLine';
		description: 'Number of argument a message must have to be considered multiline. 
For example:
1
	between: 0
	and: 5
	
 is the result if the setting is set to 2'.
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsNumberOfSpacesInIndent:aBuilder [

	(aBuilder setting: #numberOfSpacesInIndent)
		label: 'Number of spaces in indent';
		description: 'the number of spaces representing an indentation if settingCharacter is set to space
Exemple:
aBoolean
     ifTrue:[^1]
     ifFalse:[^0]
is the result for 5'.
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsOn: aBuilder [
	<systemsettings>
	
	(aBuilder group: self settingGroup)
		target: self;
		parent: #codeBrowsing;
		label: 'Enlumineur Pretty Printer';
		description: 'Settings related to automatic code formatting';
		with: [ self settingsMaxLineLength: aBuilder.
			self settingsFormatCommentWithExpression: aBuilder.
			self settingsIndentStyle: aBuilder.
			self settingsNumberOfSpacesInIndent: aBuilder.
			self settingsIndentsForKeywords: aBuilder.
			self settingsKeepBlockInMessage: aBuilder.
			self settingsAlignBlockBrackets: aBuilder.
			self settingsMethodSignatureOnMultipleLines: aBuilder.
			self settingsOneLineMessages: aBuilder.
			self settingsMultiLineMessages: aBuilder.
			self settingsMinimumNewLinesBetweenStatements: aBuilder.
			self settingsNewLineAfterCascade: aBuilder.
			self settingsNewLineBeforeFirstCascade: aBuilder.
			self settingsNewLineBeforeFirstKeyword: aBuilder.
			self settingsNewLinesAfterMethodComment: aBuilder.
			self settingsNewLinesAfterMethodSignature: aBuilder.
			self settingsNewLinesAfterTemporaries: aBuilder.
			self settingsNumberOfArgumentsForMultiLine: aBuilder.
			self settingsPeriodsAtEndOfBlock: aBuilder.
			self settingsPeriodsAtEndOfMethod: aBuilder.
			self settingsRetainBlankLinesBeforeComments: aBuilder.
			self settingsRetainBlankLinesBetweenStatements: aBuilder.
			self settingsSelectorAndArgumentCombinedMaxSize: aBuilder.
			self settingsSpacesAfterCaretSymbolInReturn: aBuilder.
			self settingsSpacesInsideBlocks: aBuilder.
			self settingsSpacesInsideParentheses: aBuilder.
			self settingsSpacesInsideArray: aBuilder.
			self settingsTraditionalBinaryPrecedenceArray: aBuilder.
			self settingsUseBasicCommentFormat: aBuilder.
			self settingsUseTraditionalBinaryPrecedenceForParentheses: aBuilder ]
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsOneLineMessages: aBuilder [

	(aBuilder setting: #oneLineMessages)
		label: 'One line messages';
		description: 'An array containing all the messages that should be written on one line
Example:
1 to: 4 do: [ :i | Transcript show: i ] is the result if #to:do: is in the array'.
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsPeriodsAtEndOfBlock: aBuilder [

	(aBuilder setting: #periodsAtEndOfBlock)
		label: 'Period at end of block';
		description: 'put a period after the last expression of a block
for example:
	1 to:10 do: [:i | i+1.]
	is the result if the setting is set to true
'.
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsPeriodsAtEndOfMethod: aBuilder [

	(aBuilder setting: #periodsAtEndOfMethod)
		label: 'Period at end of method';
		description: 'put a period after the last expression of a method
for example:
myMethode
	^ true.
	is the result if the setting is set to true
'
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsRetainBlankLinesBeforeComments: aBuilder [

	(aBuilder setting: #retainBlankLinesBeforeComments)
		label: 'Retain blank lines before comments';
		description: 'keep the blank lines which are before the comments 
for example:
	|a b|
	a :=1.
	
	"Comment"
	b :=2
	will not be modified if the setting is set to true'
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsRetainBlankLinesBetweenStatements: aBuilder [

	(aBuilder setting: #retainBlankLinesBetweenStatements)
		label: 'Retain blank lines between statements';
		description: 'Keep the blank lines which are between the statements
for example:
| a b c |
a := 1.


b := 2.

c := a + b
will not change if the setting is set to true'
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsSelectorAndArgumentCombinedMaxSize: aBuilder [

	(aBuilder setting: #selectorAndArgumentCombinedMaxSize)
		label: 'Selector and argument combined in method signature max size';
		description: 'the maximum length a selector and his argument can be before the message is considered multiline
		(depend of the setting methodSignatureOnMultipleLines 
		which will write the message on multiple lines only if is set to true)
Example:
myMethod: argument1
	and: argument2
	is the result if the max size settings is 12 or less
	and methodSignatureOnMultipleLines is set to true'
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsSpacesAfterCaretSymbolInReturn: aBuilder [ 

	(aBuilder setting: #numberOfSpacesAfterCaretSymbolInReturn)
		label: 'Spaces following caret symbol in return';
		description: 'Number of spaces expressed as a string that is put just after the caret (^) of a return expression. 
For example: ^   self is the result for 3 spaces'.
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsSpacesBeforeDotInDynamicArray: aBuilder [

	(aBuilder setting: #numberOfSpacesBeforeDotInDynamicArray)
		label: 'Spaces before dot in dynamic array';
		description: 'number of spaces after the opening and before the closing () {}) symbols of the array
for example: {1 . 2 . 3} is the result of 1 space, while {1. 2. 3} is the result of zero space.'
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsSpacesInsideArray: aBuilder [

	(aBuilder setting: #numberOfSpacesInsideArray)
		label: 'Spaces inside array';
		description: 'number of spaces after the opening and before the closing symbols of the array
for example:
#(   1 2 3   )
{   1. 2. 3.   }
	is the result of 3 spaces
'
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsSpacesInsideBlocks: aBuilder [

	(aBuilder setting: #numberOfSpacesInsideBlock)
		label: 'Spaces inside blocks';
		description: 'number of spaces after the opening bracket and before the closing bracket
for example:
[   :i | Transcript show:i   ]
	is the result of 3 spaces
'
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsSpacesInsideParentheses: aBuilder [

	(aBuilder setting: #numberOfSpacesInsideParentheses)
		label: 'Spaces inside parentheses';
		description: 'number of spaces after the opening parenthese and before the closing parenthese
for example: (   1 + 2   ) is the result for 3 spaces'
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsTraditionalBinaryPrecedenceArray: aBuilder [
	
	self flag: #toRevisit.
	"this is not a nice comment I do not care that this is an array!"
	
	(aBuilder setting: #traditionalBinaryPrecedenceArray)
		label: 'Traditional binary precedence';
		description: 'An 2 dimension array containing messages according to the priority
Example: #( #($- $+) #($*) )'
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsUseBasicCommentFormat: aBuilder [

	self flag: #toRevisit.
	"this is not a nice comment"
	(aBuilder setting: #useBasicCommentFormat)
		label: 'Use basic comment format';
		description:'leave the comment unchanged
Exemple:
"   anAddition   " is the result for true
'
]

{ #category : #settings }
BIEnlumineurFormatter class >> settingsUseTraditionalBinaryPrecedenceForParentheses: aBuilder [

	(aBuilder setting: #useTraditionalBinaryPrecedenceForParentheses)
		label: 'Use traditional binary precedence for parentheses';
		description:'Add parentheses to comply with the precedence
for example 1 + 2 * 3 will be formated: (1 + 2) * 3'
]

{ #category : #accessing }
BIEnlumineurFormatter class >> spacesAfterCaretSymbolInReturn [
	^ DefaultPrettyPrintContext spacesAfterCaretSymbolInReturn
]

{ #category : #accessing }
BIEnlumineurFormatter class >> spacesInsideBlocks [
	^ DefaultPrettyPrintContext spacesInsideBlocks
]

{ #category : #accessing }
BIEnlumineurFormatter class >> spacesInsideParentheses [
	^ DefaultPrettyPrintContext spacesInsideParentheses
]

{ #category : #accessing }
BIEnlumineurFormatter class >> traditionalBinaryPrecedenceArray [
	^ DefaultPrettyPrintContext traditionalBinaryPrecedenceArray printString 
]

{ #category : #accessing }
BIEnlumineurFormatter class >> traditionalBinaryPrecedenceArray: aString [
	DefaultPrettyPrintContext traditionalBinaryPrecedenceArray: (self compiler evaluate: aString).
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurFormatter class >> useBasicCommentFormat [
	^ DefaultPrettyPrintContext useBasicCommentFormat
]

{ #category : #accessing }
BIEnlumineurFormatter class >> useBasicCommentFormat: aBoolean [
	DefaultPrettyPrintContext useBasicCommentFormat: aBoolean.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurFormatter class >> useTraditionalBinaryPrecedenceForParentheses [
	^ DefaultPrettyPrintContext useTraditionalBinaryPrecedenceForParentheses
]

{ #category : #accessing }
BIEnlumineurFormatter class >> useTraditionalBinaryPrecedenceForParentheses: aBoolean [
	DefaultPrettyPrintContext useTraditionalBinaryPrecedenceForParentheses: aBoolean.
	self announceASettingChange
]

{ #category : #private }
BIEnlumineurFormatter >> addNewLinesBeforeStatementStartingAt: anInteger [ 
	| newLines |
	newLines := self minimumNewLinesBetweenStatements 
				max: (self retainBlankLinesBetweenStatements 
						ifTrue: [ self newLinesBeforeStartingAt: anInteger ]
						ifFalse: [ 0 ]).
	newLines = 0 
		ifTrue: [ self space ] 
		ifFalse: [ self newLines: newLines ] 
]

{ #category : #private }
BIEnlumineurFormatter >> addSpaceIfNeededForLastArgument: aPragmaNode [
	aPragmaNode isUnary
		ifTrue: [ ^ self ].
	(self pragmaArgumentNeedsSeparator: aPragmaNode arguments last)
		ifTrue: [ self space ]
]

{ #category : #private }
BIEnlumineurFormatter >> basicFormatCommentFor: aComment [
	codeStream nextPutAll: (originalSource copyFrom: aComment start to: aComment stop).
]

{ #category : #private }
BIEnlumineurFormatter >> bracketWith: bracketString around: aBlock [
	bracketString isEmpty
		ifTrue: [ ^ aBlock value ].
	codeStream nextPut: bracketString first.
	^ aBlock
		ensure: [ codeStream nextPut: bracketString last ] 
]

{ #category : #private }
BIEnlumineurFormatter >> bracketWith: bracketString around: aBlock indentExtraSpaces: anInteger [
	bracketString isEmpty
		ifTrue: [ ^ aBlock value ].
	codeStream nextPut: bracketString first.
	^ [self indentExtraSpaces: anInteger  around:  aBlock]
		ensure: [ codeStream nextPut: bracketString last ] 
]

{ #category : #private }
BIEnlumineurFormatter >> characterSeparatorMethodSignatureFor: aMethodNode [
	^ (self needsMethodSignatureOnMultipleLinesFor: aMethodNode)
			ifTrue: [ self newLine ]
			ifFalse: [ self space ]
]

{ #category : #accessing }
BIEnlumineurFormatter >> codeStream [
	^ codeStream
]

{ #category : #accessing }
BIEnlumineurFormatter >> codeStream: anObject [
	codeStream := anObject
]

{ #category : #private }
BIEnlumineurFormatter >> currentLineLength [
	^ codeStream position - lineStart
]

{ #category : #'private-formatting' }
BIEnlumineurFormatter >> firstSeparatorShouldNotPassLine: aMessageNode [
"predicat that tell if the keyWord should be forced te be on the sameLine"

	^ aMessageNode isKeyword
				and: [ aMessageNode arguments size <= 1
						or: [ self newLineBeforeFirstKeyword not ] ]
]

{ #category : #'public interface' }
BIEnlumineurFormatter >> format: aParseTree [
	codeStream := self initializeCodeStream.
	originalSource := aParseTree source.
	self visitNode: aParseTree.
	^ codeStream contents
]

{ #category : #'private-formatting' }
BIEnlumineurFormatter >> formatArray: anArrayNode [
	| current |
	codeStream nextPutAll: self spacesInsideArray.
	(anArrayNode statements
		reject: [ :each | each class = RBLiteralValueNode ])
		ifEmpty: [ anArrayNode statements
				do: [ :each | 
					current := each.
					self visitNode: each ]
				separatedBy: [ (self isLineTooLongWithNode: current)
						ifTrue: [ codeStream nextPut: $..
							self newLine ]
						ifFalse: [ codeStream nextPutAll: self spacesBeforeDotInDynamicArray ; nextPutAll: '. ' ] 
						"here there is something wrong since we should also be able to put a space in front"] ]
		ifNotEmpty: [ anArrayNode statements size > 1
				ifTrue: [ self
						indentAround: [ 
							"I do not get why we do not have a property to decide if we emit or not the line" 
							"with the introduction of formatArrayBody: we may remove formatSingleArrayElement"
							self
								newLine;
								formatArrayBody: anArrayNode ] ]
				ifFalse: [ self formatSingleArrayElement: anArrayNode statements first ] ].
	codeStream nextPutAll: self spacesInsideArray
]

{ #category : #'private-formatting' }
BIEnlumineurFormatter >> formatArrayBody: aSequenceNode [
	| statements |
	statements := aSequenceNode statements.
	statements isEmpty
		ifTrue: [ ^ self ].
	statements withIndexDo: [:statement :i | 
		self visitNode: statement.
		i < statements size
			ifTrue: [ codeStream nextPut: $. ].
		self formatStatementCommentsFor: statement.
		i < statements size
			ifTrue: [ self addNewLinesBeforeStatementStartingAt: (statements at: i + 1) start ] ]
]

{ #category : #'private-formatting' }
BIEnlumineurFormatter >> formatBlock: aBlockNode [
	| isMultiline |
	isMultiline := self 
		willBeMultiline: aBlockNode body 
		saveIn: lookaheadCode.
	codeStream nextPutAll: self spacesInsideBlocks.
	self formatBlockArgumentsFor: aBlockNode.
	self formatBlockCommentFor: aBlockNode.
	((isMultiline or: [ self isLineTooLongWithNode: aBlockNode body ]) 
		 and: [ self shouldPassNewLineAfterHeadOfBlock: aBlockNode ]) 
		ifTrue: [ self newLine ].
	self visitSequenceNode: aBlockNode body.
	(self lineUpBlockBrackets and: [ isMultiline ])
		ifTrue: [ self newLine ]
		ifFalse: [ codeStream nextPutAll: self spacesInsideBlocks ]
]

{ #category : #'private-formatting' }
BIEnlumineurFormatter >> formatBlockArgumentsFor: aBlockNode [
	aBlockNode arguments isEmpty
		ifTrue: [ ^ self ].
	aBlockNode arguments
		do: [ :each | 
			(self isLineTooLongWithNode: each )ifTrue: [self newLine ].
			codeStream nextPut: $:.
			self visitNode: each.
			self formatCommentWithStatements
				ifTrue:
					[ self spaceAndFormatComments: each ].
			self space ].
	codeStream nextPutAll: '| '.
]

{ #category : #'private-formatting' }
BIEnlumineurFormatter >> formatBlockCommentFor: aBlockNode [
	originalSource isNil
		ifTrue: [  ^ self ].
	aBlockNode comments
		do: [ :each | 
			
			self basicFormatCommentFor: each.
			(self isNonEmptySingleLineBlock: aBlockNode)
				ifTrue: [  self space ]]
]

{ #category : #accessing }
BIEnlumineurFormatter >> formatCommentWithStatements [
	^ context formatCommentWithStatements
]

{ #category : #accessing }
BIEnlumineurFormatter >> formatCommentWithStatements: aBoolean [
	context formatCommentWithStatements: aBoolean
]

{ #category : #'private-formatting' }
BIEnlumineurFormatter >> formatCommentsFor: aNode [
	originalSource isNil
		ifTrue: [ ^ self ].
	aNode comments
		do:
			[ :each | 
			self basicFormatCommentFor: each.
			]
]

{ #category : #private }
BIEnlumineurFormatter >> formatMessageNodeInAMessageStreamFor: aMessageNode [
	| messageStream |
	messageStream := WriteStream on: (String new: 100).
	self
		with: aMessageNode selectorParts
		and: aMessageNode arguments
		do: [ :selector :arg | 
			messageStream
				nextPutAll: selector;
				space;
				nextPutAll: (self formattedSourceFor: arg withDictionary: temporaryLookAheadCode) ]
		separatedBy: [ messageStream space ].
		^ messageStream 
]

{ #category : #'private-formatting' }
BIEnlumineurFormatter >> formatMethodBodyFor: aMethodNode [
	self
		indentAround:
			[ 
			self newLines: self newLinesAfterMethodPattern.
			self formatMethodCommentFor: aMethodNode.
			self formatPragmasFor: aMethodNode.
			self visitNode: aMethodNode body ]
]

{ #category : #'private-formatting' }
BIEnlumineurFormatter >> formatMethodCommentFor: aMethodNode [
	originalSource isNil
		ifTrue: [ ^ self ].
	aMethodNode comments
		do:
			[ :each | 
			
			self useBasicCommentFormat 
			ifTrue: [ self basicFormatCommentFor: each ]
			ifFalse: [ 
			self resizeCommentFor: each startingAt: 0].
			self newLines: self newLinesAfterMethodComment ]
]

{ #category : #'private-formatting' }
BIEnlumineurFormatter >> formatMethodPatternFor: aMethodNode [
	aMethodNode arguments isEmpty
		ifTrue: [ codeStream nextPutAll: aMethodNode selector ]
		ifFalse: [ 
			(self needsMethodSignatureOnMultipleLinesFor: aMethodNode)
				ifTrue: [ self privateFormatMethodPatternMultiLineFor: aMethodNode ]
				ifFalse: [ self privateFormatMethodPatternMonoLineFor: aMethodNode ] ]
]

{ #category : #'private-formatting' }
BIEnlumineurFormatter >> formatPragmasFor: aMethodNode [
	aMethodNode pragmas do: [ :each | self visitNode: each; newLine ]
]

{ #category : #'private-formatting' }
BIEnlumineurFormatter >> formatSelectorAndArguments: aMessageNode [
	"We are formatting a message and here we are about to format the message selector and its arguments."
	
	| isMultilineMessage hasMutlineArguments multilineArgumentBeforeAnotherArgument |
	multilineArgumentBeforeAnotherArgument := self messageHasMultilineArgumentBeforeAnotherArgument: aMessageNode.
	isMultilineMessage := (self isMultiLineMessage: aMessageNode) or:[multilineArgumentBeforeAnotherArgument].
	hasMutlineArguments := self hasAMultiLineMessageArgument: aMessageNode arguments.
	self
		indent:
			(((isMultilineMessage or:[hasMutlineArguments]) and:[aMessageNode isKeyword])
				ifTrue: [ self indentsForKeywords ]
				ifFalse: [ 0 ])
		around: [ self
				formatSelectorAndArguments: aMessageNode
				firstSeparator:
					(((self firstSeparatorShouldNotPassLine: aMessageNode) and:[multilineArgumentBeforeAnotherArgument not])
						ifTrue: [ self space ]
						ifFalse: [ isMultilineMessage
								ifTrue: [ [ self newLine ] ]
								ifFalse: [ [ self space ] ] ])
				restSeparator:
					((isMultilineMessage)
						ifTrue: [ [ self newLine ] ]
						ifFalse: [ [ self space ] ]) ]
]

{ #category : #'private-formatting' }
BIEnlumineurFormatter >> formatSelectorAndArguments: aMessageNode firstSeparator: firstBlock restSeparator: restBlock [
	| separatorBlock i|
	i := 0.
	separatorBlock := firstBlock.
	aMessageNode isUnary
		ifTrue: [ 
				self indentAround: [self handleLineForSelector: aMessageNode selector withSeparatorBlock:
					separatorBlock.
				codeStream nextPutAll: aMessageNode selector ]]
		ifFalse: [
			aMessageNode selectorParts with: aMessageNode arguments do: [ :selector :argument | 
				i := i + 1.
				self
					handleLineForSelector: selector
					withSeparatorBlock: separatorBlock.
				separatorBlock := restBlock.
				self
					indent:
						((((self willBeMultiline: argument saveIn: temporaryLookAheadCode) and: [ i < aMessageNode selectorParts size or: [ self newLineBefore ] ])
						or:[ self isInCascadeNode ])
							ifTrue: [ 1 ] ifFalse: [ 0 ])
					around: [ codeStream nextPutAll: selector.
						self handleLineForArgument: argument ].
				((self willBeMultiline: argument saveIn: lookaheadCode) and:[i < aMessageNode selectorParts size]) ifTrue: [ separatorBlock := self newLine ]
			]
		]
]

{ #category : #'private-formatting' }
BIEnlumineurFormatter >> formatSequenceNodeStatementsFor: aSequenceNode [
	| statements |
	statements := aSequenceNode statements.
	statements isEmpty
		ifTrue: [ ^ self ].
	statements withIndexDo: [:statement :i | 
		self visitNode: statement.
		(i < statements size
			or: [ 
				aSequenceNode parent
					ifNil: [ self periodsAtEndOfBlock or:[ self periodsAtEndOfMethod ] ]
					ifNotNil: [ :parent | 
						parent isBlock
							ifTrue: [ self periodsAtEndOfBlock ]
							ifFalse: [ self periodsAtEndOfMethod ] ] ])
			ifTrue: [ codeStream nextPut: $. ].
		self formatStatementCommentsFor: statement.
		i < statements size
			ifTrue: [ self addNewLinesBeforeStatementStartingAt: (statements at: i + 1) start ] ]
]

{ #category : #visiting }
BIEnlumineurFormatter >> formatSingleArrayElement: aRBNode [ 
	"Imagine that you have {1 factorial}, you do not want an ending period. This method is only invoked on the last array element."
	
	self visitNode: aRBNode
]

{ #category : #'private-formatting' }
BIEnlumineurFormatter >> formatStatementCommentsFor: aStatementNode [
	originalSource isNil
		ifTrue: [ ^ self ].
	self formatCommentWithStatements
		ifFalse: [ ^ self ].
	aStatementNode statementComments
		do:
			[ :each | 
			| count |
			count := self newLinesBeforeStartingAt: each start.
			self retainBlankLinesBeforeComments & (count > 0)
				ifTrue: [ self newLines: count ]
				ifFalse: [ self space ].
			self useBasicCommentFormat
				ifTrue: [ self basicFormatCommentFor: each ]
				ifFalse: [ 
			self resizeCommentFor: each startingAt: self currentLineLength ]]
]

{ #category : #private }
BIEnlumineurFormatter >> formatTemporariesFor: aSequenceNode [
	aSequenceNode temporaries isEmpty
		ifTrue: [ ^ self ].
	self
		bracketWith: '|'
		around:
			[ 
			self space.
			aSequenceNode temporaries
				do:
					[ :each | 
					self visitNode: each.
					self formatCommentWithStatements
						ifTrue: [ self formatStatementCommentsFor: each ].
					self space ] ].
	self newLines: self newLinesAfterTemporaries
]

{ #category : #private }
BIEnlumineurFormatter >> formattedSourceFor: aNode withDictionary: aDictionary [
	^ aDictionary at: aNode ifAbsentPut: [ 
		  self class new
			  indent: self indent;
			  installNewContext: context;
			  format: aNode ]
]

{ #category : #private }
BIEnlumineurFormatter >> handleLineForArgument: anArgument [
	| isLineTooLong |
	isLineTooLong := self isLineTooLongWithNode: anArgument.
	anArgument isBlock
		ifTrue: [((self willBeMultiline: anArgument saveIn: temporaryLookAheadCode)
						and: [ self keepBlockInMessage not ])
				ifTrue: [ self newLine ]
				ifFalse: [ self space ] ]
		ifFalse: [ (self isInCascadeNode and: [ isLineTooLong ])
				ifTrue: [ self newLine ]
				ifFalse: [ isLineTooLong
						ifTrue: [ self newLine ]
						ifFalse: [ self space ] ] ].
	self visitNode: anArgument
]

{ #category : #private }
BIEnlumineurFormatter >> handleLineForSelector: selector withSeparatorBlock: aBlock [
	(self isLineTooLongWithString: selector)
		ifTrue: [ self newLine ]
		ifFalse: [ aBlock value ]
]

{ #category : #private }
BIEnlumineurFormatter >> hasAMultiLineMessageArgument: anArgumentsCollection [
	^ anArgumentsCollection
		anySatisfy: [ :each | 
			self isInCascadeNode
				ifTrue: [ self indent: 0 around: [ self willBeMultiline: each  saveIn: temporaryLookAheadCode ] ]
				ifFalse: [ 
					self
						indent: self indentsForKeywords + 1
						around: [ self willBeMultiline: each  saveIn: temporaryLookAheadCode ] ] ]
]

{ #category : #private }
BIEnlumineurFormatter >> headOfBlockNotEmpty: aBlockNode [

	^ aBlockNode arguments isNotEmpty	or: [aBlockNode comments isNotEmpty]
]

{ #category : #accessing }
BIEnlumineurFormatter >> indent [
	^ indent
]

{ #category : #accessing }
BIEnlumineurFormatter >> indent: anInteger [

	indent := anInteger
]

{ #category : #private }
BIEnlumineurFormatter >> indent: anInteger around: aBlock [ 
	self indent: self indent + anInteger.
	^aBlock ensure: [self indent: self indent - anInteger]
]

{ #category : #private }
BIEnlumineurFormatter >> indentAround: aBlock [ 
	self indent: 1 around: aBlock
]

{ #category : #accessing }
BIEnlumineurFormatter >> indentExtraSpaces [
	^ context indentExtraSpaces
]

{ #category : #accessing }
BIEnlumineurFormatter >> indentExtraSpaces: anInteger [
	context indentExtraSpaces: anInteger 
]

{ #category : #private }
BIEnlumineurFormatter >> indentExtraSpaces: anInteger around: aBlock [
	| previousIndentExtraSpacesSize |
	previousIndentExtraSpacesSize := self indentExtraSpaces size.
	self indentExtraSpaces: anInteger + previousIndentExtraSpacesSize.
	aBlock
		ensure: [ self indentExtraSpaces: previousIndentExtraSpacesSize ]
]

{ #category : #accessing }
BIEnlumineurFormatter >> indentString [
	^ context indentString
]

{ #category : #accessing }
BIEnlumineurFormatter >> indentStyle [
	^ context indentStyle
]

{ #category : #accessing }
BIEnlumineurFormatter >> indentStyle: aSymbole [
	context indentStyle: aSymbole
]

{ #category : #accessing }
BIEnlumineurFormatter >> indentTimesRepeat: anInteger [
	
	anInteger timesRepeat: 
			[ codeStream nextPutAll: self indentString ].
	codeStream nextPutAll: self indentExtraSpaces
]

{ #category : #accessing }
BIEnlumineurFormatter >> indentsForKeywords [
	^ context indentsForKeywords
]

{ #category : #accessing }
BIEnlumineurFormatter >> indentsForKeywords: anInteger [
	context indentsForKeywords: anInteger
]

{ #category : #initialization }
BIEnlumineurFormatter >> initialize [
	super initialize.
	lineStart := 0.
	self indent: 0.
	self isInCascadeNode: false.
	lookaheadCode := self initializeLookAheadCode.
	temporaryLookAheadCode := self initializeLookAheadCode.
	codeStream := self initializeCodeStream.
	context := DefaultPrettyPrintContext
]

{ #category : #initialization }
BIEnlumineurFormatter >> initializeCodeStream [
	^ WriteStream on: (String new: 256)
]

{ #category : #initialization }
BIEnlumineurFormatter >> initializeLookAheadCode [
	^ IdentityDictionary new
]

{ #category : #'public interface' }
BIEnlumineurFormatter >> installNewContext: aContext [

	context := aContext.
	lookaheadCode := self initializeLookAheadCode
]

{ #category : #accessing }
BIEnlumineurFormatter >> isInCascadeNode [
	^ isInCascadeNode
]

{ #category : #accessing }
BIEnlumineurFormatter >> isInCascadeNode: aBoolean [
	isInCascadeNode := aBoolean
]

{ #category : #private }
BIEnlumineurFormatter >> isLineTooLongWithNode: aNode [
	^ self isLineTooLongWithString: (self formattedSourceFor: aNode withDictionary: temporaryLookAheadCode ).
]

{ #category : #private }
BIEnlumineurFormatter >> isLineTooLongWithString: aString [
	^ self currentLineLength
		+ (aString indexOf: Character cr ifAbsent: [ aString size ])
		>= self maxLineLength
]

{ #category : #private }
BIEnlumineurFormatter >> isMultiLineMessage: aMessageNode [
	(self multiLineMessages includes: aMessageNode selector)
		ifTrue: [ ^ true ].
	(self oneLineMessages includes: aMessageNode selector)
		ifTrue: [ ^ false ].
	self numberOfArgumentsForMultiLine <= aMessageNode arguments size
		ifTrue: [ ^ true ].
	aMessageNode isUnary
		ifTrue: [ ^ self isLineTooLongWithString: aMessageNode selector ].
	^ self isLineTooLongWithString: (self formatMessageNodeInAMessageStreamFor: aMessageNode) contents
]

{ #category : #private }
BIEnlumineurFormatter >> isNonEmptySingleLineBlock: aBlockNode [
	^ ((self willBeMultiline: aBlockNode body saveIn: temporaryLookAheadCode ) or: [ aBlockNode body statements isEmpty ]) not
]

{ #category : #accessing }
BIEnlumineurFormatter >> keepBlockInMessage [
	^ context keepBlockInMessage
]

{ #category : #accessing }
BIEnlumineurFormatter >> keepBlockInMessage: aBoolean [
	context keepBlockInMessage: aBoolean
]

{ #category : #accessing }
BIEnlumineurFormatter >> lineStart [
	^ lineStart
]

{ #category : #accessing }
BIEnlumineurFormatter >> lineStart: anObject [
	lineStart := anObject
]

{ #category : #accessing }
BIEnlumineurFormatter >> lineUpBlockBrackets [
	^ context lineUpBlockBrackets
]

{ #category : #accessing }
BIEnlumineurFormatter >> lineUpBlockBrackets: aBoolean [
	context lineUpBlockBrackets: aBoolean
]

{ #category : #accessing }
BIEnlumineurFormatter >> maxLineLength [
	^ context maxLineLength
]

{ #category : #accessing }
BIEnlumineurFormatter >> maxLineLength: anInteger [
	context maxLineLength: anInteger
]

{ #category : #private }
BIEnlumineurFormatter >> messageHasMultilineArgumentBeforeAnotherArgument: aMessageNode [ 

	aMessageNode arguments doWithIndex: [ :each :i |
		(self willBeMultiline: each saveIn: temporaryLookAheadCode)
			ifTrue: [ ^ i < aMessageNode arguments size ]].
	^ false
]

{ #category : #accessing }
BIEnlumineurFormatter >> methodSignatureOnMultipleLines [
	^ context methodSignatureOnMultipleLines
]

{ #category : #accessing }
BIEnlumineurFormatter >> methodSignatureOnMultipleLines: aBoolean [
	context methodSignatureOnMultipleLines: aBoolean
]

{ #category : #accessing }
BIEnlumineurFormatter >> minimumNewLinesBetweenStatements [
	^ context minimumNewLinesBetweenStatements
]

{ #category : #accessing }
BIEnlumineurFormatter >> minimumNewLinesBetweenStatements: anInteger [
	context minimumNewLinesBetweenStatements: anInteger
]

{ #category : #accessing }
BIEnlumineurFormatter >> multiLineMessages [
	^ context multiLineMessages
]

{ #category : #accessing }
BIEnlumineurFormatter >> multiLineMessages: anArray [
	context multiLineMessages: anArray
]

{ #category : #private }
BIEnlumineurFormatter >> needsMethodSignatureOnMultipleLinesFor: aMethodNode [
	| cpt |
	cpt := 0.
	self methodSignatureOnMultipleLines
		ifTrue:
			[ 
			aMethodNode selectorParts
				with: aMethodNode arguments
				do:
					[ :key :arg | 
					key size + arg name size > self selectorAndArgumentCombinedMaxSize
						ifTrue: [ cpt := cpt + 1 ] ].
			^ cpt > 1 ]
		ifFalse: [ ^ false ]
]

{ #category : #private }
BIEnlumineurFormatter >> needsParenthesisFor: aNode [
	| parent grandparent |
	aNode ifNil: [ ^ false ].
	aNode isValue
		ifFalse: [ ^ false ].
	aNode isParseError ifTrue: [ ^false ].
	parent := aNode parent ifNil: [ ^ false ].
	(aNode isMessage and: [ 
		parent isMessage and: [ 
		parent receiver == aNode and:[
		aNode selector isUnary not ] ] ])
		ifTrue: [ 
			grandparent := parent parent.
			(grandparent notNil and: [ grandparent isCascade ])
				ifTrue: [ ^ true ] ].
	aNode precedence < parent precedence
		ifTrue: [ ^ false ].
	(aNode isAssignment and: [ parent isAssignment ])
		ifTrue: [ ^ false ].
	(aNode isAssignment and: [ aNode isCascade ])
		ifTrue: [ ^ true ].
	aNode precedence = 0
		ifTrue: [ ^ false ].
	aNode isMessage
		ifFalse: [ ^ true ].
	aNode isUnary
		ifTrue: [ ^ false ].
	aNode isKeyword
		ifTrue: [ ^ true ].
	(parent isMessage and: [ parent receiver == aNode ])
		ifFalse: [ ^ true ].
	aNode precedence = parent precedence
		ifFalse: [ ^ true ].
	^ self useTraditionalBinaryPrecedenceForParentheses
		and: [ self precedenceOf: parent selector greaterThan: aNode selector ]
]

{ #category : #private }
BIEnlumineurFormatter >> newLine [
	self newLines: 1
]

{ #category : #accessing }
BIEnlumineurFormatter >> newLineAfterCascade [
	^ context newLineAfterCascade
]

{ #category : #accessing }
BIEnlumineurFormatter >> newLineAfterCascade: aBoolean [
	context newLineAfterCascade: aBoolean
]

{ #category : #private }
BIEnlumineurFormatter >> newLineBefore [
	"predicate which return true if there where a newLine in the code stream just before the current position"

	| currentIndentationString |
	currentIndentationString := WriteStream on: (String new: self maxLineLength).
	1 to: self indent do: [ :i | 
		currentIndentationString nextPutAll: self indentString ].
	currentIndentationString nextPutAll: self indentExtraSpaces.
	^ self codeStream contents lines last = currentIndentationString contents
]

{ #category : #accessing }
BIEnlumineurFormatter >> newLineBeforeFirstCascade [
	^ context newLineBeforeFirstCascade
]

{ #category : #accessing }
BIEnlumineurFormatter >> newLineBeforeFirstCascade: aBoolean [
	context newLineBeforeFirstCascade: aBoolean
]

{ #category : #accessing }
BIEnlumineurFormatter >> newLineBeforeFirstKeyword [
	^ context newLineBeforeFirstKeyword
]

{ #category : #accessing }
BIEnlumineurFormatter >> newLineBeforeFirstKeyword: aBoolean [
	context newLineBeforeFirstKeyword: aBoolean
]

{ #category : #private }
BIEnlumineurFormatter >> newLines: anInteger [
	anInteger + self indentString size = 0
		ifTrue: 
			[ codeStream space ].
	anInteger
		timesRepeat: 
			[ codeStream cr ].
	lineStart := codeStream position.
	self
		indentTimesRepeat: self indent
]

{ #category : #accessing }
BIEnlumineurFormatter >> newLinesAfterMethodComment [
	^ context newLinesAfterMethodComment
]

{ #category : #accessing }
BIEnlumineurFormatter >> newLinesAfterMethodComment: anInteger [
	context newLinesAfterMethodComment: anInteger
]

{ #category : #accessing }
BIEnlumineurFormatter >> newLinesAfterMethodPattern [
	^ context newLinesAfterMethodPattern
]

{ #category : #accessing }
BIEnlumineurFormatter >> newLinesAfterMethodPattern: anInteger [
	context newLinesAfterMethodPattern: anInteger
]

{ #category : #accessing }
BIEnlumineurFormatter >> newLinesAfterTemporaries [
	^ context newLinesAfterTemporaries
]

{ #category : #accessing }
BIEnlumineurFormatter >> newLinesAfterTemporaries: anInteger [
	context newLinesAfterTemporaries: anInteger
]

{ #category : #private }
BIEnlumineurFormatter >> newLinesBeforeStartingAt: anIndex [
	| count cr lf index char |
	originalSource ifNil: [ ^ 0 ].
	(anIndex isNil or: [ anIndex > originalSource size ])
		ifTrue: [ ^ 0 ].
	cr := Character value: 13.
	lf := Character value: 10.
	count := 0.
	index := anIndex - 1.
	[ index > 0 and: [ (char := originalSource at: index) isSeparator ] ]
		whileTrue: [ 
			char == lf
				ifTrue: [ 
					count := count + 1.
					(originalSource at: (index - 1 max: 1)) == cr
						ifTrue: [ index := index - 1 ] ].
			char == cr
				ifTrue: [ count := count + 1 ].
			index := index - 1 ].
	^ count
]

{ #category : #accessing }
BIEnlumineurFormatter >> numberOfArgumentsForMultiLine [
	^ context numberOfArgumentsForMultiLine
]

{ #category : #accessing }
BIEnlumineurFormatter >> numberOfArgumentsForMultiLine: anInteger [
	context numberOfArgumentsForMultiLine: anInteger
]

{ #category : #accessing }
BIEnlumineurFormatter >> numberOfSpacesAfterCaretSymbolInReturn [
	^ context numberOfSpacesAfterCaretSymbolInReturn
]

{ #category : #accessing }
BIEnlumineurFormatter >> numberOfSpacesAfterCaretSymbolInReturn: anInteger [
	context numberOfSpacesAfterCaretSymbolInReturn: anInteger
]

{ #category : #accessing }
BIEnlumineurFormatter >> numberOfSpacesInIndent [
	^ context numberOfSpacesInIndent
]

{ #category : #accessing }
BIEnlumineurFormatter >> numberOfSpacesInIndent: anInteger [
	context numberOfSpacesInIndent: anInteger
]

{ #category : #accessing }
BIEnlumineurFormatter >> numberOfSpacesInsideArray [
	^ context numberOfSpacesInsideArray
]

{ #category : #accessing }
BIEnlumineurFormatter >> numberOfSpacesInsideArray: anInteger [
	context numberOfSpacesInsideArray: anInteger
]

{ #category : #accessing }
BIEnlumineurFormatter >> numberOfSpacesInsideBlock [
	^ context numberOfSpacesInsideBlock
]

{ #category : #accessing }
BIEnlumineurFormatter >> numberOfSpacesInsideBlock: anInteger [
	context numberOfSpacesInsideBlock: anInteger
]

{ #category : #accessing }
BIEnlumineurFormatter >> numberOfSpacesInsideParentheses [
	^ context numberOfSpacesInsideParentheses
]

{ #category : #accessing }
BIEnlumineurFormatter >> numberOfSpacesInsideParentheses: anInteger [
	context numberOfSpacesInsideParentheses: anInteger
]

{ #category : #accessing }
BIEnlumineurFormatter >> oneLineMessages [
	^ context oneLineMessages
]

{ #category : #accessing }
BIEnlumineurFormatter >> oneLineMessages: anArray [
	context oneLineMessages: anArray
]

{ #category : #accessing }
BIEnlumineurFormatter >> periodsAsTerminators [
	^ context periodsAtEndOfBlock and: [ context periodsAtEndOfMethod ]
]

{ #category : #accessing }
BIEnlumineurFormatter >> periodsAsTerminators: aBoolean [
	context periodsAtEndOfBlock: aBoolean.
	context periodsAtEndOfMethod: aBoolean
]

{ #category : #accessing }
BIEnlumineurFormatter >> periodsAtEndOfBlock [
	^ context periodsAtEndOfBlock
]

{ #category : #accessing }
BIEnlumineurFormatter >> periodsAtEndOfBlock: aBoolean [
	context periodsAtEndOfBlock: aBoolean
]

{ #category : #accessing }
BIEnlumineurFormatter >> periodsAtEndOfMethod [
	^ context periodsAtEndOfMethod
]

{ #category : #accessing }
BIEnlumineurFormatter >> periodsAtEndOfMethod: aBoolean [
	context periodsAtEndOfMethod: aBoolean
]

{ #category : #private }
BIEnlumineurFormatter >> pragmaArgumentNeedsSeparator: anArgumentNode [
	^ anArgumentNode value isSymbol and: [ anArgumentNode value isBinary ]
]

{ #category : #private }
BIEnlumineurFormatter >> precedenceOf: parentSelector greaterThan: childSelector [
	"Put parenthesis around things that are preceived to have 'lower' precedence. For example, 'a + b * c' 
	-> '(a + b) * c' but 'a * b + c' -> 'a * b + c'"

	| childIndex parentIndex |
	childIndex := 0.
	parentIndex := 0.
	self traditionalBinaryPrecedenceArray doWithIndex: [ :each :i | 
		(each includes: parentSelector first)
			ifTrue: [ parentIndex := i ].
		(each includes: childSelector first)
			ifTrue: [ childIndex := i ] ].
	^ childIndex < parentIndex
]

{ #category : #private }
BIEnlumineurFormatter >> privateFormatMethodPatternMonoLineFor: aMethodNode [
	self
		with: aMethodNode selectorParts
		and: aMethodNode arguments
		do: [ :key :arg | 
			codeStream nextPutAll: key.
			self space.
			self visitNode: arg ]
		separatedBy: [ self characterSeparatorMethodSignatureFor: aMethodNode ]
]

{ #category : #private }
BIEnlumineurFormatter >> privateFormatMethodPatternMultiLineFor: aMethodNode [
	| selectors arguments |
	arguments := aMethodNode arguments.
	selectors := aMethodNode selectorParts.
	codeStream nextPutAll: selectors first.
	self space.
	self visitNode: arguments first.
	codeStream nextPut: Character cr.
	self
		with: selectors allButFirst
		and: arguments allButFirst
		do: [ :key :arg | 
			codeStream nextPutAll: self indentString.
			codeStream nextPutAll: key.
			self space.
			self visitNode: arg ]
		separatedBy: [ self characterSeparatorMethodSignatureFor: aMethodNode].
	self newLines: 1
]

{ #category : #utilities }
BIEnlumineurFormatter >> resizeComment: aComment withFirstLineShorterOf: anIndex [
	| cutComment firstLine currentCharPos |
	currentCharPos := 1.
	firstLine := (aComment contents
		withNoLineLongerThan: self maxLineLength - anIndex) lineNumber: 1.
	[ currentCharPos > firstLine size ]
		whileFalse: [ codeStream nextPut: (firstLine at: currentCharPos).
			currentCharPos := currentCharPos + 1 ].
	currentCharPos > aComment contents size
		ifTrue: [ ^ self ].
	self newLine.
	cutComment := aComment contents allButFirst: currentCharPos.
	self resizeStringDependingOnWindowSizeFor: cutComment
]

{ #category : #utilities }
BIEnlumineurFormatter >> resizeCommentFor: aComment startingAt: anIndex [
	codeStream nextPut: $".
	"Hack to keep the right comment in pop up like cmd n, cmd m..."
	self maxLineLength < 50
		ifTrue: [ codeStream nextPutAll: aComment contents ]
		ifFalse:
			[ 
			aComment contents
				ifNotEmpty:
					[ 
					(anIndex = 0 or: [ anIndex >= self maxLineLength ])
						ifTrue: [ self resizeStringDependingOnWindowSizeFor: aComment ]
						ifFalse: [ self resizeComment: aComment withFirstLineShorterOf: anIndex ] ] ].
	codeStream nextPut: $"
]

{ #category : #utilities }
BIEnlumineurFormatter >> resizeStringDependingOnWindowSizeFor: aComment [
	| resizedComment |
	resizedComment := aComment contents withNoLineLongerThan: self maxLineLength.
	resizedComment do: [ :each | 
		codeStream nextPut: each.
		each = Character cr
			ifTrue: [ self indentTimesRepeat: self indent  ] ]
]

{ #category : #accessing }
BIEnlumineurFormatter >> retainBlankLinesBeforeComments [
	^ context retainBlankLinesBeforeComments
]

{ #category : #accessing }
BIEnlumineurFormatter >> retainBlankLinesBeforeComments: aBoolean [
	context retainBlankLinesBeforeComments: aBoolean
]

{ #category : #accessing }
BIEnlumineurFormatter >> retainBlankLinesBetweenStatements [
	^ context retainBlankLinesBetweenStatements
]

{ #category : #accessing }
BIEnlumineurFormatter >> retainBlankLinesBetweenStatements: aBoolean [
	context retainBlankLinesBetweenStatements: aBoolean
]

{ #category : #accessing }
BIEnlumineurFormatter >> selectorAndArgumentCombinedMaxSize [
	^ context selectorAndArgumentCombinedMaxSize
]

{ #category : #accessing }
BIEnlumineurFormatter >> selectorAndArgumentCombinedMaxSize: anInteger [
	context selectorAndArgumentCombinedMaxSize: anInteger
]

{ #category : #'private-formatting' }
BIEnlumineurFormatter >> shouldPassNewLineAfterHeadOfBlock: aBlockNode [
	^ (self headOfBlockNotEmpty: aBlockNode)
		or: [ self keepBlockInMessage ]
]

{ #category : #private }
BIEnlumineurFormatter >> space [
	codeStream space
]

{ #category : #'private-formatting' }
BIEnlumineurFormatter >> spaceAndFormatComments: aNode [
	aNode comments ifNotEmpty: [ self space ].
	self formatCommentsFor: aNode
]

{ #category : #accessing }
BIEnlumineurFormatter >> spacesAfterCaretSymbolInReturn [
	^ context spacesAfterCaretSymbolInReturn
]

{ #category : #accessing }
BIEnlumineurFormatter >> spacesBeforeDotInDynamicArray [ 
	^ context spacesBeforeDotInDynamicArray
]

{ #category : #accessing }
BIEnlumineurFormatter >> spacesInsideArray [
	^ context spacesInsideArray
]

{ #category : #accessing }
BIEnlumineurFormatter >> spacesInsideBlocks [
	^ context spacesInsideBlocks
]

{ #category : #accessing }
BIEnlumineurFormatter >> spacesInsideParentheses [
	^ context spacesInsideParentheses
]

{ #category : #accessing }
BIEnlumineurFormatter >> traditionalBinaryPrecedenceArray [
	^ context traditionalBinaryPrecedenceArray
]

{ #category : #accessing }
BIEnlumineurFormatter >> traditionalBinaryPrecedenceArray: anArray [
	context traditionalBinaryPrecedenceArray: anArray
]

{ #category : #accessing }
BIEnlumineurFormatter >> useBasicCommentFormat [ 
	^ context useBasicCommentFormat 
]

{ #category : #accessing }
BIEnlumineurFormatter >> useBasicCommentFormat: aBoolean [
	context useBasicCommentFormat: aBoolean
]

{ #category : #accessing }
BIEnlumineurFormatter >> useTraditionalBinaryPrecedenceForParentheses [
	^ context useTraditionalBinaryPrecedenceForParentheses
]

{ #category : #accessing }
BIEnlumineurFormatter >> useTraditionalBinaryPrecedenceForParentheses: aBoolean [
	context useTraditionalBinaryPrecedenceForParentheses: aBoolean
]

{ #category : #visiting }
BIEnlumineurFormatter >> visitArrayNode: anArrayNode [
	self bracketWith: '{}' around: [ self formatArray: anArrayNode ]
]

{ #category : #visiting }
BIEnlumineurFormatter >> visitAssignmentNode: anAssignmentNode [
	self visitNode: anAssignmentNode variable.
	codeStream space; nextPutAll: anAssignmentNode assignmentOperator; space.
	self
		indentExtraSpaces: anAssignmentNode variable name size + ' := ' size
		around: [ self visitNode: anAssignmentNode value ]
]

{ #category : #visiting }
BIEnlumineurFormatter >> visitBlockNode: aBlockNode [
	self
		bracketWith: '[]'
		around: [ self formatBlock: aBlockNode ].
	
]

{ #category : #visiting }
BIEnlumineurFormatter >> visitCascadeNode: aCascadeNode [
	self isInCascadeNode: true.
	self visitNode: aCascadeNode receiver.
	self
		indentAround: [ 
			self newLineBeforeFirstCascade
				ifTrue: [ self newLine ]
				ifFalse: [ self space ].
			aCascadeNode messages
				do: [ :each | 
							self formatCommentsFor: each;
								formatSelectorAndArguments: each
								firstSeparator: [  ]
								restSeparator:
									((self isMultiLineMessage: each)
										ifTrue: [ [ self newLine ] ]
										ifFalse: [ [ self space ] ])]
				separatedBy: [ 
					codeStream nextPut: $;.
					self newLineAfterCascade
						ifTrue: [ self newLine ]
						ifFalse: [ self space ] ]
					].
	self isInCascadeNode: false
]

{ #category : #visiting }
BIEnlumineurFormatter >> visitLiteralArrayNode: aRBArrayLiteralNode [
	| brackets current |
	codeStream nextPut: $#.
	brackets := aRBArrayLiteralNode isForByteArray
		ifTrue: [ '[]' ]
		ifFalse: [ '()' ].
	self
		bracketWith: brackets
		around: [ self
				indentExtraSpaces: '#(' size + self numberOfSpacesInsideArray
				around: [ codeStream nextPutAll: self spacesInsideArray.
					aRBArrayLiteralNode contents
						do: [ :each | 
							current := each.
							self visitNode: each ]
						separatedBy: [ (self isLineTooLongWithNode: current)
								ifTrue: [ self newLine ]
								ifFalse: [ self space ] ].
					codeStream nextPutAll: self spacesInsideArray ] ]
]

{ #category : #visiting }
BIEnlumineurFormatter >> visitLiteralNode: aLiteralNode [
	aLiteralNode value isLiteral
		ifFalse: [ self writeString: '''<an unprintable nonliteral value>''' ]
		ifTrue: [ self writeString: aLiteralNode sourceText ]
]

{ #category : #visiting }
BIEnlumineurFormatter >> visitLiteralVariableNode: aLiteralVariableNode [
	| binding |
	binding := aLiteralVariableNode binding.
	self writeString: binding key storeString, ' -> '.
	aLiteralVariableNode binding value isLiteral
		ifFalse: [ self writeString: '''<an unprintable nonliteral value>''' ]
		ifTrue: [ self writeString:  binding value asString ]
]

{ #category : #visiting }
BIEnlumineurFormatter >> visitMessageNode: aMessageNode [
	self visitNode: aMessageNode receiver.
	self formatSelectorAndArguments: aMessageNode
]

{ #category : #visiting }
BIEnlumineurFormatter >> visitMethodNode: aMethodNode [ 
	self formatMethodPatternFor: aMethodNode.
	self formatMethodBodyFor: aMethodNode
]

{ #category : #visiting }
BIEnlumineurFormatter >> visitNode: aNode [
	| needsParenthesis |
	(lookaheadCode includesKey: aNode)
		ifTrue: [ ^ self writeString: (lookaheadCode at: aNode) ].
	needsParenthesis := self needsParenthesisFor: aNode.
	self
		bracketWith:
			(needsParenthesis
				ifTrue: [ '()' ]
				ifFalse: [ '' ])
		around: [ 
			needsParenthesis
				ifTrue: [ codeStream nextPutAll: self spacesInsideParentheses ].
			super visitNode: aNode.
			(self formatCommentWithStatements or: [ aNode isMethod or: [ aNode isSequence or: [ aNode isBlock ] ] ])
				ifFalse: [  self spaceAndFormatComments: aNode. ].
			needsParenthesis
				ifTrue: [ codeStream nextPutAll: self spacesInsideParentheses ] ]
		indentExtraSpaces: (needsParenthesis ifTrue: [ 1 + self numberOfSpacesInsideParentheses ] ifFalse:[ 0 ])
]

{ #category : #visiting }
BIEnlumineurFormatter >> visitParseErrorNode: aNode [
	self writeString: aNode value
]

{ #category : #visiting }
BIEnlumineurFormatter >> visitPatternBlockNode: aRBPatternBlockNode [ 
	codeStream nextPut: $`.
	self 
		bracketWith: '{}' 
		around: [self formatBlock: aRBPatternBlockNode]
]

{ #category : #visiting }
BIEnlumineurFormatter >> visitPatternWrapperBlockNode: aRBPatternWrapperBlockNode [
	self visitNode: aRBPatternWrapperBlockNode wrappedNode.
	codeStream nextPut: $`.
	self 
		bracketWith: '{}' 
		around: [self formatBlock: aRBPatternWrapperBlockNode]
]

{ #category : #visiting }
BIEnlumineurFormatter >> visitPragmaNode: aPragmaNode [
	codeStream nextPut: $<.
	self 
		formatSelectorAndArguments: aPragmaNode 
		firstSeparator: [ 
			aPragmaNode selector isInfix
				ifTrue: [ self space ] ]
		restSeparator: [ self space ].
	self addSpaceIfNeededForLastArgument: aPragmaNode.
	codeStream nextPut: $>
]

{ #category : #visiting }
BIEnlumineurFormatter >> visitReturnNode: aReturnNode [
	codeStream
		nextPut: $^;
		nextPutAll: self spacesAfterCaretSymbolInReturn.
	self
		indentExtraSpaces: 1 + self numberOfSpacesAfterCaretSymbolInReturn
		around: [ self visitNode: aReturnNode value ]
]

{ #category : #visiting }
BIEnlumineurFormatter >> visitSequenceNode: aSequenceNode [
	self formatTemporariesFor: aSequenceNode.
	aSequenceNode comments
		ifNotEmpty: [ self formatCommentsFor: aSequenceNode;
						newLine ].
	self formatSequenceNodeStatementsFor: aSequenceNode
]

{ #category : #visiting }
BIEnlumineurFormatter >> visitVariableNode: aVariableNode [ 
	codeStream nextPutAll: aVariableNode name
]

{ #category : #private }
BIEnlumineurFormatter >> willBeMultiline: aNode [ 
	^(self formattedSourceFor: aNode withDictionary: lookaheadCode) includes: Character cr
]

{ #category : #private }
BIEnlumineurFormatter >> willBeMultiline: aNode saveIn: aDictionary [
	^(self formattedSourceFor: aNode withDictionary: aDictionary) includes: Character cr
]

{ #category : #utilities }
BIEnlumineurFormatter >> with: firstCollection and: secondCollection do: aBlock separatedBy: separatorBlock [
	firstCollection isEmpty
		ifTrue: [ ^ self ].
	aBlock value: firstCollection first value: secondCollection first.
	2 to: firstCollection size do: [ :i | 
		separatorBlock value.
		aBlock value: (firstCollection at: i) value: (secondCollection at: i) ]
]

{ #category : #private }
BIEnlumineurFormatter >> writeString: aString [
	| index |
	index := aString lastIndexOf: Character cr ifAbsent: [ 0 ].
	 codeStream nextPutAll: aString .
	index > 0
		ifTrue: [ lineStart := codeStream position - (aString size - index) ]
]
