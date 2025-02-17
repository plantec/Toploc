Class {
	#name : #ToMenuPaneEventHandler,
	#superclass : #BlCustomEventHandler,
	#instVars : [
		'target'
	],
	#category : #'Toplo-Widget-Menu-Pane'
}

{ #category : #'api - accessing' }
ToMenuPaneEventHandler >> eventsToHandle [

	^ {
		  BlMouseLeaveEvent.
		  BlMouseOverEvent.
		  ToLayoutOrientationChangedEvent.
		  ToLayoutDirectionChangedEvent.
		  BlLayoutResizerChangedEvent }
]

{ #category : #'event handling' }
ToMenuPaneEventHandler >> layoutDirectionChangedEvent: anEvent [

	anEvent currentTarget configureLayout
]

{ #category : #'event handling' }
ToMenuPaneEventHandler >> layoutOrientationChangedEvent: anEvent [

	target isHorizontal
		ifTrue: [
			target nodeWrapping: false.
			target uniformNodeWidth: false ]
		ifFalse: [
			target nodeWrapping: true.
			target uniformNodeWidth: true ].
	anEvent currentTarget configureLayout
]

{ #category : #'event handling' }
ToMenuPaneEventHandler >> layoutResizerChangedEvent: anEvent [

	anEvent currentTarget configureLayout
]

{ #category : #'event handling' }
ToMenuPaneEventHandler >> mouseLeaveEvent: anEvent [

	target itemBar secondarySelecter deselectAll
]

{ #category : #'event handling' }
ToMenuPaneEventHandler >> mouseOverEvent: anEvent [

	target mouseOverEvent: anEvent
]

{ #category : #'api - hooks' }
ToMenuPaneEventHandler >> onInstalledIn: anElement [

	super onInstalledIn: anElement.
	target := anElement
]

{ #category : #'api - hooks' }
ToMenuPaneEventHandler >> onUninstalledIn: anElement [

	super onUninstalledIn: anElement.
	target := nil
]
