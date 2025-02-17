Class {
	#name : #ToContextMenu,
	#superclass : #ToMenuWindow,
	#traits : 'TToOrientable + TToItemBarOwner + TToMenuItemBarOwner + TToMenuWindowModel',
	#classTraits : 'TToOrientable classTrait + TToItemBarOwner classTrait + TToMenuItemBarOwner classTrait + TToMenuWindowModel classTrait',
	#category : #'Toplo-Widget-Menu-Context menu'
}

{ #category : #accessing }
ToContextMenu >> bar [

	self
		deprecated: 'Use #itemList instead'
		transformWith: '`@rcvr bar' -> '`@rcvr itemList'.

	^ self itemList
]

{ #category : #'t - menu window model' }
ToContextMenu >> close [

	super close
]

{ #category : #'t - menu window model' }
ToContextMenu >> closeWindow [

	self close
]

{ #category : #'api - displaying' }
ToContextMenu >> correctedPositionWithinAnchorRoot [

	| t rect rootRect |
	rect := self measuredBounds inSpace bounds asRectangle.
	rootRect := 0 @ 0 extent: self anchorRoot extent.
	" just translate the position to remain (if possible) within the root bounds "
	t := rect amountToTranslateWithin: rootRect.
	^ self measuredPosition + t
]

{ #category : #initialization }
ToContextMenu >> initialize [

	super initialize.
	self fitContent.
	self initializeAsItemBarOwner.
	self initializeAsMenuItemBarOwner.
	self root addChild: self itemBar
]

{ #category : #testing }
ToContextMenu >> isInline [ 

	^ false
]

{ #category : #testing }
ToContextMenu >> isMenu [

	^ true
]

{ #category : #'t - menu window model' }
ToContextMenu >> isOpened [

	^ super isOpened
]

{ #category : #'t - menu window model' }
ToContextMenu >> isSubmenu [

	^ false
]

{ #category : #'t - menu window model' }
ToContextMenu >> isTopMenu [

	^ true
]

{ #category : #accessing }
ToContextMenu >> itemContainer [

	^ self 
]

{ #category : #'t - orientable - accessing' }
ToContextMenu >> layoutStrategy [

	^ self layout 

	
]

{ #category : #accessing }
ToContextMenu >> menuPane [ 
	" a context menu can't be in a menupane "
	^ nil
]

{ #category : #'t - menu window model' }
ToContextMenu >> menuWindow [

	^ super menuWindow
]

{ #category : #'t - item bar owner - accessing' }
ToContextMenu >> newItemBar [

	^ ToMenuItemBarElement new
]

{ #category : #'t - menu item bar owner - double dispatch' }
ToContextMenu >> onAddedMenu: aMenu [

	aMenu isSubmenu: true.
	aMenu closeOnPicking: false
]

{ #category : #'t - menu item bar owner - double dispatch' }
ToContextMenu >> onRemovedMenu: aMenu [

	aMenu isSubmenu: false.
	aMenu closeOnPicking: false
]

{ #category : #'t - menu window model' }
ToContextMenu >> popupEvent: anEvent [

	^ super popupEvent: anEvent
]

{ #category : #'t - menu window model' }
ToContextMenu >> rootMenu [

	^ self 
]
