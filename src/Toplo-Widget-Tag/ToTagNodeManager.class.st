Class {
	#name : #ToTagNodeManager,
	#superclass : #ToGenericBarNodeManager,
	#instVars : [
		'compositeNodeBuilder'
	],
	#category : #'Toplo-Widget-Tag-Bar'
}

{ #category : #'t - generic node manager' }
ToTagNodeManager >> buildNode: aNode [ 
	" tagModel can be nil for the fakeNode "
	aNode holder tagModel ifNil: [ ^ self ].
	aNode holder tagModel
		buildNode: aNode
		fromManager: self
]

{ #category : #'node building' }
ToTagNodeManager >> buildNode: aNode forCompositeTagModel: aTagModel [

	compositeNodeBuilder
		value: aNode
		value: aTagModel
		value: aNode holder
]

{ #category : #'node building' }
ToTagNodeManager >> buildNode: aNode forSingleTagModel: aTagModel [

	nodeBuilder value: aNode value: aTagModel data value: aNode holder.
	aNode addEventHandlerOn: ToTagRemovedEvent do: [ :event |
		event consume.
		event currentTarget removeFromBar ]
]

{ #category : #accessing }
ToTagNodeManager >> compositeNodeBuilder: aValuable [

	" aValuable takes the node, then the compositeDataItem then the holder as arguments "
	compositeNodeBuilder := aValuable 
]

{ #category : #initialization }
ToTagNodeManager >> defaultCompositeNodeBuilder [

	^ [ :node :compositeTagModel :holder |
	  node addChild: (ToLabel text: compositeTagModel content asString) ]
]

{ #category : #'t - generic node manager' }
ToTagNodeManager >> defaultNodeBuilder [

	^ [ :node :tagModel :holder |
	  | tag |
	  tag := ToTagElement new
		         labelText: tagModel asString;
		         flexible: true;
		         hMatchParent.
	  tag removable: holder withCloseButton.
	  node addChild: tag.
	  tag constraintsDo: [ :c | c linear vertical alignCenter ] ]
]

{ #category : #'t - generic node manager' }
ToTagNodeManager >> defaultNodeFactory [

	^ [ :holder | ToTagNode new ]
]

{ #category : #initialization }
ToTagNodeManager >> initialize [ 

	super initialize.
	compositeNodeBuilder := self defaultCompositeNodeBuilder
]

{ #category : #initialization }
ToTagNodeManager >> newHolder [

	^ ToTagNodeHolder new
]
