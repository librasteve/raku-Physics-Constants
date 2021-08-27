#!/usr/bin/env raku
#t/13-nrm.t 
#TESTALL$ prove6 ./t      [from root]
use lib '../lib';
use Test;
plan 10;

use Physics::Constants;  #<== must use before Physics::Measure 
use Physics::Measure :ALL;

$Physics::Measure::round-to = 0.01;

my \λ = 2.5nm; 
is ~λ, '2.5 nm',									'~λ';

my \ν = c / λ;  
is ~ν.norm, '119.92 petahertz',						'~ν.norm';

my \Ep = ℎ * ν;  
is ~Ep.norm, '79.46 attojoule',						'~Ep.norm';

is-approx +kg-amu,                  6.02214076e+23,             '≈kg-amu';
is-approx +plancks-h,               6.62607015e-34,             '≈plancks-h'; 
is-approx +faraday-constant,        96485.33212331001,          '≈faraday-constant';
is-approx +fine-structure-constant, 0.0072973525693,            '≈fine-structure-constant'; 
is-approx +μ0,                      1.25663706212e-06,          '≈μ0';
is-approx +ℏ,                       1.0545718176461565e-34,     '≈ℏ'; 
is-approx +c,                       299792458,                  '≈c'; 

#done-testing;
