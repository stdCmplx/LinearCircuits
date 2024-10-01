Class {
	#name : 'PointsOfCircuitTest',
	#superclass : 'TestCase',
	#category : 'LinearCircuits-Tests',
	#package : 'LinearCircuits',
	#tag : 'Tests'
}

{ #category : 'tests' }
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

{ #category : 'tests' }
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

{ #category : 'tests' }
PointsOfCircuitTest >> testAddPointNameValue [

	| pts |
	pts := PointsOfCircuit new.
	self assert: pts numberOfPoints equals: 0.
	pts addPointName: 'A' value: 4.5;
		addPointName: 'B' value: -3.2.
	self assert: pts numberOfPoints equals: 2.
	pts addPointName: 'C' value: 6.3.
	self assert: pts numberOfPoints equals: 3
]

{ #category : 'tests' }
PointsOfCircuitTest >> testAddPointNameValueAsArray [

	| pts |
	pts := PointsOfCircuit new.
	self assert: pts numberOfPoints = 0.
	pts addPointNameValueAsArray: #('A' 4.3).
	self assert: pts numberOfPoints = 1.
	self assert: (pts points at: 1) name = 'A'.
	self assert: (pts points at: 1) value = 4.3.
	pts addPointNameValueAsArray: #('B' -2.6).
	self assert: pts numberOfPoints = 2.
	self assert: (pts points at: 2) name = 'B'.
	self assert: (pts points at: 2) value = -2.6.
]

{ #category : 'tests' }
PointsOfCircuitTest >> testAddPointsNames [

	| pts |
	pts := PointsOfCircuit new addPointsNames: #('A' 'B' 'C' 'D').
	self assert: pts numberOfPoints equals: 4
]

{ #category : 'tests' }
PointsOfCircuitTest >> testAddPointsNamesValues [

	| pts |
	pts := PointsOfCircuit new.
	self assert: pts numberOfPoints = 0.
	pts addPointsNamesValues: #(#('A' 4.3) #('B' 5.5) #('C' -2.6)).
	self assert: pts numberOfPoints = 3.
	self assert: (pts points at: 1) name = 'A'.
	self assert: (pts points at: 1) value = 4.3.
	self assert: (pts points at: 2) name = 'B'.
	self assert: (pts points at: 2) value = 5.5.
	self assert: (pts points at: 3) name = 'C'.
	self assert: (pts points at: 3) value = -2.6

]

{ #category : 'tests' }
PointsOfCircuitTest >> testGetPointName [

	| pts |
	pts := PointsOfCircuit new addPointsNames: #('A' 'B' 'C' 'D').
	self assert: (pts getPointName: 'B') name = 'B'.
	self assert: (pts getPointName: 'E') = nil.

]

{ #category : 'tests' }
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

{ #category : 'tests' }
PointsOfCircuitTest >> testHasPointsOfNames [

	| pts |
	pts := PointsOfCircuit new addPointsNames: #('A' 'B' 'C' 'D').
	self assert: (pts hasPointsOfNames: #('B')).
	self assert: (pts hasPointsOfNames: #('D' 'B')).
	self assert: (pts hasPointsOfNames: #('C' 'A' 'B' 'D')).
	self assert: (pts hasPointsOfNames: #('C' 'E' 'A' 'D' 'B')) not.
]

{ #category : 'tests' }
PointsOfCircuitTest >> testIndexOfPointName [

	| pts |
	pts := PointsOfCircuit new addPointsNames: #('A' 'B' 'C' 'D').	
	self assert: (pts indexOfPointName: 'A') = 1.
	self assert: (pts indexOfPointName: 'B') = 2.
	self assert: (pts indexOfPointName: 'C') = 3.
	self assert: (pts indexOfPointName: 'D') = 4.
	self assert: (pts indexOfPointName: 'E') = 0.


]

{ #category : 'tests' }
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

{ #category : 'tests' }
PointsOfCircuitTest >> testRemovePointOfName [

	| pts |
	pts := PointsOfCircuit new addPointsNames: #('A' 'B' 'C' 'D').
	self assert: (pts removePointOfName: 'E') equals: nil.
	self assert: (pts hasPointsOfNames: #('A' 'B' 'C' 'D')).
	self assert: (pts numberOfPoints = 4).
	self assert: (pts removePointOfName: 'B') name equals: 'B'.
	self assert: (pts hasPointsOfNames: #('A' 'B' 'C' 'D')) not.
	self assert: (pts numberOfPoints = 3).
	self assert: (pts hasPointsOfNames: #('A' 'C' 'D')).
	self assert: (pts removePointOfName: 'D') name equals: 'D'.
	self assert: (pts hasPointsOfNames: #('A' 'C' 'D')) not.
	self assert: (pts numberOfPoints = 2).
	self assert: (pts hasPointsOfNames: #('A' 'C')).
]

{ #category : 'tests' }
PointsOfCircuitTest >> testRemovePointsOfNames [

	| pts pts2 |
	pts := PointsOfCircuit new addPointsNames: #('A' 'B' 'C' 'D').
	self assert: (pts removePointsOfNames: #('E' 'F')) equals: nil.
	self assert: (pts hasPointsOfNames: #('A' 'B' 'C' 'D')).
	self assert: (pts numberOfPoints = 4).
	pts2 := (pts removePointsOfNames: #('E' 'B' 'F' 'D')).
	self assert: (pts2 numberOfPoints = 2).
	self assert: (pts2 hasPointsOfNames: #('B' 'D')).
	self assert: (pts numberOfPoints = 2).
	self assert: (pts hasPointsOfNames: #('A' 'C')).
]

{ #category : 'tests' }
PointsOfCircuitTest >> testSetValuePointName [

	| pts |
	pts := PointsOfCircuit new addPointsNames: #('A' 'B' 'C' 'D').	
	self assert: (pts getPointName: 'B') name = 'B'.
	self assert: (pts getPointName: 'B') value = 0.
	pts setValuePointName: 'B' value: 2.5.
	self assert: (pts getPointName: 'B') value = 2.5.

]
