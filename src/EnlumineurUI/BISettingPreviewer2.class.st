"
i'm a UI for show you how the setting of prettyPrinter(code formater ) will be applied on method not formated

ROADMAP
-------

- [X] 1st step migration to Spec 2 
	- [X] add a set of method to format and add/remove to the set
	- [X] show before and after format
	- [x] add a set of setting (context) to configure formater 
- [ ] 2nd step 
	- [ ] extract conduct of SettingDeclaration ( one part setting , other part visitor  ) see DEV part , settingTree
- [ ] 3rd step 
	- [ ] when click on a specific setting show you some example with this setting to understand how ti's work
README DEV & USER 
-----------------

be carefull of settingDropList and the table of setting customization each time you modified something it's save into system.

USER Part 
---------
i'm composed of : 
1) a tree of setting each row it's like this (name of a setting , one or more input to customize them ) 
2) 
	2.A) 3 buttons
		a) save button it save what you write in the textArea below 
		b) remove Current Method it's remove the dropList selectedItem
		c) call another UI to select another method in the system 
	2.B ) the methodDropList it's a dropList to switch method to show you how it will be formate
		each time you change the selectedItem it will change the content of textArea before formate and also the after formate textArea 
	2.C) it's a textArea to show the method to format
3) 
	3.A) 2  buttons
		a) the first one call 'save' it's use to save the configuration of the formater it will ask you a name for the method and it will appear in the setting dropList
		b) the remove Button it's remove selectedItem of Setting DropList 
	3.B) it's the setting dropList each time you change it refresh all the textArea
	3.C) textArea to show formate Code 
DEV part
-------- 

##############
MethodProvider 
##############

this UI use a reference to another class 'instance variable : methodProvider'
	in this class 
		- class side we store all setting at format STON with tag 'settings'
		- instance side we store all method to format with tag: 'methods'

###########
settingTree
###########

the settingTree is write in morph for the moment it will take me too much to migrate it to Spec 2 
the problem is :
	the setting is higly link to morph 
	in the SettingDeclaration there is a method get an input/widget to customize with someting like a visitor.I think to migrate this part we will have to extract this feature with a visitor
	LINK:
	SettingDeclaration >> inputWidget , it's the method like a Visitor
	
#############
other widgets
#############

nothing to say  

Internal Representation and Key Implementation Points.

    Instance Variables
	afterPrettyPrintTextPresenter:		<CodePresenter>
	beforePrettyPrintTextPresenter:		<CodePresenter>
	chooseMethodUI:		<ButtonPresenter>
	formaterPrettyPrinter:		<BIConfigurableFormatter>
	isSettingModification:		<Boolean>
	methodDropList:		<DropListPresenter>
	methodProvider:		<Object> reference to another class 
	removeMethodButton:		<ButtonPresenter>
	removeSettingButton:		<buttonPresenter>
	saveMethodButton:		<buttonPresenter>
	saveSettingButton:		<buttonPresenter>
	settingsDropList:		<DropListPresenter>
	settingsTree:		<TablePresenter>

"
Class {
	#name : #BISettingPreviewer2,
	#superclass : #SpPresenter,
	#instVars : [
		'settingsTree',
		'chooseMethodUI',
		'methodDropList',
		'settingsDropList',
		'saveMethodButton',
		'removeMethodButton',
		'removeSettingButton',
		'saveSettingButton',
		'methodProvider',
		'formaterPrettyPrinter',
		'isSettingModification',
		'formatedTextPresenter',
		'notFormatedTextPresenter'
	],
	#classVars : [
		'FormaterPrettyPrinter',
		'MethodProvider'
	],
	#category : #EnlumineurUI
}

{ #category : #'build ui buttons' }
BISettingPreviewer2 class >> buildOpenBIInspectorButton [
	^ PluggableButtonMorph
		on: self
		getState: #openBIInspectorButtonState
		action: #openBIInspectorButtonAction
		label: #openBIInspectorButtonLabel
]

{ #category : #specs }
BISettingPreviewer2 class >> defaultSpec [
	<spec: #default>
	^ SpBoxLayout newVertical
		add: #settingsTree;
		add:
			(SpPanedLayout newHorizontal
				add:
					(SpBoxLayout newVertical
						add:
							(SpBoxLayout newHorizontal
								add: #saveMethodButton;
								add: #removeMethodButton;
								add: #chooseMethodUI;
								yourself)
							withConstraints: [ :contraint | contraint height: 30 ];
						add: #methodDropList
							withConstraints: [ :contraint | contraint height: 30 ];
						add: #notFormatedTextPresenter;
						yourself);
				add:
					(SpBoxLayout newVertical
						add:
							(SpBoxLayout newHorizontal
								add: #saveSettingButton;
								add: #removeSettingButton;
								yourself)
							withConstraints: [ :contraint | contraint height: 30 ];
						add: #settingsDropList
							withConstraints: [ :contraint | contraint height: 30 ];
						add: #formatedTextPresenter;
						yourself);
				yourself);
		yourself
]

{ #category : #settings }
BISettingPreviewer2 class >> dialogOpenBIPreviewer [
	^ Smalltalk ui theme
		newRowIn: World
		for:
			{(Smalltalk ui theme buttonLabelForText: 'Open Blue Ink Setting Previewer ').
			self buildOpenBIInspectorButton}
]

{ #category : #'class initialization' }
BISettingPreviewer2 class >> initialize [
    FormaterPrettyPrinter := BIConfigurableFormatter new.
    MethodProvider := BIMethodProvider
]

{ #category : #'instance creation' }
BISettingPreviewer2 class >> open [
	<script>
	| presenter |
	presenter := self new.
	presenter openWithSpec.
	^ presenter
]

{ #category : #'button behavior' }
BISettingPreviewer2 class >> openBIInspectorButtonAction [
	<script>
	self open
]

{ #category : #'button behavior' }
BISettingPreviewer2 class >> openBIInspectorButtonLabel [
	^ 'Open'
]

{ #category : #'button behavior' }
BISettingPreviewer2 class >> openBIInspectorButtonState [
	^ true
]

{ #category : #settings }
BISettingPreviewer2 class >> settingsOn: aBuilder [
	<systemsettings>
	(aBuilder group: #blueInkFormatterExtra)
		target: self;
		parent: #blueInkFormatter;
		label: 'BlueInk Formatting Editor';
		description: 'Open the BlueInk setting previewer to edit the formatting options';
		dialog: [ self dialogOpenBIPreviewer ]

	
]

{ #category : #specs }
BISettingPreviewer2 class >> specLayoutHHizontal [
    ^ SpPanedLayout newHorizontal
        add:
            (SpBoxLayout newVertical
                add:
                    (SpBoxLayout newVertical
                        add:
                            (SpBoxLayout newHorizontal
                                add: #saveSettingButton;
                                add: #removeSettingButton;
                                yourself)
                            withConstraints: [ :contraint | contraint height: 30 ];
                        add: #settingsDropList
                            withConstraints: [ :contraint | contraint height: 30 ];
                        yourself);
                add: #settingsTree;
                yourself);
        add:
            (SpBoxLayout newVertical
                add:
                    (SpBoxLayout newHorizontal
                        add: #saveMethodButton;
                        add: #removeMethodButton;
                        add: #chooseMethodUI;
                        yourself)
                    withConstraints: [ :contraint | contraint height: 30 ];
                add: #methodDropList
                    withConstraints: [ :contraint | contraint height: 30 ];
                add: #notFormatedTextPresenter;
                add: #formatedTextPresenter;
                yourself);
        yourself
]

{ #category : #visiting }
BISettingPreviewer2 >> acceptActionBIChooseMethod: anInstanceOFBIChooseMethodUI [
	anInstanceOFBIChooseMethodUI methodList selection selectedItem
		ifNil: [ self inform: 'you have to select a method' ]
		ifNotNil:
			[ :selectedItem | notFormatedTextPresenter text: selectedItem sourceCode ]
]

{ #category : #visiting }
BISettingPreviewer2 >> acceptActionBICodePresenter: aBICodePresenter [
    "I'm compile a method returning a String at Ston format of the context"

    | string newSettingMethod |
    isSettingModification := true.
    string := String
        streamContents: [ :stream | 
            stream
                nextPutAll: aBICodePresenter codePresenter text;
                cr;
                tab;
                nextPutAll: '^ '.
            (STON
                toStringPretty: formaterPrettyPrinter class defaultPrettyPrintContext)
                storeOn: stream ].
    newSettingMethod := methodProvider class
        >> (methodProvider class compile: string).
    newSettingMethod protocol: 'settings'.
    settingsDropList
        items:
            (settingsDropList listItems
                removeAllSuchThat: [ :item | item selector = newSettingMethod selector ];
                add: newSettingMethod;
                yourself).
    settingsDropList
        selectedIndex:
            ((settingsDropList listItems collect: #selector)
                indexOf: newSettingMethod selector).
    isSettingModification := false
]

{ #category : #'initialization-actions' }
BISettingPreviewer2 >> actionChooseMethodUI [
    chooseMethodUI action: [ SpChooseMethodUI openOn: self ]
]

{ #category : #'initialization-actions' }
BISettingPreviewer2 >> actionMethodDropList [
	methodDropList
		transmitTo: notFormatedTextPresenter
		transform: [ :method | method sourceCode ].
	methodDropList
		transmitTo: formatedTextPresenter
		transform: [ :item | self formatPrettyPrint ]
]

{ #category : #'initialization-actions' }
BISettingPreviewer2 >> actionRemoveMethodButton [
	removeMethodButton
		action: [ methodDropList selectedItem removeFromSystem ]
]

{ #category : #'initialization-actions' }
BISettingPreviewer2 >> actionRemoveSettingButton [
	removeSettingButton
		action: [ isSettingModification := true.
			settingsDropList selectedItem
				ifNil: [ self inform: 'please select a confguration' ]
				ifNotNil: [ :selectedItem | 
					selectedItem removeFromSystem.
					settingsDropList selectedIndex: 1.
					settingsDropList
						items:
							(settingsDropList listItems
								remove: selectedItem;
								yourself)
					].
			isSettingModification := false
			]
]

{ #category : #'initialization-actions' }
BISettingPreviewer2 >> actionSaveMethodButton [
    saveMethodButton
        action: [ | newMethod |
            newMethod := methodProvider
                >> (methodProvider compile: notFormatedTextPresenter text).
            newMethod protocol: 'methods'.
            methodDropList
                selectedIndex:
                    ((methodDropList listItems collect: #selector)
                        indexOf: newMethod selector) ]
]

{ #category : #'initialization-actions' }
BISettingPreviewer2 >> actionSaveSettingButton [
	saveSettingButton action: [ BIInputPresenterUI openOn: self ]
]

{ #category : #'initialization-actions' }
BISettingPreviewer2 >> actionSettingDropList [
    settingsDropList
        whenSelectionChangedDo: [ :setting | 
            | currentContext |
            currentContext := STON
                fromString:
                    (setting selectedItem model
                        valueWithReceiver: methodProvider
                        arguments: #()).
            formaterPrettyPrinter installNewContext: currentContext.
            formatedTextPresenter text: self formatPrettyPrint.
            formaterPrettyPrinter class
                defaultPrettyPrintContext: currentContext.
            settingsTree roots: self getSystemsettingsAsParentName ]
]

{ #category : #accessing }
BISettingPreviewer2 >> chooseMethodUI [
	^ chooseMethodUI
]

{ #category : #'initialization widgets' }
BISettingPreviewer2 >> formatPrettyPrint [
	^ formaterPrettyPrinter format: methodDropList selectedItem ast
]

{ #category : #accessing }
BISettingPreviewer2 >> formatedTextPresenter [
	^ formatedTextPresenter
]

{ #category : #accessing }
BISettingPreviewer2 >> formaterPrettyPrinter [
	^ formaterPrettyPrinter
]

{ #category : #api }
BISettingPreviewer2 >> formaterPrettyPrinter: aPrettyPrinter [ 
	formaterPrettyPrinter := aPrettyPrinter.
	settingsTree roots: self getSystemsettingsAsParentName
]

{ #category : #'initialization widgets' }
BISettingPreviewer2 >> getSystemsettingsAsParentName [
	^ ((SettingTree acceptableKeywords: #(#systemsettings)) nodeList
		select: [ :node | node parentName = formaterPrettyPrinter class settingGroup ])
		asOrderedCollection
]

{ #category : #initialization }
BISettingPreviewer2 >> initialize [
	super initialize.
	isSettingModification := false.
]

{ #category : #'initialization widgets' }
BISettingPreviewer2 >> initializeButtons [
	saveMethodButton label: 'save'.
	removeMethodButton label: 'remove current Method'.
	removeSettingButton label: 'remove setting'.
	saveSettingButton label: 'save'.
	chooseMethodUI label: 'choose another method'
]

{ #category : #initialization }
BISettingPreviewer2 >> initializePresenter [
    self actionMethodDropList.
    self actionRemoveMethodButton.
    self actionSaveMethodButton.
    self actionRemoveSettingButton.
    self actionSaveSettingButton.
    self actionSettingDropList.
    self actionChooseMethodUI
]

{ #category : #initialization }
BISettingPreviewer2 >> initializeWidgets [
    methodProvider := MethodProvider.
    formaterPrettyPrinter := FormaterPrettyPrinter.
    settingsTree := self newTreeTable.
    methodDropList := self newDropList.
    chooseMethodUI := self newButton.
    notFormatedTextPresenter := self newCode.
    formatedTextPresenter := self newCode.
    settingsDropList := self newDropList.
    saveMethodButton := self newButton.
    removeMethodButton := self newButton.
    saveSettingButton := self newButton.
    removeSettingButton := self newButton.
    self initializeButtons.
    self setupMethodDropList.
    self setupSettingsDropList.
    self setupSettingsTree.
    self setupBeforePrettyPrinterCodePresenter.
    self setupAfterPrettyPrinterCodePresenter.
    self unregisterAnnouncement.
    SystemAnnouncer uniqueInstance weak
        when: MethodAdded send: #methodAdded: to: self;
        when: MethodRemoved send: #methodRemoved: to: self;
        when: MethodModified send: #methodModified: to: self.
    self announcer when: WindowClosed send: #onWindowClosed to: self.
    self focusOrder
        add: settingsTree;
        add: chooseMethodUI;
        add: methodDropList;
        add: notFormatedTextPresenter;
        add: formatedTextPresenter
]

{ #category : #initialization }
BISettingPreviewer2 >> initializeWindow: aWindowPresenter [
    aWindowPresenter title: 'Blue Ink Setting Previewer'.
    aWindowPresenter initialExtent: 1000 @ 700
]

{ #category : #'system-Announcement' }
BISettingPreviewer2 >> methodAdded: aMethodAdded [
	isSettingModification ifNil: [ isSettingModification := false ].
	(isSettingModification not
		and: [ aMethodAdded methodOrigin = methodProvider
				or: [ aMethodAdded methodOrigin = methodProvider class ] ])
		ifFalse: [ ^ self ].
	methodDropList
		items:
			(methodDropList listItems
				add: aMethodAdded method;
				yourself)
]

{ #category : #accessing }
BISettingPreviewer2 >> methodDropList [
	^ methodDropList
]

{ #category : #'system-Announcement' }
BISettingPreviewer2 >> methodModified: aModifiedMethod [
	(aModifiedMethod methodOrigin = methodProvider
		and: [ isSettingModification not ])
		ifFalse: [ ^ self ].
	methodDropList
		items:
			(methodDropList listItems
				removeAllSuchThat: [ :method | method selector = aModifiedMethod method selector ];
				add: aModifiedMethod method;
				yourself)
]

{ #category : #accessing }
BISettingPreviewer2 >> methodProvider [
	^ methodProvider
]

{ #category : #api }
BISettingPreviewer2 >> methodProvider: aMethodProvider [
	methodProvider := aMethodProvider.
	methodDropList
		items:
			(methodProvider methods
				select: [ :method | method category = 'methods' ])
				asOrderedCollection.
	settingsDropList
		items:
			(methodProvider class methods
				select: [ :method | method category = 'settings' ])
				asOrderedCollection.
	methodDropList selectedIndex: 1
]

{ #category : #'system-Announcement' }
BISettingPreviewer2 >> methodRemoved: aMethodRemoved [
	(aMethodRemoved methodOrigin = methodProvider
		and: [ isSettingModification not ])
		ifFalse: [ ^ self ].
	methodDropList selectedIndex: 1.
	methodDropList
		items:
			(methodDropList listItems
				removeAllSuchThat: [ :method | method selector = aMethodRemoved method selector ];
				yourself)
]

{ #category : #accessing }
BISettingPreviewer2 >> notFormatedTextPresenter [
	^ notFormatedTextPresenter
]

{ #category : #'system-Announcement' }
BISettingPreviewer2 >> onWindowClosed [
	self unregisterAnnouncement.
]

{ #category : #accessing }
BISettingPreviewer2 >> removeMethodButton [
	^ removeMethodButton
]

{ #category : #accessing }
BISettingPreviewer2 >> removeSettingButton [
	^ removeSettingButton
]

{ #category : #accessing }
BISettingPreviewer2 >> saveMethodButton [
	^ saveMethodButton
]

{ #category : #accessing }
BISettingPreviewer2 >> saveSettingButton [
	^ saveSettingButton
]

{ #category : #accessing }
BISettingPreviewer2 >> settingsDropList [
	^ settingsDropList
]

{ #category : #accessing }
BISettingPreviewer2 >> settingsTree [
	^ settingsTree
]

{ #category : #'initialization widgets' }
BISettingPreviewer2 >> setupAfterPrettyPrinterCodePresenter [
	formatedTextPresenter withSyntaxHighlight.
	formatedTextPresenter text: self formatPrettyPrint
]

{ #category : #'initialization widgets' }
BISettingPreviewer2 >> setupBeforePrettyPrinterCodePresenter [
	notFormatedTextPresenter
		withSyntaxHighlight;
		autoAccept: true.
	notFormatedTextPresenter
		text: methodDropList selectedItem sourceCode
]

{ #category : #'initialization widgets' }
BISettingPreviewer2 >> setupMethodDropList [
	methodDropList
		items:
			(methodProvider methods select: [ :each | each category = 'methods' ])
				asOrderedCollection;
		displayBlock: [ :item | item selector ]
]

{ #category : #'initialization widgets' }
BISettingPreviewer2 >> setupSettingsDropList [
	settingsDropList
		items:
			((methodProvider methods , methodProvider class methods)
				asOrderedCollection select: [ :each | each category = 'settings' ]);
		displayBlock: [ :each | each selector ].
	formaterPrettyPrinter
		installNewContext:
			(STON
				fromString:
					(settingsDropList selectedItem
						valueWithReceiver: settingsDropList selectedItem origin
						arguments: #()))
]

{ #category : #'initialization widgets' }
BISettingPreviewer2 >> setupSettingsTree [
	settingsTree
		roots: self getSystemsettingsAsParentName;
		addColumn: (SpStringTableColumn evaluated: [ :eachItem | eachItem item label ]);
		addColumn:
			(SpImageTableColumn
				evaluated: [ :eachItem | eachItem settingDeclaration inputWidget ])
]

{ #category : #'system-Announcement' }
BISettingPreviewer2 >> unregisterAnnouncement [
SystemAnnouncer uniqueInstance unsubscribe: self  
]

{ #category : #'system-Announcement' }
BISettingPreviewer2 >> whenASettingChanged [
	formatedTextPresenter text: self formatPrettyPrint 
]
