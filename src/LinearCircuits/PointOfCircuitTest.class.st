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
