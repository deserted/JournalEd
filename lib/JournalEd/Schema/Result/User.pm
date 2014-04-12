use utf8;
package JournalEd::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

JournalEd::Schema::Result::User

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<users>

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 user_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 username

  data_type: 'varchar'
  is_nullable: 0
  size: 40

=head2 password

  data_type: 'varchar'
  is_nullable: 0
  size: 500

=head2 display_name

  data_type: 'varchar'
  is_nullable: 0
  size: 60

=head2 email

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=cut

__PACKAGE__->add_columns(
  "user_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "username",
  { data_type => "varchar", is_nullable => 0, size => 40 },
  "password",
  { data_type => "varchar", is_nullable => 0, size => 500 },
  "display_name",
  { data_type => "varchar", is_nullable => 0, size => 60 },
  "email",
  { data_type => "varchar", is_nullable => 0, size => 50 },
);

=head1 PRIMARY KEY

=over 4

=item * L</user_id>

=back

=cut

__PACKAGE__->set_primary_key("user_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<username>

=over 4

=item * L</username>

=back

=cut

__PACKAGE__->add_unique_constraint("username", ["username"]);

=head1 RELATIONS

=head2 journals

Type: has_many

Related object: L<JournalEd::Schema::Result::Journal>

=cut

__PACKAGE__->has_many(
  "journals",
  "JournalEd::Schema::Result::Journal",
  { "foreign.author_id" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 pages

Type: has_many

Related object: L<JournalEd::Schema::Result::Page>

=cut

__PACKAGE__->has_many(
  "pages",
  "JournalEd::Schema::Result::Page",
  { "foreign.author_id" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 userroles

Type: has_many

Related object: L<JournalEd::Schema::Result::Userrole>

=cut

__PACKAGE__->has_many(
  "userroles",
  "JournalEd::Schema::Result::Userrole",
  { "foreign.user_id" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2014-04-11 16:56:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:GKoUVwiLEulIoWy/57mlRA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
