Class {
	#name : #PointsOfCircuitTest,
	#superclass : #TestCase,
	#category : #'LinearCircuits-Tests'
}

{ #category : #tests }
PointsOfCircuitTest >> testAddPoint [

	| pt pts |
	pt := PointOfCircuit name: 'D' value: 5.5.
	pts := PointsOfCircuit new.
	self assert: (pts hasPointOfName: 'D') not.
	self assert: pts numberOfPoints equals: 0.
	pts := pts addPoint: pt.
	self assert: (pts hasPointOfName: 'D').
	self assert: pts numberOfPoints equals: 1
]

{ #category : #tests }
PointsOfCircuitTest >> testAddPointName [

	| pts |
	pts := PointsOfCircuit new.
	self assert: pts numberOfPoints equals: 0.
	pts addPointName: 'A';
		addPointName: 'B'.
	self assert: pts numberOfPoints equals: 2.
	pts addPointName: 'C'.
	self assert: pts numberOfPoints equals: 3
]

{ #category : #tests }
PointsOfCircuitTest >> testAddPointsNames [

	| pts |
	pts := PointsOfCircuit new addPointsNames: #('A' 'B' 'C' 'D').
	self assert: pts numberOfPoints equals: 4
]

{ #category : #tests }
PointsOfCircuitTest >> testHasPointOfName [

	| pts |
	pts := PointsOfCircuit new.
	pts := pts addPoint: (PointOfCircuit name: 'A').
	pts := pts addPoint: (PointOfCircuit name: 'B').
	self assert: (pts hasPointOfName: 'A').
	self assert: (pts hasPointOfName: 'B').
	self assert: (pts hasPointOfName: 'C') not.
	pts := pts addPoint: (PointOfCircuit name: 'C').
	self assert: (pts hasPointOfName: 'C').
]

{ #category : #tests }
PointsOfCircuitTest >> testHasPointsOfNames [

	| pts |
	pts := PointsOfCircuit new addPointsNames: #('A' 'B' 'C' 'D').
	self assert: (pts hasPointsOfNames: #('B')).
	self assert: (pts hasPointsOfNames: #('D' 'B')).
	self assert: (pts hasPointsOfNames: #('C' 'A' 'B' 'D')).
	self assert: (pts hasPointsOfNames: #('C' 'E' 'A' 'D' 'B')) not.
]

{ #category : #tests }
PointsOfCircuitTest >> testNumberOfPoints [

	| pt pts |
	pt := PointOfCircuit name: 'D' value: 5.5.
	pts := PointsOfCircuit new.
	self assert: pts numberOfPoints equals: 0.
	pts := pts addPoint: pt.
	self assert: pts numberOfPoints equals: 1.
	pts := pts addPoint: pt.
	pts := pts addPoint: pt.
	self assert: pts numberOfPoints equals: 1
]

{ #category : #tests }
PointsOfCircuitTest >> testRemovePointOfName [

	| pts |
	pts := PointsOfCircuit new addPointsNames: #('A' 'B' 'C' 'D').
	self assert: (pts hasPointsOfNames: #('A' 'B' 'C' 'D')).
	self assert: (pts numberOfPoints = 4).
	pts removePointOfName: 'B'.
	self assert: (pts hasPointsOfNames: #('A' 'B' 'C' 'D')) not.
	self assert: (pts numberOfPoints = 3).
	self assert: (pts hasPointsOfNames: #('A' 'C' 'D')).
	pts removePointOfName: 'D'.
	self assert: (pts hasPointsOfNames: #('A' 'C' 'D')) not.
	self assert: (pts numberOfPoints = 2).
	self assert: (pts hasPointsOfNames: #('A' 'C')).
]
