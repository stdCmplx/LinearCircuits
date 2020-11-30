"
The set of the points of an circuit.
"
Class {
	#name : #PointsOfCircuit,
	#superclass : #Object,
	#instVars : [
		'points'
	],
	#category : #LinearCircuits
}

{ #category : #accessing }
PointsOfCircuit >> addPoint: aPointOfCircuit [

	(self hasPointOfName: aPointOfCircuit name)
		ifFalse: [ points add: aPointOfCircuit ]
]

{ #category : #accessing }
PointsOfCircuit >> addPointName: aString [

	self addPoint: (PointOfCircuit name: aString)
]

{ #category : #accessing }
PointsOfCircuit >> addPoints: aCollection [

	aCollection do: [ :each | self addPoint: each ]
]

{ #category : #accessing }
PointsOfCircuit >> addPointsNames: aCollection [

	aCollection do: [ :each | self addPointName: each ]
]

{ #category : #accessing }
PointsOfCircuit >> hasPointOfName: aString [

	^ self points anySatisfy: [ :each | each name = aString ]
]

{ #category : #accessing }
PointsOfCircuit >> hasPointsOfNames: aCollection [

	^ aCollection allSatisfy:[ :each | self hasPointOfName: each ]
]

{ #category : #initialization }
PointsOfCircuit >> initialize [

	super initialize.
	points := OrderedCollection new
]

{ #category : #accessing }
PointsOfCircuit >> numberOfPoints [

	^ points size
]

{ #category : #accessing }
PointsOfCircuit >> points [
	^ points
]

{ #category : #accessing }
PointsOfCircuit >> printOn: aStream [

	| s |
	super printOn: aStream.
	s := ',' join: (points collect: [ :each | '(', each name, ',', each value printString, ')' ]).
	aStream nextPutAll: '(', s, ')'
]

{ #category : #accessing }
PointsOfCircuit >> removePoint: aPointOfCircuit [

	self removePointOfName: aPointOfCircuit name
]

{ #category : #accessing }
PointsOfCircuit >> removePointOfName: aString [


	(self hasPointOfName: aString)
		ifTrue: [ points := points reject: [ :each | each name = aString ] ]
]
