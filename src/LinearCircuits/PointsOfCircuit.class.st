Class {
	#name : #PointsOfCircuit,
	#superclass : #Object,
	#instVars : [
		'points'
	],
	#category : #LinearCircuits
}

{ #category : #'instance creation' }
PointsOfCircuit class >> addPointsNames: aCollection [

	^ self new points
]

{ #category : #accessing }
PointsOfCircuit >> addPoint: aPointOfCircuit [

	(self hasPointOfName: aPointOfCircuit name)
		ifTrue: [ points add: aPointOfCircuit ]
]

{ #category : #accessing }
PointsOfCircuit >> addPointName: aString [

	points addPoint: (PointOfCircuit name: aString)
]

{ #category : #accessing }
PointsOfCircuit >> addPoints: aCollection [

	aCollection do: [ :each | points addPoint: each ]
]

{ #category : #accessing }
PointsOfCircuit >> addPointsNames: aCollection [

	aCollection do: [ :each | points addPointName: each ]
]

{ #category : #accessing }
PointsOfCircuit >> hasPointOfName: aString [

	^ points anySatisfy: [ :each | each name = aString ]
]

{ #category : #initialization }
PointsOfCircuit >> initialize [

	super initialize.
	points := OrderedCollection new
]

{ #category : #accessing }
PointsOfCircuit >> points [
	^ points
]
