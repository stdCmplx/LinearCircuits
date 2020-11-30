"
A point of a circuit.

Messages:
- name: to set the name of the point.  
- value: to set the value of the point.

To create instances:
- name: for the name of the point
- name:value: for the name and the value of the point.

   One simple example is simply gorgeous.
	(PointOfCircuit name: 'A' value: 3.5)

    Instance Variables
		name:		aString
		value:		aDouble

"
Class {
	#name : #PointOfCircuit,
	#superclass : #Object,
	#instVars : [
		'name',
		'value'
	],
	#category : #LinearCircuits
}

{ #category : #'instance creation' }
PointOfCircuit class >> name: aString [

	^ self new name: aString;
		value: 0.0
]

{ #category : #'instance creation' }
PointOfCircuit class >> name: aString value: aDouble [

	^ (self name: aString) value: aDouble
]

{ #category : #accessing }
PointOfCircuit >> equals: aPointOfCircuit [

	(self sameName: aPointOfCircuit) ifTrue: [ ^ self sameValue: aPointOfCircuit ]
		ifFalse: [ ^ false ]
]

{ #category : #accessing }
PointOfCircuit >> name [
	^ name
]

{ #category : #accessing }
PointOfCircuit >> name: aString [
	name := aString
]

{ #category : #accessing }
PointOfCircuit >> printOn: aStream [

	| s |
	super printOn: aStream.
	s := '(', name.
	(value isNil) ifFalse: [ s := s, ',', value printString ].
	s := s, ')'.
	aStream nextPutAll: s
]

{ #category : #accessing }
PointOfCircuit >> sameName: aPointOfCircuit [

	^ name = aPointOfCircuit name
]

{ #category : #accessing }
PointOfCircuit >> sameValue: aPointOfCircuit [

	^ value = aPointOfCircuit value
]

{ #category : #accessing }
PointOfCircuit >> value [
	^ value
]

{ #category : #accessing }
PointOfCircuit >> value: aDouble [
	value := aDouble
]
