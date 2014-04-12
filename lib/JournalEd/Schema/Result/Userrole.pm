use utf8;
package JournalEd::Schema::Result::Userrole;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

JournalEd::Schema::Result::Userrole

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

=head1 TABLE: C<userroles>

=cut

__PACKAGE__->table("userroles");

=head1 ACCESSORS

=head2 user_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 role_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "user_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "role_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 RELATIONS

=head2 role

Type: belongs_to

Related object: L<JournalEd::Schema::Result::Role>

=cut

__PACKAGE__->belongs_to(
  "role",
  "JournalEd::Schema::Result::Role",
  { id => "role_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 user

Type: belongs_to

Related object: L<JournalEd::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user",
  "JournalEd::Schema::Result::User",
  { user_id => "user_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2014-04-11 16:56:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:o/4VWa3iLCgjuJjnM/6Orw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
