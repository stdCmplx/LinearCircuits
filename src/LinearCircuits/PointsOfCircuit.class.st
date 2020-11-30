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
PointsOfCircuit >> addPointName: aString value: aDouble [

	self addPoint: ((PointOfCircuit name: aString) value: aDouble)
]

{ #category : #accessing }
PointsOfCircuit >> addPointNameValueAsArray: anArray [

	self addPointName: (anArray at: 1) value: (anArray at: 2)
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
PointsOfCircuit >> addPointsNamesValues: aCollection [

	aCollection do: [ :anArray | self addPointNameValueAsArray: anArray ]
]

{ #category : #accessing }
PointsOfCircuit >> getPointName: aString [
	| index |
	index := self indexOfPointName: aString.
	index ~= 0
		ifTrue: [ ^ points at: index ]
		ifFalse: [ ^ nil ]
]

{ #category : #accessing }
PointsOfCircuit >> hasPointOfName: aString [

	^ self points anySatisfy: [ :each | each name = aString ]
]

{ #category : #accessing }
PointsOfCircuit >> hasPointsOfNames: aCollection [

	^ aCollection allSatisfy:[ :each | self hasPointOfName: each ]
]

{ #category : #accessing }
PointsOfCircuit >> indexOfPointName: aString [

	| index |
	index := 0.
	points doWithIndex: [ :p :i | (p name = aString)
		 ifTrue: [ index := i ]].
	^ index
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

	| p | " point p to remove"
	(self hasPointOfName: aString)
		ifTrue: [ p := (points select: [ :each | each name = aString ]) at: 1.
			points := points reject: [ :each | each name = aString ].
			^ p ]
		ifFalse: [ ^ nil ]
		
]

{ #category : #accessing }
PointsOfCircuit >> removePointsOfNames: aCollection [

	| pts | " points pts to remove"
	pts := PointsOfCircuit new.
	aCollection do: [ :each | (self hasPointOfName: each)
		ifTrue: [ pts addPoint: (self removePointOfName: each) ] ].
	(pts numberOfPoints = 0) not ifTrue: [ ^ pts ] ifFalse: [ ^ nil ]
		
]

{ #category : #accessing }
PointsOfCircuit >> setValuePointName: aString value: aDouble [
	| index pt |
	index := self indexOfPointName: aString.
	index ~= 0
		ifTrue: [ pt := points at: index.
			pt value: aDouble.
			points at: index put: pt.
			^ pt]
		ifFalse: [ ^ nil ]
]
