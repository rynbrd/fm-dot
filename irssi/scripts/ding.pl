use strict;
use vars qw($VERSION %IRSSI);

use Irssi;
$VERSION = '0.0.3';
%IRSSI = (
    authors     => 'Ryan Bourgeois',
    contact     => 'bluedragonx@gmail.com',
    name        => 'ding',
    description => 'Ding on message received.',
    url         => '',
    license     => 'GNU General Public License v2',
    changed     => '$Date: 2013-01-18 12:00:00 +0100 (Fri, 18 Jan 2013) $'
);

sub ding() {
    `ding message`
}

Irssi::signal_add_last("message private", "ding");
