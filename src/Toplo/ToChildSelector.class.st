Class {
	#name : #ToChildSelector,
	#superclass : #ToBinarySelector,
	#instVars : [
		'depth'
	],
	#category : #'Toplo-Core-Selectors'
}

{ #category : #comparing }
ToChildSelector >> = anObject [

	super = anObject ifFalse: [ ^ false ].
	^ self depth = anObject depth
]

{ #category : #visiting }
ToChildSelector >> accept: aVisitor [

	aVisitor visitChildSelector: self
]

{ #category : #accessing }
ToChildSelector >> depth [
	"evaluate only for children at a given depth or at any depth if selector depth is not specified "

	^ depth
]

{ #category : #accessing }
ToChildSelector >> depth: anInteger [
	"evaluate only for children at a given depth or at any depth if selector depth is not specified "

	depth := anInteger
]

{ #category : #comparing }
ToChildSelector >> hash [

	^ super hash bitXor: depth hash
]

{ #category : #initialization }
ToChildSelector >> initialize [ 

	super initialize.
	self left: ToUniversalSelector new.
	depth := nil
]
