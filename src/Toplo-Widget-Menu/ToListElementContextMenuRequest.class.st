Class {
	#name : #ToListElementContextMenuRequest,
	#superclass : #ToContextMenuRequest,
	#instVars : [
		'selectionModel'
	],
	#category : #'Toplo-Widget-Menu-Context menu'
}

{ #category : #accessing }
ToListElementContextMenuRequest >> selectedIndexes [

	^ selectionModel selectedIndexes
]

{ #category : #accessing }
ToListElementContextMenuRequest >> selectionModel [

	^ selectionModel
]

{ #category : #accessing }
ToListElementContextMenuRequest >> selectionModel: aSelectionModel [

	selectionModel := aSelectionModel
]
