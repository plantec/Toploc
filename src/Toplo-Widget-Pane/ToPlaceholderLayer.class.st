Class {
	#name : #ToPlaceholderLayer,
	#superclass : #ToOverlayElement,
	#traits : 'TToElement',
	#classTraits : 'TToElement classTrait',
	#category : #'Toplo-Widget-Pane-Utils'
}

{ #category : #initialization }
ToPlaceholderLayer >> defaultLayout [

	^ BlLinearLayout new
]

{ #category : #initialization }
ToPlaceholderLayer >> initialize [ 

	super initialize.
	self layout: self defaultLayout.
	self initializeForToplo 

	
]
