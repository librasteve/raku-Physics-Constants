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


$Physics::Measure::round-to = Nil;

is ~kg-amu,                    '6.02214076e+23 mol^-1', '~kg-amu (Na)';
is ~plancks-h,                 '6.626070015e-34 J.s',	'plancks-h'; 
is ~faraday-constant,          '96485.33212 C/mol',		'faraday-constant';
is ~fine-structure-constant,   '0.0072973525693',		'fine-structure-constant'; 
is ~μ0,                        '1.25663706212e-06 H/m', '~μ0';
is ~ℏ,                         '1.054571817e-34 J.s',	'~ℏ'; 
is ~c,		                   '299792458 m/s',			'~c'; 

#done-testing;
