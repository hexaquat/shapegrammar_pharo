lineIntersection
doesLineFrom: p1 to: p2 intersectWithLineFrom: p3 to: p4
|equalityRange|
equalityRange := SGMode equalityRange .
"No intersection if any point is shared between lines"
(((p1 = p3) or: (p2 = p3)) or: ((p1 = p4) or: (p2 = p4))) ifTrue: [ ^ false ].
(((p1 equalTo: p3 inRange: equalityRange ) or: (p2 equalTo: p3 inRange: equalityRange )) or: ((p1 equalTo: p4 inRange: equalityRange ) or: (p2 equalTo: p4 inRange: equalityRange))) ifTrue: [ ^ false ].

((((SGLine sideOfPoint: p3 toSegmentFrom:p1  to: p2 ) sign)+((SGLine sideOfPoint: p4 toSegmentFrom: p1   to: p2 ) sign)) = 0) ifFalse:[^ false] ifTrue:[

 ^ (((SGLine sideOfPoint: p1 toSegmentFrom: p3 to: p4 ) sign + (SGLine sideOfPoint: p2 toSegmentFrom: p3  to: p4 ) sign) = 0)

].
 