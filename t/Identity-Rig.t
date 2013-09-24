# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl Identity-Rig.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 1;
BEGIN { use_ok('Identity::Rig') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $rig = new Identity::Rig;

$rig->generate;

print 'firstname: ' . $rig->get_first . "\n";
print 'lastname: ' . $rig->get_last . "\n";
print 'address: ' . $rig->get_address . "\n";
print 'address number: ' . $rig->get_number . "\n";
print 'street: ' . $rig->get_street . "\n";
print 'city: ' . $rig->get_city . "\n";
print 'state: ' . $rig->get_state . "\n";
print 'zipcode: ' . $rig->get_zipcode . "\n";
print 'phone: ' . $rig->get_phone . "\n";
