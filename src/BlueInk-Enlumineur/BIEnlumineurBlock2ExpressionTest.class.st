Class {
	#name : #BIEnlumineurBlock2ExpressionTest,
	#superclass : #BIEnlumineurTest,
	#category : #'BlueInk-Enlumineur-Tests'
}

{ #category : #configuration }
BIEnlumineurBlock2ExpressionTest >> basicConfiguration [

	^ self contextClass basicNew
		numberOfSpacesInsideBlock:1;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets:false;
		indentStyle: #tabulation;
		keepBlockInMessage:false;
		retainBlankLinesBetweenStatements:false;
		retainBlankLinesBeforeComments:false;
		minimumNewLinesBetweenStatements:1;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine:5;
		indentsForKeywords:1;
		newLineBeforeFirstKeyword:false;
		formatCommentWithStatements:true;
		maxLineLength:50;
		useBasicCommentFormat:false;
		indentExtraSpaces:0
]

{ #category : #configuration }
BIEnlumineurBlock2ExpressionTest >> multiLineConfiguration [

	^ self contextClass basicNew
		numberOfSpacesInsideBlock:1;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets:false;
		indentStyle: #tabulation;
		keepBlockInMessage:false;
		retainBlankLinesBetweenStatements:false;
		retainBlankLinesBeforeComments:false;
		minimumNewLinesBetweenStatements:1;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine:5;
		indentsForKeywords:1;
		newLineBeforeFirstKeyword:false;
		formatCommentWithStatements:true;
		maxLineLength:50;
		useBasicCommentFormat:false;
		indentExtraSpaces:0;
		newLineBeforeFirstCascade: true;
		newLineAfterCascade: true
]

{ #category : #configuration }
BIEnlumineurBlock2ExpressionTest >> multiLineWithThreeSpacesInsideBlockConfiguration [

	^ self contextClass basicNew
		numberOfSpacesInsideBlock:3;
		periodsAtEndOfBlock:false;
		periodsAtEndOfMethod: false;
		lineUpBlockBrackets:false;
		indentStyle: #tabulation;
		keepBlockInMessage:false;
		retainBlankLinesBetweenStatements:false;
		retainBlankLinesBeforeComments:false;
		minimumNewLinesBetweenStatements:1;
		multiLineMessages: Array new;
		oneLineMessages: Array new;
		numberOfArgumentsForMultiLine:5;
		indentsForKeywords:1;
		newLineBeforeFirstKeyword:false;
		formatCommentWithStatements:true;
		maxLineLength:50;
		useBasicCommentFormat:false;
		indentExtraSpaces:0;
		newLineBeforeFirstCascade: true;
		newLineAfterCascade: true
]

{ #category : #test }
BIEnlumineurBlock2ExpressionTest >> testExtraSpaceInIndentWhenMultiline [
	| source |
	configurationSelector := #multiLineConfiguration.
	source := self formatExpression: '[ :i|Transcript show:i; cr ]'.
	self
		assert: source
		equals:
'[ :i | 
Transcript
	show: i;
	cr ]'
]

{ #category : #test }
BIEnlumineurBlock2ExpressionTest >> testExtraSpaceInIndentWhenMultilineWithTreeSpacesInsideBlock [
	| source |
	configurationSelector := #multiLineWithThreeSpacesInsideBlockConfiguration.
	source := self formatExpression: '[ :i|Transcript show:i; cr ]'.
	self
		assert: source
		equals:
'[   :i | 
Transcript
	show: i;
	cr   ]'
]

{ #category : #test }
BIEnlumineurBlock2ExpressionTest >> testSpaceAfterComment [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '["aComment"1]'.
	self assert: source equals: '[ "aComment" 1 ]'
]

{ #category : #test }
BIEnlumineurBlock2ExpressionTest >> testformatComment [
	| source |
	configurationSelector := #basicConfiguration.
	source := self formatExpression: '["  c1   " "   c2 " 2 factorial "c3"]'.
	self assert: source equals: '[ "  c1   " "   c2 " 2 factorial	"c3" ]'
]
