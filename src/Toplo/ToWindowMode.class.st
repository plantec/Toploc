Class {
	#name : #ToWindowMode,
	#superclass : #Object,
	#instVars : [
		'manager'
	],
	#category : #'Toplo-Core-Window-Support'
}

{ #category : #accessing }
ToWindowMode >> element [ 

	^ manager element
]

{ #category : #testing }
ToWindowMode >> isInline [ 

	^ false
]

{ #category : #accessing }
ToWindowMode >> manager: aManager [

	manager := aManager
]

{ #category : #'instance creation' }
ToWindowMode >> newWindow [

	^ self windowClass new
		  manager: manager;
		  yourself
]

{ #category : #'api - hooks' }
ToWindowMode >> onInstalledIn: aManager [

	manager := aManager
]

{ #category : #'api - displaying' }
ToWindowMode >> onMeasure: anExtentMeasurementSpec window: aWindow onEvent: anEvent [

	self subclassResponsibility 
]

{ #category : #'api - hooks' }
ToWindowMode >> onUninstalledIn: aManager [

	manager := nil
]

{ #category : #'window handling' }
ToWindowMode >> startWindow: aWindow [

	self subclassResponsibility 
]

{ #category : #'window handling' }
ToWindowMode >> stopWindow: aWindow [

	self subclassResponsibility 
]

{ #category : #accessing }
ToWindowMode >> windowClass [ 

	^ self subclassResponsibility 
]
