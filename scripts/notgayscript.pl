use strict;
use Irssi;
use vars qw($VERSION %IRSSI);

$VERSION = "0.1";

%IRSSI = (
    authors     => 'Paul Alesius',
    contact     => 'paul@unnservice.com',
    name        => 'notgayscript.pl',
    description => 'This script colors outgoing text that you write.',
    license     => 'BSD',
    url         => 'https://github.com/paulalesius',
    changed     => '2017-05-17',
);

sub colorsend {
        my ($message, $server, $witem) = @_;

	#Irssi::print "Outgoing message: ".$message." server: ".$server." witem: ".$witem;

        $message =~ s/:\)/😊/g;

	my $newmessage = "";
	for my $c (split //, $message) {
		my $rand = int(rand(15));
		#$witem->print("Char: $c Rand: $rand Newmessage: $newmessage");
		$newmessage .= "\003$rand$c";
	}
	
	#$witem->print("Outputting: '$newmessage'");

        Irssi::signal_continue($newmessage, $server, $witem);
}


Irssi::signal_add('send text', \&colorsend);





