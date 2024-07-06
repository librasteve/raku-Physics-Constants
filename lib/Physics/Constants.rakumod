unit module Physics::Constants:ver<1.0.4>:auth<Steve Roe (librasteve@furnival.net)>;
#this module transforms unit class Math::Constants:ver<0.1.1>:auth<github:JJ>;
use Physics::MathConstantsWrapper;
use Physics::Measure;

# Updated physical constants from https://nist.gov/cuu/Constants -- CODATA 2018 recommendations
# These values led to the redefn of the kilogram and ampere in SI on 2019-05-20

# REF: http://www.ebyte.it/library/educards/constants/ConstantsOfPhysicsAndMath.html
# REF: https://en.wikipedia.org/wiki/Mathematical_constant

my %constants-by-name := %Physics::MathConstantsWrapper::constants-by-name;

our @physics-constants is export; 
our @physics-constants-names is export; 
our @physics-constants-symbols is export;

my package EXPORT::DEFAULT {
	for %constants-by-name.kv -> $name, $const {
		@physics-constants.push( "$name => {$const.value} {$const.defn}" );
		@physics-constants-names.push( "$name" );

		OUR::{'&' ~ $name} := sub { Measure.new("{$const.value} {$const.defn}") };


		if $const.symbol {
			@physics-constants-symbols.push("{ $const.symbol } => $name");

			OUR::{'&' ~ $const.symbol} := sub { Measure.new("{ $const.value } { $const.defn }") };
		}

	}
}

#EOF
