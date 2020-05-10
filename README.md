
```perl6
#!/usr/bin/env raku 

use Physics::Constants;  #<== must use before Physics::Measure 
use Physics::Measure;
use Physics::UnitPostfix;

say ~plancks-h;
say ~faraday-constant;
say ~fine-structure-constant;
say ~μ0;
say ~ℏ;

my \λ = 2.5nm; 
say "Wavelength of photon (λ) is " ~λ;

my \ν = c / λ; 
say "Frequency of photon (ν) is " ~ν.in('petahertz');

my \Ep = ℎ * ν; 
say "Energy of photon (Ep) is " ~Ep.in('attojoules');

#say '----------------';
#say @physics-constants;
#say '----------------';
#say @physics-constants-names.sort;
#say '----------------';
#say @physics-constants-abbreviations.sort;
```

