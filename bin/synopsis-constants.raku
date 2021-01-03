#!/usr/bin/env raku 
use Physics::Constants;  #<== must use before Physics::Measure 
use Physics::Measure :ALL;

$Physics::Measure::round-to = 0.01;

my \λ = 2.5nm; 
my \ν = c / λ; 
my \Ep = ℎ * ν; 

say "Wavelength of photon (λ) is " ~λ;				#2.5 nm
say "Frequency of photon (ν) is " ~ν.norm;			#119.92 petahertz 
say "Energy of photon (Ep) is " ~Ep.norm;			#79.46 attojoule

$Physics::Measure::round-to = Nil;

say ~kg-amu;					#6.02214076e+23 mol^-1  (avogadro number = Na)
say ~plancks-h;                 #6.626070015e-34 J.s
say ~faraday-constant;          #96485.33212 C/mol
say ~fine-structure-constant;   #0.0072973525693   (dimensionless)
say ~μ0;                        #1.25663706212e-06 H/m
say ~ℏ;                         #1.054571817e-34 J.s

say '----------------';
say @physics-constants.sort.join("\n");
say '----------------';
say @physics-constants-abbreviations.sort.join("\n");

