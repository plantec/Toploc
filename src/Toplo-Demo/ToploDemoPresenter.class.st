Class {
	#name : #ToploDemoPresenter,
	#superclass : #BlDemoPresenter,
	#category : #'Toplo-Demo'
}

{ #category : #demos }
ToploDemoPresenter class >> demo1 [

	<demo>

	^ ToAlbum new
		withRowNumbers;
		text: String loremIpsum asRopedText;
		yourself
]

{ #category : #demos }
ToploDemoPresenter class >> demo2 [

	<demo>
	| list colorAssociations |
	(list := ToListElement new) nodeBuilder: [ :node :dataItem :holder |
		node addChild: (ToLabeledIcon new
				 label: (ToLabel new
						  text: dataItem key;
						  yourself);
				 icon: (ToElement new
						  size: 50 @ 20;
						  background: dataItem value;
						  yourself);
				 startInterspace: 3;
				 yourself) ].
	list primarySelectionMode disable.
	colorAssociations := Array streamContents: [ :stream |
		                     Color registeredColorNames sorted do: [
			                     :colorName |
			                     | color expression |
			                     color := Color named: colorName.
			                     expression := color printString.
			                     stream nextPut: expression -> color.
			                     #( lighter twiceLighter whiter paler darker
			                        twiceDarker blacker duller ) do: [
				                     :transformationSelector |
				                     stream nextPut: ('{1} {2}' format: {
							                      expression.
							                      transformationSelector })
					                     -> (color perform: transformationSelector) ] ] ].
	list dataAccessor addAll: colorAssociations.
	^ list
]

{ #category : #demos }
ToploDemoPresenter class >> demo3 [

	<demo>
	| containerElement radioButtonLightTheme radioButtonDarkTheme checkableGroup |
	(containerElement := ToElement new)
		constraintsDo: [ :constraints |
			constraints horizontal matchParent.
			constraints vertical matchParent ];
		layout: BlLinearLayout vertical;
		padding: (BlInsets all: 10).
	(radioButtonLightTheme := ToRadioButton new)
		labelText: 'Light theme';
		checked: true.
	(radioButtonDarkTheme := ToRadioButton new) labelText: 'Dark theme'.
	(checkableGroup := ToCheckableGroup new)
		withStrictCheckingStrategy;
		registerAll: {
				radioButtonLightTheme.
				radioButtonDarkTheme };
		addEventHandler: (BlEventHandler
				 on: ToCheckableGroupChangedEvent
				 do: [ :event |
					 containerElement space toTheme:
							 (event checkedList anyOne = radioButtonLightTheme
								  ifTrue: [ ToRawTheme new ]
								  ifFalse: [ ToRawDarkTheme new ]) ]).
	containerElement addChildren: checkableGroup registeredCheckables.
	^ containerElement
]

{ #category : #running }
ToploDemoPresenter class >> menuCommandOn: aBuilder [

	<worldMenu>

	(aBuilder item: #'Open Toplo Demo')
		action: [ self open ];
		parent: #Help;
		iconName: #group;
		withSeparatorAfter
]

{ #category : #running }
ToploDemoPresenter class >> open [

	<script>

	super open
]

{ #category : #private }
ToploDemoPresenter >> drawOnCanvas: anElement [

	self canva space toTheme: ToRawTheme new.
	super drawOnCanvas: anElement.
]

{ #category : #accessing }
ToploDemoPresenter >> packagesToCollect [

	^ self packageOrganizer packages select: [ :package |
		package name includesSubstring: 'Toplo' ]
]

{ #category : #accessing }
ToploDemoPresenter >> title [

	^ 'Toplo Demo'
]
