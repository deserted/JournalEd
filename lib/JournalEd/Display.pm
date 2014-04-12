package JournalEd::Display;
use Mojo::Base 'Mojolicious::Controller';
use Data::Dumper;
use strict;
use warnings;

sub index {
	my $self = shift;
	my $users_rs = $self->db->resultset('User');
	my $user = $users_rs->next;
	$self->render(template => 'index', pagetitle => 'welcome', users => $user->display_name);
}


1;
