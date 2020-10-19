#!/usr/bin/perl -w


use strict;
use lib ("$ENV{GEMC}/api/perl");
use utils;
use parameters;
use geometry;
use hit;
use bank;
use materials;
use math;

use Math::Trig;

# Help Message
sub help()
{
	print "\n Usage: \n";
	print "   band.pl <configuration filename>\n";
 	print "   Will create BAND and materials\n";
 	print "   Note: The passport and .visa files must be present if connecting to MYSQL. \n\n";
	exit;
}

# Make sure the argument list is correct
if( scalar @ARGV != 1)
{
	help();
	exit;
}

# Loading configuration file and paramters
our %configuration = load_configuration($ARGV[0]);


# Global pars - these should be read by the load_parameters from file or DB
#our %parameters    = get_parameters(%configuration);
# General:
our $inches = 25.4;

# materials
#require "./materials.pl";
require "./band_materials.pl";

# banks definitions
require "./bank.pl";

# hits definitions
require "./hit.pl";

# sensitive geometry
require "./geometry.pl";


# all the scripts must be run for every configuration
my @allConfs = ("original");

# bank definitions commong to all variations
define_bank();

foreach my $conf ( @allConfs )
{
	$configuration{"variation"} = $conf ;

	# materials
	materials();

	# hits
	define_hit();

	# BAND, frame, and lead shielding upstream of target
	# Hole in mother volume allows beampipe to fit through BAND
	build_bandMother();

}



