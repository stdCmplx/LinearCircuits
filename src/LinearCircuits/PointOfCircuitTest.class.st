Class {
	#name : #PointOfCircuitTest,
	#superclass : #TestCase,
	#category : #'LinearCircuits-Tests'
}

{ #category : #tests }
PointOfCircuitTest >> testCreationIsOk [

	| p1 p2 |
	p1 := PointOfCircuit name: 'A'.
	self assert: p1 name equals: 'A'.
	self assert: p1 value equals: 0.0.
	p2 := PointOfCircuit name: 'B' value: 3.6.
	self assert: p2 name equals: 'B'.
	self assert: p2 value equals: 3.6
]

{ #category : #tests }
PointOfCircuitTest >> testEqualsPoint [

	| p1 p2 p3 p4 |
	p1 := PointOfCircuit name: 'A'.
	p2 := PointOfCircuit name: 'A' value: 0.0.
	p3 := PointOfCircuit name: 'C' value: 3.6.
	p4 := PointOfCircuit name: 'C' value: 3.6.
	self assert: (p1 equals: p2).
	self assert: (p1 equals: p3) not.
	self assert: (p2 equals: p3) not.
	self assert: (p3 equals: p4)

]

{ #category : #tests }
PointOfCircuitTest >> testSameName [

	| p1 p2 p3 |
	p1 := PointOfCircuit name: 'A'.
	p2 := PointOfCircuit name: 'B' value: 0.0.
	p3 := PointOfCircuit name: 'A' value: 3.6.
	self assert: (p1 sameName: p2) not.
	self assert: (p1 sameName: p3)
]

{ #category : #tests }
PointOfCircuitTest >> testSameValue [

	| p1 p2 p3 |
	p1 := PointOfCircuit name: 'A'.
	p2 := PointOfCircuit name: 'B' value: 0.0.
	p3 := PointOfCircuit name: 'A' value: 3.6.
	self assert: (p1 sameValue: p2).
	self assert: (p1 sameValue: p3) not
]
