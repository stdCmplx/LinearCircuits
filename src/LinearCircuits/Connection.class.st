Class {
	#name : #Connection,
	#superclass : #Object,
	#instVars : [
		'firstPoint',
		'lastPoint'
	],
	#category : #LinearCircuits
}

{ #category : #'instance creation' }
Connection class >> P1: aString1 P2: aString2 [

	^ self new
		firstPoint: aString1;
	   lastPoint: aString2;
		yourself
]

{ #category : #accessing }
Connection >> firstPoint [
	^ firstPoint
]

{ #category : #accessing }
Connection >> firstPoint: aString [
	firstPoint := aString
]

{ #category : #accessing }
Connection >> lastPoint [
	^ lastPoint
]

{ #category : #accessing }
Connection >> lastPoint: aString [
	lastPoint := aString
]

{ #category : #accessing }
Connection >> reverse [

	^ Connection P1: lastPoint P2: firstPoint
]
