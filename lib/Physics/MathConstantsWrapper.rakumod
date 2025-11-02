unit module Physics::MathConstantsWrapper:ver<1.0.7>:auth<Steve Roe (librasteve@furnival.net)>;
#this module wraps unit class Math::Constants:ver<0.1.1>:auth<github:JJ>;

use Math::Constants;

#`[[ 
###Here are examples of defn & export in Math::Constants...

# Physical Constants
my constant plancks-h         is export = 6.626_070_015e-34;   # exact
...

# Mathematical constants
my constant phi               is export = 1.61803398874989e0;
...

# Short names
my constant ℎ is export := plancks-h;
...

###This Physics::MathConstantsWrapper has several functions:
#1 Hide/suppress Math::Constant exports
#2 Select & list Physical Constant subset
#3 Map on to suitable unit defns
#4 Transform to class Constant data structures
#5 Export programmatically for use by Physics::Constants
#]]

# REF: http://www.ebyte.it/library/educards/constants/ConstantsOfPhysicsAndMath.html

my %defns-by-name = (
	plancks-h						=> 'J.s',
	plancks-reduced-h				=> 'J.s',
	speed-of-light-vacuum			=> 'm/s',
	standard-acceleration-gravity	=> 'm/s^2',
	gravitation-constant			=> 'kg^-1.m^3.s^-2',
	gas-constant					=> 'J/kg.mol',
	faraday-constant				=> 'C/mol',
	electron-mass					=> 'kg',
	proton-mass						=> 'kg',
	neutron-mass					=> 'kg',
	alpha-particle-mass				=> 'kg',
	quantum-ratio					=> 'A/J',
	planck-mass						=> 'kg',
	planck-time						=> 's',
	planck-length					=> 'm',
	planck-temperature				=> 'K',
	avogadro-number					=> 'mol',
	kg-amu							=> 'mol^-1',
	coulomb-constant				=> 'N.m^2/C^2',
	fine-structure-constant			=> '①',		#dimensionless
	elementary-charge				=> 'C',
	vacuum-permittivity				=> 'F/m',
	#magnetic-permeability			=> 'H/m',    	#dupe of vacuum-permeability! ##PULLME
	boltzmann-constant				=> 'J/K',
	electron-volt					=> 'J',
	vacuum-permeability				=> 'H/m',
);
my %constants-to-value;
for %defns-by-name.keys -> $n {
	%constants-to-value{$n} = Math::Constants::EXPORT::DEFAULT::{$n};
}

my %symbols-to-name = (   #where available
	c  => 'speed-of-light-vacuum',
	eV => 'electron-volt',
	F  => 'faraday-constant',
	G  => 'gravitation-constant',
	g  => 'standard-acceleration-gravity',
	ℎ  => 'plancks-h',
	ℏ  => 'plancks-reduced-h',
    k  => 'boltzmann-constant',
	K0 => 'coulomb-constant',
	Na => 'avogadro-number',
	lp => 'planck-length',
	mp => 'planck-mass',
    R  => 'gas-constant',
	Tp => 'planck-temperature',
	tp => 'planck-time',
	q  => 'elementary-charge',
	α  => 'fine-structure-constant',
	ε0 => 'vacuum-permittivity',
	μ0 => 'vacuum-permeability',
);
my %symbols-by-name = %symbols-to-name.kv.reverse;

class Constant {
	has $.name;
	has $.value;
	has $.defn;
	has $.symbol;
}

our %constants-by-name;
for %defns-by-name.keys -> $n {
	%constants-by-name{$n} = Constant.new( 
		name    => $n,
		value	=> %constants-to-value{$n},
		defn    => %defns-by-name{$n},
		symbol  => %symbols-by-name{$n},
	)
}
#dd %constants-by-name;

#EOF
