[![License: Artistic-2.0](https://img.shields.io/badge/License-Artistic%202.0-0298c3.svg)](https://opensource.org/licenses/Artistic-2.0)
[![raku-physics-constants -> DH](https://github.com/librasteve/raku-Physics-Constants/actions/workflows/constants-weekly.yaml/badge.svg)](https://github.com/librasteve/raku-Physics-Constants/actions/workflows/constants-weekly.yaml)

Bridging physical constants into [Physics::Measure](https://github.com/librasteve/raku-Physics-Measure) objects

# SYNOPSIS

```raku
#!/usr/bin/env raku
use Physics::Constants;  #<== must use before Physics::Measure
use Physics::Measure :ALL;

say ~kg-amu;                        #6.02214076e+26 mol^-1  (avogadro number = Na)
say ~plancks-h;                     #6.626070015e-34 J.s
say ~faraday-constant;              #96485.33212 C/mol
say ~fine-structure-constant;       #0.0072973525693   (dimensionless)
say ~μ0;                            #1.25663706212e-06 H/m
say ~ℏ;                             #1.054571817e-34 J.s

my \λ = 2.5nm;
say "Wavelength of photon (λ) is " ~λ;

my \ν = c/λ;
say "Frequency of photon (ν) is " ~ν.in('petahertz');

my \Ep = ℎ*ν;
say "Energy of photon (Ep) is " ~Ep.in('attojoules');

Wavelength of photon (λ) is 2.5nm
Frequency of photon (ν) is 119.92PHz
Energy of photon (Ep) is 79.46aJ

This module is a wrapper on JJ Merelo Math::Constants
https://github.com/JJ/p6-math-constants
#say '----------------';
#say @physics-constants;
#say '----------------';
#say @physics-constants-names.sort;
#say '----------------';
#say @physics-constants-symbols.sort;
```

Copyright (c) Henley Cloud Consulting Ltd. 2021-2024
