package Identity::Rig;

use 5.018001;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

our %EXPORT_TAGS = ( 'all' => [ qw() ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw();

our $VERSION = '0.1';
our $NAME = 'Identity::Rig';

our $fullname='';
our $first = '';
our $last = '';
our $address = '';
our $number='';
our $street='';
our $city='';
our $state='';
our $zipcode='';
our $phone = '';

sub new {  bless {}, shift; }

sub get_name
{
	my $self = shift;
	return ($NAME);
}

sub get_version
{
	my $self = shift;
	return ($VERSION);
}

sub get_fullname { my $self = shift; return ($fullname); }
sub get_first { my $self = shift; return ($first); }
sub get_last { my $self = shift; return ($last); }
sub get_address { my $self = shift; return ($address); }
sub get_number { my $self = shift; return ($number); }
sub get_street { my $self = shift; return ($street); }
sub get_city { my $self = shift; return ($city); }
sub get_state { my $self = shift; return ($state); }
sub get_zipcode { my $self = shift; return ($zipcode); }
sub get_phone { my $self = shift; return ($phone); }

sub generate
{
	my @rig = `rig`;
	
	if ($rig[0] =~ /(\S+) (\S+)/) { $fullname = $rig[0]; $first=$1; $last=$2; }
	if ($rig[1] =~ /(\S+) (\S+)/) { $address = $rig[1]; $number = $1; $street = $2; }
	if ($rig[2] =~ /(\S+)\, (\S+)  (.*)/) { $city = $1; $state = $2; $zipcode = $3; }
	
	$phone=$rig[3] if ($rig[3]);
	
	chomp $fullname;
	chomp $phone;
	chomp $address;
	
	return 1;
}

1;
__END__

=head1 NAME

Identity::Rig - Perl extension for Rig the Random Identity Generator

=head1 SYNOPSIS

  use Identity::Rig;
  my $rig = new Identity::Rig;
  
  $rig->generate;
  print $rig->get_fullname . "\n";

=head1 DESCRIPTION

This module is made for use with games and urtilizes the Rig binary which must already be installed


=head2 EXPORT

None by default.

=head1 SEE ALSO

on debian simply apt-get install rig to install the rig binary

=head1 AUTHOR

none, <lt>The Infinity Network<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2013 by theinfinitynetwork.org

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.1 or,
at your option, any later version of Perl 5 you may have available.


=cut
