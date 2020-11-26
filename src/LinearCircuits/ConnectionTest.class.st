Class {
	#name : #ConnectionTest,
	#superclass : #TestCase,
	#category : #'LinearCircuits-Tests'
}

{ #category : #tests }
ConnectionTest >> testCreationIsOk [

	| c |
	c := Connection P1: 'A' P2: 'B'.
	self assert: c firstPoint equals: 'A'.
	self assert: c lastPoint equals: 'B'
]

{ #category : #tests }
ConnectionTest >> testReverseIsOk [

	| c |
	c := Connection P1: 'A' P2: 'B'.
	self assert: c reverse firstPoint equals: 'B'.
	self assert: c reverse lastPoint equals: 'A'
]
