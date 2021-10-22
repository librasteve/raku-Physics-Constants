unit module Physics::Constants:ver<1.0.1>:auth<Steve Roe (p6steve@furnival.net)>;
#this module transforms unit class Math::Constants:ver<0.1.1>:auth<github:JJ>;
use Physics::MathConstantsWrapper;
use Physics::Measure;

# Updated physical constants from https://nist.gov/cuu/Constants -- CODATA 2018 recommendations
# These values led to the redefinition of the kilogram and ampere in SI on 2019-05-20

# REF: http://www.ebyte.it/library/educards/constants/ConstantsOfPhysicsAndMath.html
# REF: https://en.wikipedia.org/wiki/Mathematical_constant

my %constants-by-name := %Physics::MathConstantsWrapper::constants-by-name;

our @physics-constants is export; 
our @physics-constants-names is export; 
our @physics-constants-abbreviations is export; 

my package EXPORT::DEFAULT {
	for %constants-by-name.kv -> $name, $const {
		@physics-constants.push( "$name => {$const.value} {$const.definition}" );
		@physics-constants-names.push( "$name" );

		my $target;
		if $const.definition {
			$target = Measure.new( "{$const.value} {$const.definition}" )
		} else {
			$target = $const.value 
		} 
		OUR::{$name} := $target;
		
		if $const.abbreviation {
			@physics-constants-abbreviations.push( "{$const.abbreviation} => $name" );
			OUR::{$const.abbreviation} := $target;
		}
	}
}

#EOF
