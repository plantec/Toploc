Class {
	#name : #ToWindowPlacement,
	#superclass : #ToWindowPreparing,
	#category : #'Toplo-Core-Window-Support'
}

{ #category : #'api - displaying' }
ToWindowPlacement >> positionWindow: aWindow onEvent: anEvent context: aBlElementBoundsUpdateContext [

	self subclassResponsibility 
]
