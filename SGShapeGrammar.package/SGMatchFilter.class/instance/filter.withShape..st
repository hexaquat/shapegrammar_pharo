filters
filter: matches withShape: shape
	| usableRules decomposition sgMatrix blMatrix1 blMatrix2 reject |
	usableRules := matches.
	((rotations or: shearing) or: reflections)
		ifTrue: [ usableRules := usableRules
				reject: [ :match | 
					blMatrix1 := BlMatrix2D new.
					blMatrix2 := BlMatrix2D new.
					sgMatrix := match baseToLocalMatrix getInv.
					blMatrix1 sx: (sgMatrix at: 1 at: 1).
					blMatrix1 sy: (sgMatrix at: 2 at: 2).
					blMatrix1 shx: (sgMatrix at: 1 at: 2).
					blMatrix1 shy: (sgMatrix at: 2 at: 1).
					blMatrix1 x: (sgMatrix at: 1 at: 3).
					blMatrix1 y: (sgMatrix at: 2 at: 3).
					sgMatrix := match subToLocalMatrix.
					blMatrix2 sx: (sgMatrix at: 1 at: 1).
					blMatrix2 sy: (sgMatrix at: 2 at: 2).
					blMatrix2 shx: (sgMatrix at: 1 at: 2).
					blMatrix2 shy: (sgMatrix at: 2 at: 1).
					blMatrix2 x: (sgMatrix at: 1 at: 3).
					blMatrix2 y: (sgMatrix at: 2 at: 3).
					blMatrix1 multiplyBy: blMatrix2.
					decomposition := blMatrix1 decomposition.
					Transcript
						show: 'angle: ';
						show: decomposition angle;
						cr.
					Transcript
						show: 'scale: ';
						show: decomposition scale;
						cr.
					Transcript
						show: 'trasnlation: ';
						show: decomposition translation;
						cr.
					reject := false.
					(rotations and: decomposition angle isZero not)
						ifTrue: [ reject := true ].
					(reflections and: (decomposition scale x < 0 or: decomposition scale y < 0))
						ifTrue: [ reject := true ].
					reject ] ].
	"Check if all points are already present, so no modification is done by geometry, this rule should not be applied in this case"
	usableRules := self filterOnPresentGeometry: usableRules inShape: shape.
	usableRules ifEmpty: [ self error: 'no match present after filtering based on range' ].
	intersection
		ifTrue: [ usableRules := self filterIntersections: usableRules inShape: shape.
			usableRules
				ifEmpty: [ self error: 'no match present after filtering based on intersection' ] ].
	(bounds isNotNil and: (filterAllOutside or: filterSomeOutside))
		ifTrue: [ self filterOnBounds: matches inShape: shape ].
	^ usableRules