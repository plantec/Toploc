Class {
	#name : #ToItemNodeManagerForTest,
	#superclass : #ToItemBarNodeManager,
	#category : #'Toplo-Widget-List-Tests-ItemBar'
}

{ #category : #initialization }
ToItemNodeManagerForTest >> defaultFakeDataItem [

	^ ToItemElementForTest new text: 'X'
]

{ #category : #'instance creation' }
ToItemNodeManagerForTest >> newHolder [

	^ ToBarNodeHolderForTest new
]

{ #category : #'instance creation' }
ToItemNodeManagerForTest >> newNodeForHolder: aNodeHolder [

	^ ToItemNodeForTest new
]
