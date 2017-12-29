grammars
triangleInlayAgeSelector
<script: 'SGImageExamples new triangleInlayAgeSelector'>
| builder |
builder := SGImageBuilder new.
builder from: 1 to: 25 by: 5;
		config: (SampleConfigurations new triangleInlayConfig );
		filterIntersections;
		name: 'triangle_inlay_age_selector';
		folder:'bsc-thesis/bsc-thesis/images/shapegrammars/';
		size: 500@500;
		selector: (SGAgeSelector new);
		export.