Class {
	#name : #BIBlock2ExpressionTest,
	#superclass : #BISingleExpressionTest,
	#category : #'BlueInk-Enlumineur'
}

{ #category : #configuration }
BIBlock2ExpressionTest >> basicConfiguration [

	^ self contextClass basicNew
	stringInsideBlocks:' ';
	periodsAtEndOfBlock:false;
	periodsAtEndOfMethod: false;
	lineUpBlockBrackets:false;
	indentString: '	';
	keepBlockInMessage:false;
	retainBlankLinesBetweenStatements:false;
	minimumNewLinesBetweenStatements:1;
	multiLineMessages: Array new;
	oneLineMessages: Array new;
	numberOfArgumentsForMultiLine:5;
	indentsForKeywords:1;
	newLineBeforeFirstKeyword:false;
	formatCommentWithStatements:true;
	maxLineLength:50
]

{ #category : #test }
BIBlock2ExpressionTest >> testSpaceAfterComment [
	| expr source |
	expr := RBParser parseExpression: '["aComment"1]'.
	configurationSelector := #basicConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '[ "aComment" 1 ]'
]

{ #category : #test }
BIBlock2ExpressionTest >> testformatComment [

	| expr source |
	expr := RBParser parseExpression: '["  c1   " "   c2 " 2 "c3"]'.
	configurationSelector := #emptyDefaultConfiguration.
	source := self formatter format: expr.
	self assert: source equals: '[ "  c1   " "   c2 " 2	"c3" ]'.
]
