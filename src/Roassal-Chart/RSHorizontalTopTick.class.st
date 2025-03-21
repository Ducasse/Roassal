"
A horizontal tick but in top of the chart, takes values from RSChart, this tick does not use the default scale from the chart. Also this tick decoration does not modify the max and min values from the chart

"
Class {
	#name : 'RSHorizontalTopTick',
	#superclass : 'RSAbstractTick',
	#instVars : [
		'values'
	],
	#category : 'Roassal-Chart-Ticks',
	#package : 'Roassal-Chart',
	#tag : 'Ticks'
}

{ #category : 'rendering' }
RSHorizontalTopTick >> beforeRenderingIn: aChart [

	self createXScale.
	self createYScale
]

{ #category : 'rendering' }
RSHorizontalTopTick >> createTickLineFor: aNumber [
	| value y |
	value := xScale scale: aNumber.
	y := chart extent y negated.
	^ self newLineTick
		startPoint: value @ y;
		endPoint: value @ (y - self configuration tickSize);
		yourself
]

{ #category : 'rendering' }
RSHorizontalTopTick >> createXScale [

	| padding |
	xScale ifNil: [ xScale := NSScale linear ].
	xScale class = NSOrdinalScale ifTrue: [ ^ self ].
	padding := chart padding x.
	xScale
		domain: {
				self min.
				self max };
		range: {
				(0 + padding).
				(chart extent x - padding) }
]

{ #category : 'accessing - defaults' }
RSHorizontalTopTick >> defaultLabelLocation [
	^ RSLocation new above offset: 0@ -3
]

{ #category : 'testing' }
RSHorizontalTopTick >> isHorizontalTick [

	^ true
]

{ #category : 'accessing' }
RSHorizontalTopTick >> max [
	^ values max max: 0
]

{ #category : 'accessing' }
RSHorizontalTopTick >> min [
	^ values min min: 0
]

{ #category : 'rendering' }
RSHorizontalTopTick >> updateChartMaxAndMinValues: aChart [
]

{ #category : 'accessing' }
RSHorizontalTopTick >> values [
	^ values
]

{ #category : 'accessing' }
RSHorizontalTopTick >> values: aCollection [
	values := aCollection
]
