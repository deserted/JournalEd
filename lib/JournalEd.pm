package JournalEd;
use JournalEd::Schema;
use Mojo::Base 'Mojolicious';

has schema => sub {
	return JournalEd::Schema->connect('dbi:ODBC:DSN=;UID=;PWD=;');
};


# This method will run once at server start
sub startup {
  my $self = shift;
	## Config file plugin
	$self->plugin('Config' => {file => 'config/config.conf'});

	my $schema = JournalEd::Schema->connect('dbi:mysql:database='.$self->config("dbname") .';host='. $self->config("dbhost").';', $self->config("dbuser"), $self->config("dbpass"));
	$self->attr(db => sub {return $schema;} );
	## Set up helper for DB queries
	$self->helper(db => sub { shift->app->db });

	## Set long sessions
	$self->sessions->default_expiration(86400);

	## Set secret
	$self->secrets(['Uck24t7DeL8jzQWs4wdW4pMXFkasdfjn1289']);

	## Load desired plugins


	## Authentication plugin
	## TODO: add in subs for auth check against LDAP, based on http://www.perlmonks.org/?node=327902
	 $self->plugin('authentication' => {
		'autoload_user' => 1,
		'session_key' 	=> 'journaled',
		'load_user'			=> sub {
															my ($self, $username) = @_;
															my $sth = $self->db->resultset('User')->search({ acronym => $username });
															my $user = $sth->next or return;
															return $username if $user->acronym eq $username;
															return;
			},
		'validate_user'	=> sub {
															my ($self, $username, $password) = @_;
															#return $username if  eq $username;
															my $sth = $self->db->resultset('User')->search({ acronym => $username});
															my $user_row = $sth->next; return $username if $user_row->passwd eq $password && $user_row->passwd ne ''; return;
														}
			});
	## Authorization plugin - for support of multiple user groups and RBAC
	$self->plugin('Authorization' => {
		'has_priv'   => sub { my ($self, $priv, $required_privs) = @_; return 1 if $priv >= $required_privs; return; },
		'is_role'    => sub { ... },
		'user_privs' => sub { ... },
		'user_role'  => sub { my $self = shift; my $username = $self->current_user; my $sth = $self->db->resultset('UserRole')->search({ acronym => $username}); my $row = $sth->next or return 'Department User'; my $group = $self->db->resultset('Role')->find({group_no => $row->group_no }); return $group->group_name if $group; return 'P User';},
	});



	## Rendering plugins
	my $tmpl_dir = '../../templates';
	$self->plugin(tt_renderer => {
		INCLUDE_PATH => $tmpl_dir,
		});

	$self->renderer->default_handler('tt');
  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('Display#index');
}

1;
