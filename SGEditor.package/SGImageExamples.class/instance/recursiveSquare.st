grammars
recursiveSquare
<script: 'SGImageExamples new recursiveSquare'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 5 by: 1;
		config: (SampleConfigurations new recursiveSquareConfig);
		doNotFilterIntersections;
				pointColour: Color black;
		pointSize: 20;
		lineColour: Color black;
		lineWidth: 6;
		filterReflections;
		background: Color white;
		name: 'recursive_square';
		folder: self baseFolder;
		size: 500@500;
		selector: (SGBalancedSelector new);
		export.