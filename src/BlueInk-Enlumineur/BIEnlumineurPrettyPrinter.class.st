"
I'm a new pretty printer for Pharo.
I started as a copy of the BlueInk pretty printer. To avoid to break everything we clone BIPrettyPrinter and started to evolve 
and made sure that all the tests are in sync with the implementation. 

Note that we are nice guys since we implemented 180 tests for the old pretty printer.
Now such tests can not be systematically applied on Enlumineur this is why we cloned them too. 


"
Class {
	#name : #BIEnlumineurPrettyPrinter,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'codeStream',
		'indent',
		'lookaheadCode',
		'originalSource',
		'lineStart',
		'context',
		'isInCascadeNode'
	],
	#classVars : [
		'DefaultPrettyPrintContext',
		'FormatAsYouReadPolicy'
	],
	#category : #'BlueInk-Enlumineur'
}

{ #category : #private }
BIEnlumineurPrettyPrinter class >> announceASettingChange [
	SystemAnnouncer uniqueInstance announce: BISettingsChanged 
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> defaultPrettyPrintContext [
	^ DefaultPrettyPrintContext
]

{ #category : #public }
BIEnlumineurPrettyPrinter class >> format: aParseTree [ 
	^self format: aParseTree withIndents: 0
]

{ #category : #public }
BIEnlumineurPrettyPrinter class >> format: aParseTree withIndents: anInteger [ 
	^ self new
		indent: anInteger;
		format: aParseTree
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> formatAsYouReadPolicy [
	^ FormatAsYouReadPolicy
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> formatAsYouReadPolicy: anObject [
	FormatAsYouReadPolicy := anObject
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> formatCommentWithStatements [
	^ DefaultPrettyPrintContext formatCommentWithStatements
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> formatCommentWithStatements: aBoolean [
	DefaultPrettyPrintContext formatCommentWithStatements: aBoolean.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> indentString [
	^ DefaultPrettyPrintContext indentString
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> indentStyle [
	^ DefaultPrettyPrintContext indentStyle
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> indentStyle: aSymbole [
	DefaultPrettyPrintContext indentStyle: aSymbole.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> indentsForKeywords [
	^ DefaultPrettyPrintContext indentsForKeywords
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> indentsForKeywords: anInteger [
	DefaultPrettyPrintContext indentsForKeywords: anInteger.
	self announceASettingChange
]

{ #category : #initialization }
BIEnlumineurPrettyPrinter class >> initialize [
	"self initialize"

	FormatAsYouReadPolicy := false.
	DefaultPrettyPrintContext := BIEnlumineurContext new
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> keepBlockInMessage [
	^ DefaultPrettyPrintContext keepBlockInMessage
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> keepBlockInMessage: aBoolean [
	DefaultPrettyPrintContext keepBlockInMessage: aBoolean.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> lineUpBlockBrackets [
	^ DefaultPrettyPrintContext lineUpBlockBrackets
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> lineUpBlockBrackets: aBoolean [
	DefaultPrettyPrintContext lineUpBlockBrackets: aBoolean.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> maxLineLength [
	^ DefaultPrettyPrintContext maxLineLength
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> maxLineLength: anInteger [
	DefaultPrettyPrintContext maxLineLength: anInteger.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> methodSignatureOnMultipleLines [
	^ DefaultPrettyPrintContext methodSignatureOnMultipleLines
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> methodSignatureOnMultipleLines: aBoolean [
	DefaultPrettyPrintContext methodSignatureOnMultipleLines: aBoolean.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> minimumNewLinesBetweenStatements [
	^ DefaultPrettyPrintContext minimumNewLinesBetweenStatements
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> minimumNewLinesBetweenStatements: anInteger [
	DefaultPrettyPrintContext minimumNewLinesBetweenStatements: anInteger.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> multiLineMessages [
	^ DefaultPrettyPrintContext multiLineMessages printString
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> multiLineMessages: aString [
	DefaultPrettyPrintContext multiLineMessages: (self compiler evaluate: aString).
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> newLineAfterCascade [
	^ DefaultPrettyPrintContext newLineAfterCascade
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> newLineAfterCascade: aBoolean [
	DefaultPrettyPrintContext newLineAfterCascade: aBoolean.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> newLineBeforeFirstCascade [
	^ DefaultPrettyPrintContext newLineBeforeFirstCascade
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> newLineBeforeFirstCascade: aBoolean [
	DefaultPrettyPrintContext newLineBeforeFirstCascade: aBoolean.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> newLineBeforeFirstKeyword [
	^ DefaultPrettyPrintContext newLineBeforeFirstKeyword
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> newLineBeforeFirstKeyword: aBoolean [
	DefaultPrettyPrintContext newLineBeforeFirstKeyword: aBoolean.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> newLinesAfterMethodComment [
	^ DefaultPrettyPrintContext newLinesAfterMethodComment
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> newLinesAfterMethodComment: anInteger [
	DefaultPrettyPrintContext newLinesAfterMethodComment: anInteger.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> newLinesAfterMethodPattern [
	^ DefaultPrettyPrintContext newLinesAfterMethodPattern
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> newLinesAfterMethodPattern: anInteger [
	DefaultPrettyPrintContext newLinesAfterMethodPattern: anInteger.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> newLinesAfterTemporaries [
	^ DefaultPrettyPrintContext newLinesAfterTemporaries
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> newLinesAfterTemporaries: anInteger [
	DefaultPrettyPrintContext newLinesAfterTemporaries: anInteger.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> numberOfArgumentsForMultiLine [
	^ DefaultPrettyPrintContext numberOfArgumentsForMultiLine
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> numberOfArgumentsForMultiLine: anInteger [
	DefaultPrettyPrintContext numberOfArgumentsForMultiLine: anInteger.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> numberOfSpacesAfterCaretSymbolInReturn [
	^ DefaultPrettyPrintContext numberOfSpacesAfterCaretSymbolInReturn
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> numberOfSpacesAfterCaretSymbolInReturn: anInteger [
	DefaultPrettyPrintContext numberOfSpacesAfterCaretSymbolInReturn: anInteger.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> numberOfSpacesInIndent [
	^ DefaultPrettyPrintContext numberOfSpacesInIndent
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> numberOfSpacesInIndent: anInteger [
	DefaultPrettyPrintContext numberOfSpacesInIndent: anInteger.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> numberOfSpacesInsideBlock [
	^ DefaultPrettyPrintContext numberOfSpacesInsideBlock
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> numberOfSpacesInsideBlock: anInteger [
	DefaultPrettyPrintContext numberOfSpacesInsideBlock: anInteger.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> numberOfSpacesInsideParentheses [
	^ DefaultPrettyPrintContext numberOfSpacesInsideParentheses
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> numberOfSpacesInsideParentheses: anInteger [
	DefaultPrettyPrintContext numberOfSpacesInsideParentheses: anInteger.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> oneLineMessages [
	^ DefaultPrettyPrintContext oneLineMessages printString
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> oneLineMessages: aString [
	DefaultPrettyPrintContext oneLineMessages: (self compiler evaluate: aString).
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> periodsAsTerminators [
	^ DefaultPrettyPrintContext periodsAtEndOfBlock and: [ DefaultPrettyPrintContext periodsAtEndOfMethod ]
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> periodsAsTerminators: aBoolean [
	DefaultPrettyPrintContext periodsAtEndOfBlock: aBoolean.
	DefaultPrettyPrintContext periodsAtEndOfMethod: aBoolean.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> periodsAtEndOfBlock [
	^ DefaultPrettyPrintContext periodsAtEndOfBlock
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> periodsAtEndOfBlock: aBoolean [
	DefaultPrettyPrintContext periodsAtEndOfBlock: aBoolean.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> periodsAtEndOfMethod [
	^ DefaultPrettyPrintContext periodsAtEndOfMethod
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> periodsAtEndOfMethod: aBoolean [
	DefaultPrettyPrintContext periodsAtEndOfMethod: aBoolean.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> retainBlankLinesBeforeComments [
	^ DefaultPrettyPrintContext retainBlankLinesBeforeComments
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> retainBlankLinesBeforeComments: aBoolean [
	DefaultPrettyPrintContext retainBlankLinesBeforeComments: aBoolean.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> retainBlankLinesBetweenStatements [
	^ DefaultPrettyPrintContext retainBlankLinesBetweenStatements
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> retainBlankLinesBetweenStatements: aBoolean [
	DefaultPrettyPrintContext retainBlankLinesBetweenStatements: aBoolean.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> selectorAndArgumentCombinedMaxSize [
	^ DefaultPrettyPrintContext selectorAndArgumentCombinedMaxSize
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> selectorAndArgumentCombinedMaxSize: anInteger [
	DefaultPrettyPrintContext selectorAndArgumentCombinedMaxSize: anInteger.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> settingGroup [
	^ #blueInkEnlumineur
]

{ #category : #settings }
BIEnlumineurPrettyPrinter class >> settingsAlignBlockBrackets: aBuilder [
	(aBuilder setting: #lineUpBlockBrackets)
		label: 'Align block brackets';
		description: 'pass a newLine before closing a multiline block. 
For example:

1 to: 4 do: [ Transcript
		show: i;
		cr
	]
is the result when true

1 to: 4 do: [ Transcript
		show: i;
		cr]
	is the result when false
'.
]

{ #category : #settings }
BIEnlumineurPrettyPrinter class >> settingsFormatCommentWithExpression: aBuilder [
	(aBuilder setting: #formatCommentWithStatements)
		label: 'Format comment with expression';
		description: 'if set to true: put the comment after the dot in an expression
		else put it before 
For example if set to true: 1+1."We do an addition" 2+2
For example if set to false: 1+1"We do an addition". 2+2'.
]

{ #category : #settings }
BIEnlumineurPrettyPrinter class >> settingsIndentStyle:aBuilder [
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
BIEnlumineurPrettyPrinter class >> settingsIndentsForKeywords: aBuilder [ 
	
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
BIEnlumineurPrettyPrinter class >> settingsKeepBlockInMessage: aBuilder [ 
	
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
BIEnlumineurPrettyPrinter class >> settingsMaxLineLength: aBuilder [
	(aBuilder setting: #maxLineLength)
		label: 'Max line length';
		description: 'the maximum possible length of a line
For example:
1 + 2 + 3 + 4
	+ 5 + 6
is the result for 14'.
]

{ #category : #settings }
BIEnlumineurPrettyPrinter class >> settingsMethodSignatureOnMultipleLines: aBuilder [ 
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
BIEnlumineurPrettyPrinter class >> settingsMinimumNewLinesBetweenStatements: aBuilder [
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
BIEnlumineurPrettyPrinter class >> settingsMultiLineMessages: aBuilder [
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
BIEnlumineurPrettyPrinter class >> settingsNewLineAfterCascade: aBuilder [
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
BIEnlumineurPrettyPrinter class >> settingsNewLineBeforeFirstCascade: aBuilder [
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
BIEnlumineurPrettyPrinter class >> settingsNewLineBeforeFirstKeyword: aBuilder [
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
BIEnlumineurPrettyPrinter class >> settingsNewLinesAfterMethodComment: aBuilder [
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
BIEnlumineurPrettyPrinter class >> settingsNewLinesAfterMethodSignature: aBuilder [
	(aBuilder setting: #newLinesAfterMethodPattern)
		label: 'New lines after method signature';
		description: 'number of new lines after the method signature
Example:
myMethode: arg

	^ true
is the result for 2 new lines'
]

{ #category : #settings }
BIEnlumineurPrettyPrinter class >> settingsNewLinesAfterTemporaries: aBuilder [
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
BIEnlumineurPrettyPrinter class >> settingsNumberOfArgumentsForMultiLine: aBuilder [ 
	
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
BIEnlumineurPrettyPrinter class >> settingsNumberOfSpacesInIndent:aBuilder [
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
BIEnlumineurPrettyPrinter class >> settingsOn: aBuilder [
	<systemsettings>
	(aBuilder group: self settingGroup)
		target: self;
		parent: #codeBrowsing;
		label: 'BlueInk Enlumineur Pretty Printing';
		description: 'Settings related to BIEnlumineur';
		with: [ 
			self settingsMaxLineLength: aBuilder.
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
			"(aBuilder setting: #periodsAsTerminators) label: 'Periods as terminators'."
			self settingsPeriodsAtEndOfBlock: aBuilder.
			self settingsPeriodsAtEndOfMethod: aBuilder.
			self settingsRetainBlankLinesBeforeComments: aBuilder.
			self settingsRetainBlankLinesBetweenStatements: aBuilder.
			self settingsSelectorAndArgumentCombinedMaxSize: aBuilder.
			self settingsSpacesAfterCaretSymbolInReturn: aBuilder.
			self settingsSpacesInsideBlocks: aBuilder.
			self settingsSpacesInsideParentheses: aBuilder.
			self settingsTraditionalBinaryPrecedenceArray: aBuilder.
			self settingsUseBasicCommentFormat: aBuilder.
			self settingsUseTraditionalBinaryPrecedenceForParentheses: aBuilder ]
]

{ #category : #settings }
BIEnlumineurPrettyPrinter class >> settingsOneLineMessages: aBuilder [
	(aBuilder setting: #oneLineMessages)
		label: 'One line messages';
		description: 'An array containing all the messages that should be written on one line
Example:
1 to: 4 do: [ :i | Transcript show: i ] is the result if #to:do: is in the array'.
]

{ #category : #settings }
BIEnlumineurPrettyPrinter class >> settingsPeriodsAtEndOfBlock: aBuilder [
	(aBuilder setting: #periodsAtEndOfBlock)
		label: 'Period at end of block';
		description: 'put a period after the last expression of a block
for example:
	1 to:10 do: [:i | i+1.]
	is the result if the setting is set to true
'.
]

{ #category : #settings }
BIEnlumineurPrettyPrinter class >> settingsPeriodsAtEndOfMethod: aBuilder [.
	(aBuilder setting: #periodsAtEndOfMethod)
		label: 'Period at end of method';
		description: 'put a period after the last expression of a method
for example:
myMethode
	^ true.
	is the result if the setting is set to true
'.
]

{ #category : #settings }
BIEnlumineurPrettyPrinter class >> settingsRetainBlankLinesBeforeComments: aBuilder [.
	(aBuilder setting: #retainBlankLinesBeforeComments)
		label: 'Retain blank lines before comments';
		description: 'keep the blank lines which are before the comments 
for example:
	|a b|
	a :=1.
	
	"Comment"
	b :=2
	will not be modified if the setting is set to true'.
]

{ #category : #settings }
BIEnlumineurPrettyPrinter class >> settingsRetainBlankLinesBetweenStatements: aBuilder [.
	(aBuilder setting: #retainBlankLinesBetweenStatements)
		label: 'Retain blank lines between statements';
		description: 'Keep the blank lines which are between the statements
for example:
| a b c |
a := 1.


b := 2.

c := a + b
will not change if the setting is set to true'.
]

{ #category : #settings }
BIEnlumineurPrettyPrinter class >> settingsSelectorAndArgumentCombinedMaxSize: aBuilder [.
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
BIEnlumineurPrettyPrinter class >> settingsSpacesAfterCaretSymbolInReturn: aBuilder [ 
	(aBuilder setting: #numberOfSpacesAfterCaretSymbolInReturn)
		label: 'Spaces following caret symbol in return';
		description: 'Number of spaces expressed as a string that is put just after the caret (^) of a return expression. 
For example: ^   self is the result for 3 spaces'.
]

{ #category : #settings }
BIEnlumineurPrettyPrinter class >> settingsSpacesInsideBlocks: aBuilder [.
	(aBuilder setting: #numberOfSpacesInsideBlock)
		label: 'Spaces inside blocks';
		description: 'number of spaces after the opening bracket and before the closing bracket
for example:
[   :i | Transcript show:i   ]
	is the result of 3 spaces
'.
]

{ #category : #settings }
BIEnlumineurPrettyPrinter class >> settingsSpacesInsideParentheses: aBuilder [.
	(aBuilder setting: #numberOfSpacesInsideParentheses)
		label: 'Spaces inside parentheses';
		description: 'number of spaces after the opening parenthese and before the closing parenthese
for example: (   1 + 2   ) is the result for 3 spaces'
]

{ #category : #settings }
BIEnlumineurPrettyPrinter class >> settingsTraditionalBinaryPrecedenceArray: aBuilder [.
	(aBuilder setting: #traditionalBinaryPrecedenceArray)
		label: 'Traditional binary precedence';
		description: 'An 2 dimension array containing messages according to the priority
Example: #( #($- $+) #($*) )'.
]

{ #category : #settings }
BIEnlumineurPrettyPrinter class >> settingsUseBasicCommentFormat: aBuilder [.
self flag:'to modify'.
	(aBuilder setting: #useBasicCommentFormat)
		label: 'Use basic comment format';
		description:'leave the comment unchanged
Exemple:
"   anAddition   " is the result for true
'
]

{ #category : #settings }
BIEnlumineurPrettyPrinter class >> settingsUseTraditionalBinaryPrecedenceForParentheses: aBuilder [.
	(aBuilder setting: #useTraditionalBinaryPrecedenceForParentheses)
		label: 'Use traditional binary precedence for parentheses';
		description:'add parentheses in order to comply with the precedence
for example 1 + 2 * 3 will be formated: (1 + 2) * 3'
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> spacesAfterCaretSymbolInReturn [
	^ DefaultPrettyPrintContext spacesAfterCaretSymbolInReturn
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> spacesInsideBlocks [
	^ DefaultPrettyPrintContext spacesInsideBlocks
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> spacesInsideParentheses [
	^ DefaultPrettyPrintContext spacesInsideParentheses
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> traditionalBinaryPrecedenceArray [
	^ DefaultPrettyPrintContext traditionalBinaryPrecedenceArray printString 
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> traditionalBinaryPrecedenceArray: aString [
	DefaultPrettyPrintContext traditionalBinaryPrecedenceArray: (self compiler evaluate: aString).
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> useBasicCommentFormat [
	^ DefaultPrettyPrintContext useBasicCommentFormat
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> useBasicCommentFormat: aBoolean [
	DefaultPrettyPrintContext useBasicCommentFormat: aBoolean.
	self announceASettingChange
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> useTraditionalBinaryPrecedenceForParentheses [
	^ DefaultPrettyPrintContext useTraditionalBinaryPrecedenceForParentheses
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter class >> useTraditionalBinaryPrecedenceForParentheses: aBoolean [
	DefaultPrettyPrintContext useTraditionalBinaryPrecedenceForParentheses: aBoolean.
	self announceASettingChange
]

{ #category : #private }
BIEnlumineurPrettyPrinter >> addNewLinesBeforeStatementStartingAt: anInteger [ 
	| newLines |
	newLines := self minimumNewLinesBetweenStatements 
				max: (self retainBlankLinesBetweenStatements 
						ifTrue: [self newLinesBeforeStartingAt: anInteger]
						ifFalse: [0]).
	newLines = 0 ifTrue: [self space] ifFalse: [self newLines: newLines] 
]

{ #category : #private }
BIEnlumineurPrettyPrinter >> addSpaceIfNeededForLastArgument: aPragmaNode [
	aPragmaNode isUnary
		ifTrue: [ ^ self ].
	(self pragmaArgumentNeedsSeparator: aPragmaNode arguments last)
		ifTrue: [ self space ]
]

{ #category : #private }
BIEnlumineurPrettyPrinter >> basicFormatCommentFor: aComment [
	codeStream nextPutAll: (originalSource copyFrom: aComment start to: aComment stop).
]

{ #category : #private }
BIEnlumineurPrettyPrinter >> bracketWith: bracketString around: aBlock [
	bracketString isEmpty
		ifTrue: [ ^ aBlock value ].
	codeStream nextPut: bracketString first.
	^ aBlock
		ensure: [ codeStream nextPut: bracketString last ] 
]

{ #category : #private }
BIEnlumineurPrettyPrinter >> characterSeparatorMethodSignatureFor: aMethodNode [
	^ (self needsMethodSignatureOnMultipleLinesFor: aMethodNode)
			ifTrue: [ self newLine ]
			ifFalse: [ self space ]
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> codeStream [
	^ codeStream
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> codeStream: anObject [
	codeStream := anObject
]

{ #category : #private }
BIEnlumineurPrettyPrinter >> currentLineLength [
	^ codeStream position - lineStart
]

{ #category : #'public interface' }
BIEnlumineurPrettyPrinter >> format: aParseTree [
	codeStream := self initializeCodeStream.
	originalSource := aParseTree source.
	self visitNode: aParseTree.
	^ codeStream contents
]

{ #category : #'private-formatting' }
BIEnlumineurPrettyPrinter >> formatArray: anArrayNode [
	| current | 
	(anArrayNode statements reject: [ :each | each className = 'RBLiteralValueNode' ])
		ifEmpty: [ 
			anArrayNode statements
				do: [ :each | 
					current := each. 
					self visitNode: each ]
				separatedBy: [  
					(self isLineTooLong: current value asString)
						ifTrue: [ 
							codeStream nextPut: $..
							self newLine ]
						ifFalse: [ codeStream nextPutAll: ' . ' ] ] ]
		ifNotEmpty: [ self formatSequenceNodeStatementsFor: anArrayNode ]
]

{ #category : #'private-formatting' }
BIEnlumineurPrettyPrinter >> formatBlock: aBlockNode [
	codeStream nextPutAll: self spacesInsideBlocks.
	self formatBlockArgumentsFor: aBlockNode.
	self formatBlockCommentFor: aBlockNode.
	self visitNode: aBlockNode body.
	(self lineUpBlockBrackets and: [ self willBeMultiline: aBlockNode body ])
		ifTrue: [ self newLine ]
		ifFalse: [ codeStream nextPutAll: self spacesInsideBlocks ]
]

{ #category : #'private-formatting' }
BIEnlumineurPrettyPrinter >> formatBlockArgumentsFor: aBlockNode [
	aBlockNode arguments isEmpty
		ifTrue: [ ^ self ].
	aBlockNode arguments
		do: [ :each | 
			codeStream nextPut: $:.
			self visitNode: each.
			self formatCommentWithStatements
				ifTrue:
					[ self spaceAndFormatComments: each ].
			self space ].
	codeStream nextPutAll: '| '.
	(self willBeMultiline: aBlockNode body)
		ifTrue: [ self newLine ]
]

{ #category : #'private-formatting' }
BIEnlumineurPrettyPrinter >> formatBlockCommentFor: aBlockNode [
	originalSource isNil
		ifTrue: [  ^ self ].
	aBlockNode comments
		do: [ :each | 
			
			self basicFormatCommentFor: each.
			(self isNonEmptySingleLineBlock: aBlockNode)
				ifTrue: [  self space ].
			(self willBeMultiline: aBlockNode body)
				ifTrue: [  self newLine ] ]
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> formatCommentWithStatements [
	^ context formatCommentWithStatements
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> formatCommentWithStatements: aBoolean [
	context formatCommentWithStatements: aBoolean
]

{ #category : #'private-formatting' }
BIEnlumineurPrettyPrinter >> formatCommentsFor: aNode [
	originalSource isNil
		ifTrue: [ ^ self ].
	aNode comments
		do:
			[ :each | 
			self basicFormatCommentFor: each.
			"self newLine" ]
]

{ #category : #private }
BIEnlumineurPrettyPrinter >> formatMessageNodeInAMessageStreamFor: aMessageNode [
	| messageStream |
	messageStream := WriteStream on: (String new: 100).
	self
		with: aMessageNode selectorParts
		and: aMessageNode arguments
		do: [ :selector :arg | 
			messageStream
				nextPutAll: selector;
				space;
				nextPutAll: (self formattedSourceFor: arg) ]
		separatedBy: [ messageStream space ].
		^ messageStream 
]

{ #category : #'private-formatting' }
BIEnlumineurPrettyPrinter >> formatMethodBodyFor: aMethodNode [
	self
		indentAround:
			[ 
			self newLines: self newLinesAfterMethodPattern.
			self formatMethodCommentFor: aMethodNode.
			self formatPragmasFor: aMethodNode.
			self visitNode: aMethodNode body ]
]

{ #category : #'private-formatting' }
BIEnlumineurPrettyPrinter >> formatMethodCommentFor: aMethodNode [
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
BIEnlumineurPrettyPrinter >> formatMethodPatternFor: aMethodNode [
	aMethodNode arguments isEmpty
		ifTrue: [ codeStream nextPutAll: aMethodNode selector ]
		ifFalse: [ 
			(self needsMethodSignatureOnMultipleLinesFor: aMethodNode)
				ifTrue: [ self privateFormatMethodPatternMultiLineFor: aMethodNode ]
				ifFalse: [ self privateFormatMethodPatternMonoLineFor: aMethodNode ] ]
]

{ #category : #'private-formatting' }
BIEnlumineurPrettyPrinter >> formatPragmasFor: aMethodNode [
	aMethodNode pragmas do: [ :each | self visitNode: each; newLine ]
]

{ #category : #'private-formatting' }
BIEnlumineurPrettyPrinter >> formatSelectorAndArguments: aMessageNode [
	| newLineBetweenArguments |
	newLineBetweenArguments := self isMultiLineMessage: aMessageNode.
	self
		indent:
			(newLineBetweenArguments
				ifTrue: [ self indentsForKeywords ]
				ifFalse: [ 0 ])
		around: [ 
			self
				formatSelectorAndArguments: aMessageNode
				firstSeparator:
					(( aMessageNode isKeyword
					and:[
						newLineBetweenArguments or: [ self newLineBeforeFirstKeyword ]
						]  )
						ifTrue: [ [ self newLine ] ]
						ifFalse: [ [ self space ] ])
				restSeparator:
					(newLineBetweenArguments
						ifTrue: [ [ self newLine ] ]
						ifFalse: [ [ self space ] ]) ]
]

{ #category : #'private-formatting' }
BIEnlumineurPrettyPrinter >> formatSelectorAndArguments: aMessageNode firstSeparator: firstBlock restSeparator: restBlock [
	| separatorBlock |
	separatorBlock := firstBlock.
	aMessageNode isUnary
		ifTrue: [ 
			self handleLineForSelector: aMessageNode selector withSeparatorBlock:
				separatorBlock.
			codeStream nextPutAll: aMessageNode selector ]
		ifFalse: [ 
			aMessageNode selectorParts
				with: aMessageNode arguments
				do: [ :selector :argument | 
					self handleLineForSelector: selector withSeparatorBlock: separatorBlock.
					separatorBlock := restBlock.
					self
						indentAround: [ 
							codeStream nextPutAll: selector.
							self handleLineForArgument: argument ] ] ]
]

{ #category : #'private-formatting' }
BIEnlumineurPrettyPrinter >> formatSequenceNodeStatementsFor: aSequenceNode [
	| statements |
	statements := aSequenceNode statements.
	statements isEmpty
		ifTrue: [ ^ self ].
	1 to: statements size do: [ :i | 
		self visitNode: (statements at: i).
		(i < statements size
			or: [ 
				aSequenceNode parent
					ifNil: [ self periodsAsTerminators ]
					ifNotNil: [ :parent | 
						parent isBlock
							ifTrue: [ self periodsAtEndOfBlock ]
							ifFalse: [ self periodsAtEndOfMethod ] ] ])
			ifTrue: [ codeStream nextPut: $. ].
		self formatStatementCommentsFor: (statements at: i).
		i < statements size
			ifTrue: [ self
					addNewLinesBeforeStatementStartingAt: (statements at: i + 1) start ] ]
]

{ #category : #'private-formatting' }
BIEnlumineurPrettyPrinter >> formatStatementCommentsFor: aStatementNode [
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
				ifFalse: [ codeStream tab ].
			self useBasicCommentFormat
				ifTrue: [ self basicFormatCommentFor: each ]
				ifFalse: [ 
			self resizeCommentFor: each startingAt: self currentLineLength ]]
]

{ #category : #private }
BIEnlumineurPrettyPrinter >> formatTemporariesFor: aSequenceNode [
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
BIEnlumineurPrettyPrinter >> formattedSourceFor: aNode [
	^ lookaheadCode
		at: aNode
		ifAbsentPut: [ 
			self class new
				indent: self indent;
				installNewContext: context;
				format: aNode ]
]

{ #category : #private }
BIEnlumineurPrettyPrinter >> handleLineForArgument: anArgument [
	(self keepBlockInMessage and: [ anArgument isBlock ])
		ifTrue: [ (self willBeMultiline: anArgument)
				ifTrue: [ (self formattedSourceFor: anArgument) lines first size > self maxLineLength
						ifTrue: [ self newLine ]
						ifFalse: [ self space ] ]
				ifFalse: [ anArgument sourceInterval size > self maxLineLength
						ifTrue: [ self newLine ]
						ifFalse: [ self space ] ] ]
		ifFalse: [ ((self willBeMultiline: anArgument)
				or: [ anArgument sourceInterval size > self maxLineLength ])
				ifTrue: [ self isInCascadeNode
						ifTrue: [ codeStream nextPut: Character cr.
							self indent - 1 timesRepeat: [ codeStream nextPutAll: self indentString ] ]
						ifFalse: [ self newLine ] ]
				ifFalse: [ self space ] ].
	self visitNode: anArgument
]

{ #category : #private }
BIEnlumineurPrettyPrinter >> handleLineForSelector: selector withSeparatorBlock: aBlock [
	(self isLineTooLong: selector)
		ifTrue: [ self newLine ]
		ifFalse: [ aBlock value ]
]

{ #category : #private }
BIEnlumineurPrettyPrinter >> hasAMultiLineMessageArgument: anArgumentsCollection [
	^ anArgumentsCollection
		anySatisfy: [ :each | 
			self isInCascadeNode
				ifTrue: [ self indent: 0 around: [ self willBeMultiline: each ] ]
				ifFalse: [ 
					self
						indent: self indentsForKeywords + 1
						around: [ self willBeMultiline: each ] ] ]
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> indent [
	^ indent
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> indent: anInteger [

	indent := anInteger
]

{ #category : #private }
BIEnlumineurPrettyPrinter >> indent: anInteger around: aBlock [ 
	self indent: self indent + anInteger.
	^aBlock ensure: [self indent: self indent - anInteger]
]

{ #category : #private }
BIEnlumineurPrettyPrinter >> indentAround: aBlock [ 
	self indent: 1 around: aBlock
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> indentString [
	^ context indentString
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> indentStyle [
	^ context indentStyle
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> indentStyle: aSymbole [
	context indentStyle: aSymbole
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> indentsForKeywords [
	^ context indentsForKeywords
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> indentsForKeywords: anInteger [
	context indentsForKeywords: anInteger
]

{ #category : #initialization }
BIEnlumineurPrettyPrinter >> initialize [
	super initialize.
	lineStart := 0.
	self indent: 0.
	self isInCascadeNode: false.
	lookaheadCode := self initializeLookAheadCode.
	codeStream := self initializeCodeStream.
	context := DefaultPrettyPrintContext
]

{ #category : #initialization }
BIEnlumineurPrettyPrinter >> initializeCodeStream [
	^ WriteStream on: (String new: 256)
]

{ #category : #initialization }
BIEnlumineurPrettyPrinter >> initializeLookAheadCode [
	^ IdentityDictionary new
]

{ #category : #'public interface' }
BIEnlumineurPrettyPrinter >> installNewContext: aContext [

	context := aContext.
	lookaheadCode := self initializeLookAheadCode
]

{ #category : #'public interface' }
BIEnlumineurPrettyPrinter >> installNewValueInContext: aCol [
	"self new installNewValueInContext: { (#cascadedMessageInsideParentheses: -> true) }"
	
	context := context copy.
	"needed because by default context point to the DefaultPrettyPrintContext"
	aCol do: [ :each | self perform: each key with: each value]
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> isInCascadeNode [
	^ isInCascadeNode
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> isInCascadeNode: aBoolean [
	isInCascadeNode := aBoolean
]

{ #category : #private }
BIEnlumineurPrettyPrinter >> isLineTooLong: aString [
	^ self currentLineLength + (aString indexOf: Character cr ifAbsent: [ aString size ])
		>= self maxLineLength
]

{ #category : #private }
BIEnlumineurPrettyPrinter >> isMultiLineMessage: aMessageNode [
	(self multiLineMessages includes: aMessageNode selector)
		ifTrue: [ ^ true ].
	(self oneLineMessages includes: aMessageNode selector)
		ifTrue: [ ^ false ].
	self numberOfArgumentsForMultiLine <= aMessageNode arguments size
		ifTrue: [ ^ true ].
	(self hasAMultiLineMessageArgument: aMessageNode arguments)
		ifTrue: [ ^ true ].
	aMessageNode isUnary
		ifTrue: [ ^ self isLineTooLong: aMessageNode selector ].
	^ self isLineTooLong: (self formatMessageNodeInAMessageStreamFor: aMessageNode) contents
]

{ #category : #private }
BIEnlumineurPrettyPrinter >> isNonEmptySingleLineBlock: aBlockNode [
	^ ((self willBeMultiline: aBlockNode body) or: [ aBlockNode body statements isEmpty ]) not
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> keepBlockInMessage [
	^ context keepBlockInMessage
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> keepBlockInMessage: aBoolean [
	context keepBlockInMessage: aBoolean
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> lineStart [
	^ lineStart
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> lineStart: anObject [
	lineStart := anObject
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> lineUpBlockBrackets [
	^ context lineUpBlockBrackets
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> lineUpBlockBrackets: aBoolean [
	context lineUpBlockBrackets: aBoolean
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> maxLineLength [
	^ context maxLineLength
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> maxLineLength: anInteger [
	context maxLineLength: anInteger
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> methodSignatureOnMultipleLines [
	^ context methodSignatureOnMultipleLines
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> methodSignatureOnMultipleLines: aBoolean [
	context methodSignatureOnMultipleLines: aBoolean
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> minimumNewLinesBetweenStatements [
	^ context minimumNewLinesBetweenStatements
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> minimumNewLinesBetweenStatements: anInteger [
	context minimumNewLinesBetweenStatements: anInteger
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> multiLineMessages [
	^ context multiLineMessages
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> multiLineMessages: anArray [
	context multiLineMessages: anArray
]

{ #category : #private }
BIEnlumineurPrettyPrinter >> needsMethodSignatureOnMultipleLinesFor: aMethodNode [
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
BIEnlumineurPrettyPrinter >> needsParenthesisFor: aNode [
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
BIEnlumineurPrettyPrinter >> newLine [
	self newLines: 1
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> newLineAfterCascade [
	^ context newLineAfterCascade
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> newLineAfterCascade: aBoolean [
	context newLineAfterCascade: aBoolean
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> newLineBeforeFirstCascade [
	^ context newLineBeforeFirstCascade
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> newLineBeforeFirstCascade: aBoolean [
	context newLineBeforeFirstCascade: aBoolean
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> newLineBeforeFirstKeyword [
	^ context newLineBeforeFirstKeyword
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> newLineBeforeFirstKeyword: aBoolean [
	context newLineBeforeFirstKeyword: aBoolean
]

{ #category : #private }
BIEnlumineurPrettyPrinter >> newLines: anInteger [
	anInteger + self indentString size = 0
		ifTrue: 
			[ codeStream space ].
	anInteger
		timesRepeat: 
			[ codeStream cr ].
	lineStart := codeStream position.
	self
		indent
		timesRepeat: 
			[ codeStream nextPutAll: self indentString ]
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> newLinesAfterMethodComment [
	^ context newLinesAfterMethodComment
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> newLinesAfterMethodComment: anInteger [
	context newLinesAfterMethodComment: anInteger
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> newLinesAfterMethodPattern [
	^ context newLinesAfterMethodPattern
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> newLinesAfterMethodPattern: anInteger [
	context newLinesAfterMethodPattern: anInteger
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> newLinesAfterTemporaries [
	^ context newLinesAfterTemporaries
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> newLinesAfterTemporaries: anInteger [
	context newLinesAfterTemporaries: anInteger
]

{ #category : #private }
BIEnlumineurPrettyPrinter >> newLinesBeforeStartingAt: anIndex [
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
BIEnlumineurPrettyPrinter >> numberOfArgumentsForMultiLine [
	^ context numberOfArgumentsForMultiLine
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> numberOfArgumentsForMultiLine: anInteger [
	context numberOfArgumentsForMultiLine: anInteger
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> numberOfSpacesAfterCaretSymbolInReturn [
	^ context numberOfSpacesAfterCaretSymbolInReturn
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> numberOfSpacesAfterCaretSymbolInReturn: anInteger [
	context numberOfSpacesAfterCaretSymbolInReturn: anInteger
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> numberOfSpacesInIndent [
	^ context numberOfSpacesInIndent
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> numberOfSpacesInIndent: anInteger [
	context numberOfSpacesInIndent: anInteger
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> numberOfSpacesInsideBlock [
	^ context numberOfSpacesInsideBlock
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> numberOfSpacesInsideBlock: anInteger [
	context numberOfSpacesInsideBlock: anInteger
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> numberOfSpacesInsideParentheses [
	^ context numberOfSpacesInsideParentheses
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> numberOfSpacesInsideParentheses: anInteger [
	context numberOfSpacesInsideParentheses: anInteger
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> oneLineMessages [
	^ context oneLineMessages
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> oneLineMessages: anArray [
	context oneLineMessages: anArray
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> periodsAsTerminators [
	^ context periodsAtEndOfBlock and: [ context periodsAtEndOfMethod ]
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> periodsAsTerminators: aBoolean [
	context periodsAtEndOfBlock: aBoolean.
	context periodsAtEndOfMethod: aBoolean
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> periodsAtEndOfBlock [
	^ context periodsAtEndOfBlock
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> periodsAtEndOfBlock: aBoolean [
	context periodsAtEndOfBlock: aBoolean
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> periodsAtEndOfMethod [
	^ context periodsAtEndOfMethod
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> periodsAtEndOfMethod: aBoolean [
	context periodsAtEndOfMethod: aBoolean
]

{ #category : #private }
BIEnlumineurPrettyPrinter >> pragmaArgumentNeedsSeparator: anArgumentNode [
	^ anArgumentNode value isSymbol and: [ anArgumentNode value isBinary ]
]

{ #category : #private }
BIEnlumineurPrettyPrinter >> precedenceOf: parentSelector greaterThan: childSelector [
	"Put parenthesis around things that are preceived to have 'lower' precedence. For example, 'a + b * c' 
	-> '(a + b) * c' but 'a * b + c' -> 'a * b + c'"

	| childIndex parentIndex |
	childIndex := 0.
	parentIndex := 0.
	1 to: self traditionalBinaryPrecedenceArray size do: [ :i | 
		((self traditionalBinaryPrecedenceArray at: i) includes: parentSelector first)
			ifTrue: [ parentIndex := i ].
		((self traditionalBinaryPrecedenceArray at: i) includes: childSelector first)
			ifTrue: [ childIndex := i ] ].
	^ childIndex < parentIndex
]

{ #category : #private }
BIEnlumineurPrettyPrinter >> privateFormatMethodPatternMonoLineFor: aMethodNode [
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
BIEnlumineurPrettyPrinter >> privateFormatMethodPatternMultiLineFor: aMethodNode [
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
BIEnlumineurPrettyPrinter >> resizeComment: aComment withFirstLineShorterOf: anIndex [
	| cutComment firstLine currentCharPos |
	currentCharPos := 1.
	firstLine := (aComment contents withNoLineLongerThan: self maxLineLength - anIndex)
		lineNumber: 1.
	[ currentCharPos > firstLine size ]
		whileFalse:
			[ 
			codeStream nextPut: (firstLine at: currentCharPos).
			currentCharPos := currentCharPos + 1 ].
	currentCharPos > aComment contents size
		ifFalse:
			[ 
			self newLine.
			cutComment := aComment contents allButFirst: currentCharPos.
			self resizeStringDependingOnWindowSizeFor: cutComment ]
]

{ #category : #utilities }
BIEnlumineurPrettyPrinter >> resizeCommentFor: aComment startingAt: anIndex [
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
BIEnlumineurPrettyPrinter >> resizeStringDependingOnWindowSizeFor: aComment [
	| resizedComment |
	resizedComment := aComment contents withNoLineLongerThan: self maxLineLength.
	1 to: resizedComment size do: [ :i | 
		codeStream nextPut: (resizedComment at: i).
		(resizedComment at: i) = Character cr
			ifTrue: [ self indent timesRepeat: [ codeStream nextPutAll: self indentString ] ] ]
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> retainBlankLinesBeforeComments [
	^ context retainBlankLinesBeforeComments
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> retainBlankLinesBeforeComments: aBoolean [
	context retainBlankLinesBeforeComments: aBoolean
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> retainBlankLinesBetweenStatements [
	^ context retainBlankLinesBetweenStatements
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> retainBlankLinesBetweenStatements: aBoolean [
	context retainBlankLinesBetweenStatements: aBoolean
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> selectorAndArgumentCombinedMaxSize [
	^ context selectorAndArgumentCombinedMaxSize
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> selectorAndArgumentCombinedMaxSize: anInteger [
	context selectorAndArgumentCombinedMaxSize: anInteger
]

{ #category : #private }
BIEnlumineurPrettyPrinter >> space [
	codeStream space
]

{ #category : #'private-formatting' }
BIEnlumineurPrettyPrinter >> spaceAndFormatComments: aNode [
	aNode comments ifNotEmpty: [ self space ].
	self formatCommentsFor: aNode
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> spacesAfterCaretSymbolInReturn [
	^ context spacesAfterCaretSymbolInReturn
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> spacesInsideBlocks [
	^ context spacesInsideBlocks
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> spacesInsideParentheses [
	^ context spacesInsideParentheses
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> traditionalBinaryPrecedenceArray [
	^ context traditionalBinaryPrecedenceArray
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> traditionalBinaryPrecedenceArray: anArray [
	context traditionalBinaryPrecedenceArray: anArray
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> useBasicCommentFormat [ 
	^ context useBasicCommentFormat 
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> useBasicCommentFormat: aBoolean [
	context useBasicCommentFormat: aBoolean
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> useTraditionalBinaryPrecedenceForParentheses [
	^ context useTraditionalBinaryPrecedenceForParentheses
]

{ #category : #accessing }
BIEnlumineurPrettyPrinter >> useTraditionalBinaryPrecedenceForParentheses: aBoolean [
	context useTraditionalBinaryPrecedenceForParentheses: aBoolean
]

{ #category : #visiting }
BIEnlumineurPrettyPrinter >> visitArrayNode: anArrayNode [
	self bracketWith: '{}' around: [ self formatArray: anArrayNode ]
]

{ #category : #visiting }
BIEnlumineurPrettyPrinter >> visitAssignmentNode: anAssignmentNode [ 
	self visitNode: anAssignmentNode variable.
	codeStream space; nextPutAll: anAssignmentNode assignmentOperator; space.
	self visitNode: anAssignmentNode value
]

{ #category : #visiting }
BIEnlumineurPrettyPrinter >> visitBlockNode: aBlockNode [
	self
		bracketWith: '[]'
		around: [ self formatBlock: aBlockNode ].
	
]

{ #category : #visiting }
BIEnlumineurPrettyPrinter >> visitCascadeNode: aCascadeNode [
	self isInCascadeNode: true.
	self visitNode: aCascadeNode receiver.
	self
		indentAround: [ 
			self newLineBeforeFirstCascade
				ifTrue: [ self newLine ]
				ifFalse: [ self space ].
			aCascadeNode messages
				do: [ :each | 
					self
						indentAround: [ 
							self formatCommentsFor: each;
								formatSelectorAndArguments: each
								firstSeparator: [  ]
								restSeparator:
									((self isMultiLineMessage: each)
										ifTrue: [ [ self newLine ] ]
										ifFalse: [ [ self space ] ])]]
				separatedBy: [ 
					codeStream nextPut: $;.
					self newLineAfterCascade
						ifTrue: [ self newLine ]
						ifFalse: [ self space ] ]
					].
	self isInCascadeNode: false
]

{ #category : #visiting }
BIEnlumineurPrettyPrinter >> visitLiteralArrayNode: aRBArrayLiteralNode [ 
	| brackets |
	codeStream nextPut: $#.
	brackets := aRBArrayLiteralNode isForByteArray 
				ifTrue: ['[]']
				ifFalse: ['()'].
	self bracketWith: brackets
		around: 
			[aRBArrayLiteralNode contents do: [:each | self visitNode: each]
				separatedBy: [self space]]
]

{ #category : #visiting }
BIEnlumineurPrettyPrinter >> visitLiteralNode: aLiteralNode [
	aLiteralNode value isLiteral
		ifFalse: [ self writeString: '''<an unprintable nonliteral value>''' ]
		ifTrue: [ self writeString: aLiteralNode sourceText ]
]

{ #category : #visiting }
BIEnlumineurPrettyPrinter >> visitLiteralVariableNode: aLiteralVariableNode [
	| binding |
	binding := aLiteralVariableNode binding.
	self writeString: binding key storeString, ' -> '.
	aLiteralVariableNode binding value isLiteral
		ifFalse: [ self writeString: '''<an unprintable nonliteral value>''' ]
		ifTrue: [ self writeString:  binding value asString ]
]

{ #category : #visiting }
BIEnlumineurPrettyPrinter >> visitMessageNode: aMessageNode [
	self visitNode: aMessageNode receiver.
	self formatSelectorAndArguments: aMessageNode
]

{ #category : #visiting }
BIEnlumineurPrettyPrinter >> visitMethodNode: aMethodNode [ 
	self formatMethodPatternFor: aMethodNode.
	self formatMethodBodyFor: aMethodNode
]

{ #category : #visiting }
BIEnlumineurPrettyPrinter >> visitNode: aNode [
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
			(self formatCommentWithStatements or: [ aNode isMethod or: [ aNode isSequence or:[aNode isBlock] ] ])
				ifFalse: [  self spaceAndFormatComments: aNode. ].
			needsParenthesis
				ifTrue: [ codeStream nextPutAll: self spacesInsideParentheses ] ]
]

{ #category : #visiting }
BIEnlumineurPrettyPrinter >> visitParseErrorNode: aNode [
	self writeString: aNode value
]

{ #category : #visiting }
BIEnlumineurPrettyPrinter >> visitPatternBlockNode: aRBPatternBlockNode [ 
	codeStream nextPut: $`.
	self 
		bracketWith: '{}' 
		around: [self formatBlock: aRBPatternBlockNode]
]

{ #category : #visiting }
BIEnlumineurPrettyPrinter >> visitPatternWrapperBlockNode: aRBPatternWrapperBlockNode [
	self visitNode: aRBPatternWrapperBlockNode wrappedNode.
	codeStream nextPut: $`.
	self 
		bracketWith: '{}' 
		around: [self formatBlock: aRBPatternWrapperBlockNode]
]

{ #category : #visiting }
BIEnlumineurPrettyPrinter >> visitPragmaNode: aPragmaNode [
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
BIEnlumineurPrettyPrinter >> visitReturnNode: aReturnNode [ 
	codeStream
		nextPut: $^;
		nextPutAll: self spacesAfterCaretSymbolInReturn.
	self visitNode: aReturnNode value
]

{ #category : #visiting }
BIEnlumineurPrettyPrinter >> visitSequenceNode: aSequenceNode [
	self formatTemporariesFor: aSequenceNode.
	self formatCommentsFor: aSequenceNode.
	self formatSequenceNodeStatementsFor: aSequenceNode
]

{ #category : #visiting }
BIEnlumineurPrettyPrinter >> visitVariableNode: aVariableNode [ 
	codeStream nextPutAll: aVariableNode name
]

{ #category : #private }
BIEnlumineurPrettyPrinter >> willBeMultiline: aNode [ 
	^(self formattedSourceFor: aNode) includes: Character cr
]

{ #category : #utilities }
BIEnlumineurPrettyPrinter >> with: firstCollection and: secondCollection do: aBlock separatedBy: separatorBlock [
	firstCollection isEmpty
		ifTrue: [ ^ self ].
	aBlock value: firstCollection first value: secondCollection first.
	2 to: firstCollection size do: [ :i | 
		separatorBlock value.
		aBlock value: (firstCollection at: i) value: (secondCollection at: i) ]
]

{ #category : #private }
BIEnlumineurPrettyPrinter >> writeString: aString [
	| index |
	index := aString lastIndexOf: Character cr ifAbsent: [ 0 ].
	 codeStream nextPutAll: aString .
	index > 0
		ifTrue: [ lineStart := codeStream position - (aString size - index) ]
]
