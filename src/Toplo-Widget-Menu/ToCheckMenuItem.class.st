Class {
	#name : #ToCheckMenuItem,
	#superclass : #ToToggleMenuItem,
	#category : #'Toplo-Widget-Menu-Items'
}

{ #category : #initialization }
ToCheckMenuItem >> buttonClass [

	^ ToCheckbox
]

{ #category : #'as yet unclassified' }
ToCheckMenuItem >> indeterminateBar [

	^ self button indeterminateBar
]

{ #category : #skin }
ToCheckMenuItem >> newRawSkin [ 

	^ ToCheckMenuItemSkin new
]
