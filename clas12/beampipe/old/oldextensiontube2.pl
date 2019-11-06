use strict;
use warnings;

our %configuration;


sub build_extensiontube
{
	my %detector = init_det();
	$detector{"name"}        = "extensiontube";
	$detector{"mother"}      = "root";
	$detector{"description"} = "Extension Tube, Solid023, Solid021, Solid022 face 2";
	$detector{"color"}       = "339999";
	$detector{"type"}        = "Polycone";
	$detector{"pos"}         = "0*mm 0*mm 0*mm";
	$detector{"dimensions"}  = "0*deg 360*deg 4 39.6*mm 39.6*mm 49.2*mm 49.2*mm 50*mm 50*mm 50.8*mm 50.8*mm 1067.21*mm 1409.33*mm 1409.33*mm 2058.92*mm";
	$detector{"material"}    = "G4_STAINLESS-STEEL";
	$detector{"style"}       = 1;
	print_det(\%configuration, \%detector);
}
