Class {
	#name : #ToMenuItemBarElementSkin,
	#superclass : #ToItemBarElementSkin,
	#category : #'Toplo-Widget-Menu-ItemBar'
}

{ #category : #'event handling' }
ToMenuItemBarElementSkin >> installSkinEvent: anEvent [

	super installSkinEvent: anEvent.
	anEvent elementDo: [ :e |
		e padding: BlInsets empty ]
]
